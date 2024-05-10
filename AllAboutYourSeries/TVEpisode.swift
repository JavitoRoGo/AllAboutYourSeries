//
//  TVEpisode.swift
//  AllAboutYourSeries
//
//  Created by Javier Rodríguez Gómez on 5/5/24.
//

import Foundation
import SwiftData

@Model
final class TVEpisode {
	@Attribute(.unique) let id: UUID
	let airDate: String
	let episodeNumber: Int
	let name: String
	let overview: String
	let runtime: Int?
	let seasonNumber: Int
	let stillPath: String?
	let voteAverage: Double
	var season: TVSeason?
	
	init(id: UUID = UUID(), airDate: String, episodeNumber: Int, name: String, overview: String, runtime: Int?, seasonNumber: Int, stillPath: String?, voteAverage: Double) {
		self.id = id
		self.airDate = airDate
		self.episodeNumber = episodeNumber
		self.name = name
		self.overview = overview
		self.runtime = runtime
		self.seasonNumber = seasonNumber
		self.stillPath = stillPath
		self.voteAverage = voteAverage
	}
}

extension TVEpisode {
	var toDTO: TVEpisodeDTO {
		TVEpisodeDTO(dbid: nil, airDate: airDate, episodeNumber: episodeNumber, name: name, overview: overview, runtime: runtime, seasonNumber: seasonNumber, stillPath: stillPath, voteAverage: voteAverage)
	}
}
