//
//  SeasonCardComponent.swift
//  AllAboutYourSeries
//
//  Created by Javier Rodríguez Gómez on 13/5/24.
//

import SwiftUI

struct SeasonCardComponent: View {
	let season: TVSeasonDTO
	
    var body: some View {
		VStack {
			SeasonImage(season: season)
			VStack {
				Text(season.name)
				Text("Airdate: \(season.airDate)")
				Text("\(season.episodes.count) episodes")
			}
			.foregroundStyle(.white)
			.padding(15)
			.frame(maxWidth: .infinity)
			.background {
				RoundedRectangle(cornerRadius: 15)
					.fill(.black.opacity(0.75))
			}
			.padding(.bottom, 5)
		}
		.padding(5)
		.background {
			RoundedRectangle(cornerRadius: 15)
				.fill(Color(white: 0.8))
		}
    }
}

#Preview {
	SeasonCardComponent(season: TVSerieDTO.preview.seasons[0])
}
