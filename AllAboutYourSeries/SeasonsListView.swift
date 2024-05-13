//
//  SeasonsListView.swift
//  AllAboutYourSeries
//
//  Created by Javier Rodríguez Gómez on 9/5/24.
//

import SwiftUI

struct SeasonsListView: View {
	@Environment(\.dismiss) private var dismiss
	let serie: TVSerieDTO
	
    var body: some View {
		NavigationStack {
			ScrollView {
				LazyVStack {
					ForEach(serie.seasonsSorted) { season in
						NavigationLink(value: season) {
							SeasonCardComponent(season: season)
						}
						.buttonStyle(.plain)
					}
				}
			}
			.safeAreaPadding()
			.overlay(alignment: .topTrailing) {
				Button {
					dismiss()
				} label: {
					Image(systemName: "xmark")
						.font(.largeTitle)
						.symbolVariant(.fill)
						.symbolVariant(.circle)
				}
				.buttonStyle(.plain)
				.foregroundStyle(.primary)
				.opacity(0.8)
				.padding(.vertical, 20)
				.padding(.trailing, 20)
			}
			.scrollIndicators(.hidden)
			.toolbar(.hidden, for: .navigationBar)
			.navigationDestination(for: TVSeasonDTO.self) { season in
				SeasonDetailView(season: season)
			}
		}
    }
}

#Preview {
	SeasonsListView(serie: .preview)
}
