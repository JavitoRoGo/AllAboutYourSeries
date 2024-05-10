//
//  SerieDetailView.swift
//  AllAboutYourSeries
//
//  Created by Javier Rodríguez Gómez on 30/4/24.
//

import SwiftData
import SwiftUI

struct SerieDetailView: View {
	@Environment(SeriesVM.self) private var vm
	@Environment(\.modelContext) private var context
	@Query private var favorites: [TVSerie]
	@State private var isFavorite = false
	@State private var showSeasons = false
	let serie: TVSerieDTO
	
    var body: some View {
		ScrollView(showsIndicators: false) {
			FullPoster(serie: serie, type: .poster)
				.overlay(alignment: .topLeading) {
					Button {
						vm.setFavorite(serie: serie, context: context)
					} label: {
						Image(systemName: "star")
							.foregroundStyle(isFavorite ? .yellow : .secondary)
							.symbolVariant(isFavorite ? .fill : .slash)
					}
					.buttonStyle(.borderedProminent)
					.padding(.vertical, 40)
					.padding(.leading, 20)
				}
				.overlay(alignment: .topTrailing) {
					Button {
						vm.selected = nil
					} label: {
						Image(systemName: "xmark")
							.font(.largeTitle)
							.symbolVariant(.fill)
							.symbolVariant(.circle)
					}
					.buttonStyle(.plain)
					.foregroundStyle(.ultraThickMaterial)
					.opacity(0.8)
					.padding(.vertical, 40)
					.padding(.trailing, 20)
				}
				.padding(.bottom)
			
			DetailComponents(serie: serie, showSeasons: $showSeasons)
			
			FullPoster(serie: serie, type: .backdrop)
				.padding(.vertical)
			
			CastCrewComponent(serie: serie)
			NetworksComponent(serie: serie)
		}
		.ignoresSafeArea(edges: .top)
		.onChange(of: favorites, initial: true) {
			isFavorite = (favorites.first(where: { $0.id == serie.id }) != nil)
		}
		.sheet(isPresented: $showSeasons) {
			SeasonDetailView(serie: serie)
		}
    }
}

#Preview {
	SerieDetailView(serie: .preview)
		.environment(SeriesVM())
		.modelContainer(for: TVSerie.self, inMemory: true)
}
