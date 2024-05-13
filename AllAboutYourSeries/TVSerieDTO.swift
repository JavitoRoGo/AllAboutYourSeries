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

extension TVSerieDTO {
	var castSorted: [CastCrewDTO] {
		cast.sorted {
			$0.order ?? 0 <= $1.order ?? 0
		}
	}
	
	var seasonsSorted: [TVSeasonDTO] {
		seasons.sorted {
			$0.seasonNumber < $1.seasonNumber
		}
	}
}
