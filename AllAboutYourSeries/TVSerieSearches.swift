//
//  TVSerieSearches.swift
//  AllAboutYourSeries
//
//  Created by Javier Rodríguez Gómez on 3/5/24.
//

import Foundation

struct GlobalSearch: Codable {
	let results: [TVSerieSearches]
}

struct TVSerieSearches: Codable, Identifiable {
	let id: Int
	let name: String
	let posterPath: String?
	
	enum CodingKeys: String, CodingKey {
		case id
		case name
		case posterPath = "poster_path"
	}
}
