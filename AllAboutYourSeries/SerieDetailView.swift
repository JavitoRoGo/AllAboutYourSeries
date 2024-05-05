//
//  SerieDetailView.swift
//  AllAboutYourSeries
//
//  Created by Javier Rodríguez Gómez on 30/4/24.
//

import SwiftUI

struct SerieDetailView: View {
	@Environment(SeriesVM.self) private var vm
	let serie: TVSerie
	
    var body: some View {
		ScrollView(showsIndicators: false) {
			FullPoster(serie: serie, type: .poster)
				.overlay(alignment: .topTrailing) {
					Button {
						vm.serie = nil
					} label: {
						Image(systemName: "xmark")
							.font(.largeTitle)
							.symbolVariant(.fill)
							.symbolVariant(.circle)
					}
					.buttonStyle(.plain)
					.foregroundStyle(.ultraThickMaterial)
					.opacity(0.8)
					.padding(20)
				}
				.padding(.bottom)
			DetailComponents(serie: serie)
			
			FullPoster(serie: serie, type: .backdrop)
				.padding(.vertical)
			
			CastCrewComponent(serie: serie)
			NetworksComponent(serie: serie)
		}
		.ignoresSafeArea(edges: .top)
    }
}

#Preview {
	SerieDetailView(serie: .preview)
		.environment(SeriesVM())
}
