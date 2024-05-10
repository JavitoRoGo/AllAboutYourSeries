//
//  TVSeason.swift
//  AllAboutYourSeries
//
//  Created by Javier Rodríguez Gómez on 5/5/24.
//

import Foundation
import SwiftData

@Model
final class TVSeason {
	@Attribute(.unique) let id: UUID
	let airDate: String
	let episodes: [TVEpisode]
	let name: String
	let overview: String
	let posterPath: String?
	let seasonNumber: Int
	let voteAverage: Double
	var serie: TVSerie?
	
	init(id: UUID = UUID(), airDate: String, episodes: [TVEpisode], name: String, overview: String, posterPath: String?, seasonNumber: Int, voteAverage: Double) {
		self.id = id
		self.airDate = airDate
		self.episodes = episodes
		self.name = name
		self.overview = overview
		self.posterPath = posterPath
		self.seasonNumber = seasonNumber
		self.voteAverage = voteAverage
	}
}

extension TVSeason {
	var toDTO: TVSeasonDTO {
		TVSeasonDTO(dbid: nil, airDate: airDate, episodes: episodes.map(\.toDTO), name: name, overview: overview, posterPath: posterPath, seasonNumber: seasonNumber, voteAverage: voteAverage)
	}
}
