//
//  TVSeason.swift
//  AllAboutYourSeries
//
//  Created by Javier Rodríguez Gómez on 30/4/24.
//

import Foundation

// MARK: - TVSeason
struct TVSeason: Codable, Identifiable {
	let id: Int
	let airDate: String
	let episodes: [TVEpisode]
	let name, overview: String
	let posterPath: String?
	let seasonNumber: Int
	let voteAverage: Double
	
	enum CodingKeys: String, CodingKey {
		case id
		case airDate = "air_date"
		case episodes, name, overview
		case posterPath = "poster_path"
		case seasonNumber = "season_number"
		case voteAverage = "vote_average"
	}
}
