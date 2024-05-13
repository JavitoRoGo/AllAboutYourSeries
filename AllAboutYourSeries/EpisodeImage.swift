//
//  EpisodeImage.swift
//  AllAboutYourSeries
//
//  Created by Javier Rodríguez Gómez on 13/5/24.
//

import SwiftUI

struct EpisodeImage: View {
	@State private var posterVM = PosterVM()
	let episode: TVEpisodeDTO
	
	var body: some View {
		Group {
			if let image = posterVM.poster {
				Image(uiImage: image)
					.resizable()
					.scaledToFit()
			} else {
				RoundedRectangle(cornerRadius: 15)
					.fill(Color(white: 0.9))
					.overlay {
						Image(systemName: "popcorn")
							.resizable()
							.scaledToFit()
							.foregroundStyle(.secondary)
							.padding()
					}
			}
		}
		.onAppear {
			posterVM.getImage(path: episode.stillPath, type: .still)
		}
	}
}

#Preview {
	EpisodeImage(episode: TVSerieDTO.preview.seasons[0].episodes[0])
}
