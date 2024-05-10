//
//  TVDetailDTO.swift
//  AllAboutYourSeries
//
//  Created by Javier Rodríguez Gómez on 30/4/24.
//

import Foundation

// MARK: - TVDetailDTO
struct TVDetailDTO: Codable {
	let id: Int
	let backdropPath: String?
	let firstAirDate: String
	let inProduction: Bool
	let lastAirDate: String
	let name: String
	let networks: [NetworkDTO]
	let numberOfEpisodes, numberOfSeasons: Int
	let overview: String
	let posterPath: String?
	let productionCompanies: [NetworkDTO]
	let tagline: String
	let voteAverage: Double
	
	enum CodingKeys: String, CodingKey {
		case backdropPath = "backdrop_path"
		case firstAirDate = "first_air_date"
		case id
		case inProduction = "in_production"
		case lastAirDate = "last_air_date"
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

extension TVDetailDTO {
	var toTVDetail: TVDetail {
		TVDetail(id: id, backdropPath: backdropPath, firstAirDate: firstAirDate, inProduction: inProduction, lastAirDate: lastAirDate, name: name, networks: networks.map(\.toNetwork), numberOfEpisodes: numberOfEpisodes, numberOfSeasons: numberOfSeasons, overview: overview, posterPath: posterPath, productionCompanies: productionCompanies.map(\.toNetwork), tagline: tagline, voteAverage: voteAverage)
	}
}

// MARK: - NetworkDTO
struct NetworkDTO: Codable, Identifiable {
	let id: Int
	let logoPath: String?
	let name: String
	
	enum CodingKeys: String, CodingKey {
		case id
		case logoPath = "logo_path"
		case name
	}
}

extension NetworkDTO {
	var toNetwork: Network {
		Network(id: id, logoPath: logoPath, name: name)
	}
}
