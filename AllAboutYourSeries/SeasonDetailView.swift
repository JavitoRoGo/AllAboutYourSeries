//
//  SeasonDetailView.swift
//  AllAboutYourSeries
//
//  Created by Javier Rodríguez Gómez on 13/5/24.
//

import SwiftUI

struct SeasonDetailView: View {
	let season: TVSeasonDTO
	
    var body: some View {
		VStack {
			Text(season.name)
				.font(.largeTitle)
			Text(season.airDate)
				.font(.headline)
			Text(season.overview.isEmpty ? "No overview available" : season.overview)
				.padding(.horizontal)
			Divider()
			List {
				ForEach(season.episodes) { episode in
					NavigationLink(value: episode) {
						Text(episode.name)
					}
				}
			}
		}
		.navigationDestination(for: TVEpisodeDTO.self) { episode in
			EpisodeDetailView(episode: episode)
		}
    }
}

#Preview {
	SeasonDetailView(season: TVSerieDTO.preview.seasons[0])
}
