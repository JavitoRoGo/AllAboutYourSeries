//
//  ScrollCardView.swift
//  AllAboutYourSeries
//
//  Created by Javier Rodríguez Gómez on 5/5/24.
//

import SwiftData
import SwiftUI

struct ScrollCardView: View {
	private let colummns = [GridItem(.adaptive(minimum: 85))]
	@Environment(SeriesVM.self) private var vm
	@Query(sort: [SortDescriptor(\TVSerie.details.name)]) private var favorites: [TVSerie]
	@Query private var seasons: [TVSeason]
	@Query private var episodes: [TVEpisode]
	
    var body: some View {
		if !favorites.isEmpty {
			ScrollView(showsIndicators: false) {
				LazyVGrid(columns: colummns, spacing: 20) {
					ForEach(favorites) { serie in
						Button {
							vm.selected = serie.toDTO
						} label: {
							VStack {
								FullPoster(serie: serie.toDTO)
								Text(serie.seasons.count.formatted())
								Text(seasons.count.formatted())
								Text(episodes.count.formatted())
							}
						}
						.clipShape(.rect(cornerRadius: 12))
						.frame(width: 80)
					}
				}
			}
		}
		else {
			ContentUnavailableView(
				"No Favorites",
				systemImage: "popcorn",
				description: Text("You have not set any favorites yet. Select a TV show as favorite to see it here.")
			)
		}
    }
}

#Preview {
    ScrollCardView()
		.environment(SeriesVM())
}