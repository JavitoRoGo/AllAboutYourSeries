//
//  TVDetail.swift
//  AllAboutYourSeries
//
//  Created by Javier Rodríguez Gómez on 30/4/24.
//

import Foundation

// MARK: - TVDetail
struct TVDetail: Codable {
	let id: Int
	let backdropPath: String?
	let createdBy: [CreatedBy]
	let firstAirDate: String
	let inProduction: Bool
	let lastAirDate: String
	let lastEpisodeToAir: TVEpisode
	let name: String
	let networks: [Network]
	let numberOfEpisodes, numberOfSeasons: Int
	let overview: String
	let posterPath: String?
	let productionCompanies: [Network]
	let tagline: String
	let voteAverage: Double
	
	enum CodingKeys: String, CodingKey {
		case backdropPath = "backdrop_path"
		case createdBy = "created_by"
		case firstAirDate = "first_air_date"
		case id
		case inProduction = "in_production"
		case lastAirDate = "last_air_date"
		case lastEpisodeToAir = "last_episode_to_air"
		case name
		case networks
		case numberOfEpisodes = "number_of_episodes"
		case numberOfSeasons = "number_of_seasons"
		case overview
		case posterPath = "poster_path"
		case productionCompanies = "production_companies"
		case tagline
		case voteAverage = "vote_average"
	}
}

// MARK: - CreatedBy
struct CreatedBy: Codable {
	let id: Int
	let name: String
	let profilePath: String?
	
	enum CodingKeys: String, CodingKey {
		case id
		case name
		case profilePath = "profile_path"
	}
}

// MARK: - Network
struct Network: Codable, Identifiable {
	let id: Int
	let logoPath: String?
	let name: String
	
	enum CodingKeys: String, CodingKey {
		case id
		case logoPath = "logo_path"
		case name
	}
}
