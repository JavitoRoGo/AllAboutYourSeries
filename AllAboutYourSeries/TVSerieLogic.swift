//
//  TVSerieLogic.swift
//  AllAboutYourSeries
//
//  Created by Javier Rodríguez Gómez on 1/5/24.
//

import SwiftData
import SwiftUI
import OSLog

@Observable
final class TVSerieLogic {
	static let shared = TVSerieLogic()
	let interactor: TVDataDownloader
	private let logger = Logger.serieLogic
	
	init(interactor: TVDataDownloader = TVDownloader.shared) {
		self.interactor = interactor
	}
	
	func downloadSerie(id: Int) async throws -> TVSerieDTO {
		let serie = try await interactor.getTVSerie(id: id)
		logger.info("Downloaded seasons: \(serie.seasons.count)")
		return serie
	}
	
	func searchSeries(text: String) async throws -> [TVSerieSearches] {
		try await interactor.searchForSeries(text: text)
	}
	
	func setFavorite(serie: TVSerieDTO, context: ModelContext) throws {
		let id = serie.id
		let query = FetchDescriptor<TVSerie>(predicate:
			#Predicate { $0.id == id }
		)
		if let fetch = try context.fetch(query).first {
			logger.info("Found serie with \(fetch.seasons.count) seasons to delete from favorites")
			context.delete(fetch)
		} else {
			logger.info("\(serie.seasons.count) seasons in serie to set as favorite")
			let seasons = serie.seasons.map { $0.toTVSeason }
			logger.info("\(seasons.count) seasons mapped to TVSeason")
			let new = TVSerie(id: id, details: serie.details.toTVDetail, cast: serie.cast.map(\.toCastCrew), crew: serie.crew.map(\.toCastCrew), seasons: seasons)
			context.insert(new)
			new.seasons.forEach { season in
				season.episodes.forEach { episode in
					episode.tvseason = season
				}
				season.serie = new
			}
			
			if let seasonsFetch = try context.fetch(query).first {
				logger.info("\(seasonsFetch.seasons.count) seasons in new serie set as favorite")
			}
		}
	}
}
