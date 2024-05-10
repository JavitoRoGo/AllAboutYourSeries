//
//  TVSerieLogic.swift
//  AllAboutYourSeries
//
//  Created by Javier Rodríguez Gómez on 1/5/24.
//

import SwiftData
import SwiftUI

@Observable
final class TVSerieLogic {
	static let shared = TVSerieLogic()
	let interactor: TVDataDownloader
	
	init(interactor: TVDataDownloader = TVDownloader.shared) {
		self.interactor = interactor
	}
	
	func downloadSerie(id: Int) async throws -> TVSerieDTO {
		try await interactor.getTVSerie(id: id)
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
			context.delete(fetch)
		} else {
			let new = TVSerie(id: id, details: serie.details.toTVDetail, cast: serie.cast.map(\.toCastCrew), crew: serie.crew.map(\.toCastCrew), seasons: serie.seasons.map(\.toTVSeason))
			context.insert(new)
		}
	}
}
