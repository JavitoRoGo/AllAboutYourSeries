//
//  SeasonImage.swift
//  AllAboutYourSeries
//
//  Created by Javier Rodríguez Gómez on 10/5/24.
//

import SwiftUI

struct SeasonImage: View {
	@State private var posterVM = PosterVM()
	let season: TVSeasonDTO
	
	var body: some View {
		Group {
			if let image = posterVM.poster {
				Image(uiImage: image)
					.resizable()
					.scaledToFit()
					.frame(width: 250)
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
			posterVM.getImage(path: season.posterPath)
		}
	}
}

#Preview {
	SeasonImage(season: TVSerieDTO.preview.seasons[0])
}
