//
//  TVEpisodeDTO.swift
//  AllAboutYourSeries
//
//  Created by Javier Rodríguez Gómez on 30/4/24.
//

import Foundation

// MARK: - Episode
struct TVEpisodeDTO: Codable, Identifiable {
	let id = UUID()
	let dbid: Int?
	let airDate: String
	let episodeNumber: Int
	let name, overview: String
	let runtime: Int?
	let seasonNumber: Int
	let stillPath: String?
	let voteAverage: Double
	
	enum CodingKeys: String, CodingKey {
		case dbid = "id"
		case airDate = "air_date"
		case episodeNumber = "episode_number"
		case name, overview
		case runtime
		case seasonNumber = "season_number"
		case stillPath = "still_path"
		case voteAverage = "vote_average"
	}
}

extension TVEpisodeDTO {
	var toTVEpisode: TVEpisode {
		TVEpisode(id: id, airDate: airDate, episodeNumber: episodeNumber, name: name, overview: overview, runtime: runtime, seasonNumber: seasonNumber, stillPath: stillPath, voteAverage: voteAverage)
	}
}
