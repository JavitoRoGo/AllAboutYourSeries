//
//  TVSerieDTO.swift
//  AllAboutYourSeries
//
//  Created by Javier Rodríguez Gómez on 6/5/24.
//

import Foundation

struct TVSerieDTO {
	let id: Int
	var details: TVDetailDTO
	var cast: [CastCrewDTO]
	var crew: [CastCrewDTO]
	var seasons: [TVSeasonDTO]
}
