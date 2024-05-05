//
//  TVEpisode.swift
//  AllAboutYourSeries
//
//  Created by Javier Rodríguez Gómez on 30/4/24.
//

import Foundation

// MARK: - Episode
struct TVEpisode: Codable, Identifiable {
	let id: Int
	let airDate: String
	let episodeNumber: Int
	let name, overview: String
	let runtime: Int?
	let seasonNumber: Int
	let stillPath: String?
	let voteAverage: Double
	
	enum CodingKeys: String, CodingKey {
		case airDate = "air_date"
		case episodeNumber = "episode_number"
		case id, name, overview
		case runtime
		case seasonNumber = "season_number"
		case stillPath = "still_path"
		case voteAverage = "vote_average"
	}
}
