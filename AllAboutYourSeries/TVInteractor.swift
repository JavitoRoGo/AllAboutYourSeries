//
//  TVInteractor.swift
//  AllAboutYourSeries
//
//  Created by Javier Rodríguez Gómez on 30/4/24.
//

import Foundation
import JSONLibrary

protocol TVDataDownloader {
	func getDetails(id: Int) async throws -> TVDetail
	func getCredits(id: Int) async throws -> (cast: [CastCrew], crew: [CastCrew])
	func getSeason(id: Int, number: Int) async throws -> TVSeason
	func getSeasons(id: Int, numberOfSeasons: Int) async throws -> [TVSeason]
	func getTVSerie(id: Int) async throws -> TVSerie
	func searchForSeries(text: String) async throws -> [TVSerieSearches]
}

struct TVDownloader: TVDataDownloader, NetworkInteractor {
	static let shared = TVDownloader()
	private let appConfig = AppConfig.shared
	
	private init() {}
	
	let session: URLSession = .shared
	
	func getDetails(id: Int) async throws -> TVDetail {
		try await getJSON(request: .get(url: .serieDetails(id: id), token: appConfig.APIKEY), type: TVDetail.self)
	}
	
	func getCredits(id: Int) async throws -> (cast: [CastCrew], crew: [CastCrew]) {
		let castCrew = try await getJSON(request: .get(url: .serieCredits(id: id), token: appConfig.APIKEY), type: TVCreditsDTO.self)
		return (castCrew.cast, castCrew.crew)
	}
	
	func getSeason(id: Int, number: Int) async throws -> TVSeason {
		try await getJSON(request: .get(url: .serieSeason(id: id, number: number), token: appConfig.APIKEY), type: TVSeason.self)
	}
	
	func getSeasons(id: Int, numberOfSeasons: Int) async throws -> [TVSeason] {
		var result: [TVSeason] = []
		result.reserveCapacity(numberOfSeasons)
		
		do {
			let season0 = try await getSeason(id: id, number: 0)
			result.append(season0)
		} catch { }
		
		try await withThrowingTaskGroup(of: TVSeason.self) { group in
			for season in 1...numberOfSeasons {
				group.addTask(priority: .high) {
					try await getSeason(id: id, number: season)
				}
			}
			for try await season in group {
				result.append(season)
			}
		}
		
		return result
	}
	
	func getTVSerie(id: Int) async throws -> TVSerie {
		let details = try await getDetails(id: id)
		async let creditsRequest = getCredits(id: id)
		async let seasonsRequest = getSeasons(id: id, numberOfSeasons: details.numberOfSeasons)
		let (castcrew, seasons) = try await (creditsRequest, seasonsRequest)
		return TVSerie(
			id: id,
			details: details,
			cast: castcrew.cast,
			crew: castcrew.crew,
			seasons: seasons
		)
	}
	
	func searchForSeries(text: String) async throws -> [TVSerieSearches] {
		try await getJSON(request: .get(url: .searchURL(text: text), token: appConfig.APIKEY), type: GlobalSearch.self).results
	}
}
