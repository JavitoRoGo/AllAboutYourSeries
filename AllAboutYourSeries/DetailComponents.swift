//
//  DetailComponents.swift
//  AllAboutYourSeries
//
//  Created by Javier Rodríguez Gómez on 3/5/24.
//

import SwiftUI

struct DetailComponents: View {
	let serie: TVSerie
	
    var body: some View {
		Text(serie.details.name)
			.font(.title2)
			.fontWidth(.compressed)
			.bold()
		Text(serie.details.tagline)
			.padding(.horizontal)
		Text(serie.details.overview)
			.font(.footnote)
			.padding()
		VStack(spacing: 5.0) {
			LabeledContent("Rank", value: serie.details.voteAverage.formatted())
			LabeledContent("First On Air", value: serie.details.firstAirDate.toDateFormatted)
			LabeledContent("Last On Air", value: serie.details.lastAirDate.toDateFormatted)
			LabeledContent("In Production", value: serie.details.inProduction ? "Yes" : "No")
		}
		.font(.subheadline)
		.padding(.horizontal)
		VStack(spacing: 5.0) {
			LabeledContent("Number of episodes", value: serie.details.numberOfEpisodes.formatted())
			LabeledContent("Number of seasons", value: serie.details.numberOfSeasons.formatted())
			Text("Show episodes info...")
		}
		.font(.subheadline)
		.padding(.horizontal)
    }
}

#Preview {
	DetailComponents(serie: .preview)
}
