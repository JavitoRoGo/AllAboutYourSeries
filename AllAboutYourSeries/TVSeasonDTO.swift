//
//  TVSeasonDTO.swift
//  AllAboutYourSeries
//
//  Created by Javier Rodríguez Gómez on 30/4/24.
//

import Foundation

// MARK: - TVSeasonDTO
struct TVSeasonDTO: Codable, Identifiable, Hashable {
	let id = UUID()
	let dbid: Int?
	let airDate: String
	let episodes: [TVEpisodeDTO]
	let name, overview: String
	let posterPath: String?
	let seasonNumber: Int
	let voteAverage: Double
	
	enum CodingKeys: String, CodingKey {
		case dbid = "id"
		case airDate = "air_date"
		case episodes, name, overview
		case posterPath = "poster_path"
		case seasonNumber = "season_number"
		case voteAverage = "vote_average"
	}
}

extension TVSeasonDTO {
	var toTVSeason: TVSeason {
		TVSeason(id: id, airDate: airDate, episodes: episodes.map(\.toTVEpisode), name: name, overview: overview, posterPath: posterPath, seasonNumber: seasonNumber, voteAverage: voteAverage)
	}
	
	var episodesSorted: [TVEpisodeDTO] {
		episodes.sorted {
			$0.episodeNumber < $1.episodeNumber
		}
	}
}
