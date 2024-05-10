//
//  TVCreditsDTO.swift
//  AllAboutYourSeries
//
//  Created by Javier Rodríguez Gómez on 30/4/24.
//

import Foundation

// MARK: - TVCreditsDTO
struct TVCreditsDTO: Codable {
	let id: Int
	let cast, crew: [CastCrewDTO]
}

// MARK: - Cast
struct CastCrewDTO: Codable, Identifiable {
	let id = UUID()
	let dbid: Int?
	let name: String
	let profilePath: String?
	let character: String?
	let order: Int?
	let department, job: String?
	
	enum CodingKeys: String, CodingKey {
		case dbid = "id"
		case name
		case profilePath = "profile_path"
		case character
		case order, department, job
	}
}

extension CastCrewDTO {
	var toCastCrew: CastCrew {
		CastCrew(id: id, name: name, profilePath: profilePath, character: character, order: order, department: department, job: job)
	}
}
