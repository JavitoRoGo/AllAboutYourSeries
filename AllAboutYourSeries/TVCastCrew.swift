//
//  TVCastCrew.swift
//  AllAboutYourSeries
//
//  Created by Javier Rodríguez Gómez on 5/5/24.
//

import Foundation
import SwiftData

@Model
final class CastCrew {
	@Attribute(.unique) let id: UUID
	let name: String
	let profilePath: String?
	let character: String?
	let order: Int?
	let department: String?
	let job: String?
	var serie: TVSerie?
	
	init(id: UUID = UUID(), name: String, profilePath: String?, character: String?, order: Int?, department: String?, job: String?) {
		self.id = id
		self.name = name
		self.profilePath = profilePath
		self.character = character
		self.order = order
		self.department = department
		self.job = job
	}
}

extension CastCrew {
	var toDTO: CastCrewDTO {
		CastCrewDTO(dbid: nil, name: name, profilePath: profilePath, character: character, order: order, department: department, job: job)
	}
}
