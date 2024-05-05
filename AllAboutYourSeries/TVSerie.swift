//
//  TVSerie.swift
//  AllAboutYourSeries
//
//  Created by Javier Rodríguez Gómez on 1/5/24.
//

import Foundation

struct TVSerie: Codable, Identifiable {
	let id: Int
	var details: TVDetail
	var cast: [CastCrew]
	var crew: [CastCrew]
	var seasons: [TVSeason]
}
