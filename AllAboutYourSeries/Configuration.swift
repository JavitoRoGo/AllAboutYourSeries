//
//  Configuration.swift
//  AllAboutYourSeries
//
//  Created by Javier Rodríguez Gómez on 30/4/24.
//

import Foundation

struct APIImageConfiguration: Codable {
	let images: ImageConfiguration
}

struct ImageConfiguration: Codable {
	let baseURL: String
	let secureBaseURL: String
	let backdropSizes, logoSizes, posterSizes, profileSizes, stillSizes: [String]
	
	enum CodingKeys: String, CodingKey {
		case baseURL = "base_url"
		case secureBaseURL = "secure_base_url"
		case backdropSizes = "backdrop_sizes"
		case logoSizes = "logo_sizes"
		case posterSizes = "poster_sizes"
		case profileSizes = "profile_sizes"
		case stillSizes = "still_sizes"
	}
}
