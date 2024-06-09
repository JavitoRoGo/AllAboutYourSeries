//
//  TVSerie.swift
//  AllAboutYourSeries
//
//  Created by Javier Rodríguez Gómez on 1/5/24.
//

import Foundation
import SwiftData

@Model
final class TVSerie {
	@Attribute(.unique) let id: Int
	@Relationship(deleteRule: .cascade) var details: TVDetail
	@Relationship(deleteRule: .cascade) var cast: [CastCrew]
	@Relationship(deleteRule: .cascade) var crew: [CastCrew]
	@Relationship(deleteRule: .cascade, inverse: \TVSeason.serie) var seasons: [TVSeason]
	
	init(id: Int, details: TVDetail, cast: [CastCrew], crew: [CastCrew], seasons: [TVSeason]) {
		self.id = id
		self.details = details
		self.cast = cast
		self.crew = crew
		self.seasons = seasons
	}
}

extension TVSerie {
	var toDTO: TVSerieDTO {
		TVSerieDTO(id: id, details: details.toDTO, cast: cast.map(\.toDTO), crew: crew.map(\.toDTO), seasons: seasons.map(\.toDTO))
	}
}
