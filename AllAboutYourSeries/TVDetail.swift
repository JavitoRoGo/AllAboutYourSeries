//
//  TVDetail.swift
//  AllAboutYourSeries
//
//  Created by Javier Rodríguez Gómez on 5/5/24.
//

import Foundation
import SwiftData

@Model
final class TVDetail {
	let id: Int
	let backdropPath: String?
	let firstAirDate: String
	let inProduction: Bool
	let lastAirDate: String
	let name: String
	let networks: [Network]
	let numberOfEpisodes: Int
	let numberOfSeasons: Int
	let overview: String
	let posterPath: String?
	let productionCompanies: [Network]
	let tagline: String
	let voteAverage: Double
	var serie: TVSerie?
	
	init(id: Int, backdropPath: String?, firstAirDate: String, inProduction: Bool, lastAirDate: String, name: String, networks: [Network], numberOfEpisodes: Int, numberOfSeasons: Int, overview: String, posterPath: String?, productionCompanies: [Network], tagline: String, voteAverage: Double) {
		self.id = id
		self.backdropPath = backdropPath
		self.firstAirDate = firstAirDate
		self.inProduction = inProduction
		self.lastAirDate = lastAirDate
		self.name = name
		self.networks = networks
		self.numberOfEpisodes = numberOfEpisodes
		self.numberOfSeasons = numberOfSeasons
		self.overview = overview
		self.posterPath = posterPath
		self.productionCompanies = productionCompanies
		self.tagline = tagline
		self.voteAverage = voteAverage
	}
}

extension TVDetail {
	var toDTO: TVDetailDTO {
		TVDetailDTO(id: id, backdropPath: backdropPath, firstAirDate: firstAirDate, inProduction: inProduction, lastAirDate: lastAirDate, name: name, networks: networks.map(\.toDTO), numberOfEpisodes: numberOfEpisodes, numberOfSeasons: numberOfSeasons, overview: overview, posterPath: posterPath, productionCompanies: productionCompanies.map(\.toDTO), tagline: tagline, voteAverage: voteAverage)
	}
}


@Model
final class Network {
	let id: Int
	let logoPath: String?
	let name: String
	var detail: TVDetail?
	
	init(id: Int, logoPath: String?, name: String) {
		self.id = id
		self.logoPath = logoPath
		self.name = name
	}
}

extension Network {
	var toDTO: NetworkDTO {
		NetworkDTO(id: id, logoPath: logoPath, name: name)
	}
}
