//
//  EpisodeDetailView.swift
//  AllAboutYourSeries
//
//  Created by Javier Rodríguez Gómez on 13/5/24.
//

import SwiftUI

struct EpisodeDetailView: View {
	let episode: TVEpisodeDTO
	
    var body: some View {
		ScrollView {
			Text("Episode \(episode.episodeNumber)")
			EpisodeImage(episode: episode)
			Divider()
				.padding(.vertical)
			VStack(spacing: 15) {
				Text(episode.name)
					.font(.title2)
				Text(episode.overview)
				LabeledContent("Air date", value: episode.airDate)
				LabeledContent("Run time", value: "\(episode.runtime ?? 0) min")
				LabeledContent("Rank", value: episode.voteAverage.formatted())
			}
			.padding(.horizontal)
		}
    }
}

#Preview {
	EpisodeDetailView(episode: TVSerieDTO.preview.seasons[0].episodes[0])
}
