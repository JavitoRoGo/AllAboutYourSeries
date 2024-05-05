//
//  FullPoster.swift
//  AllAboutYourSeries
//
//  Created by Javier Rodríguez Gómez on 1/5/24.
//

import SwiftUI

struct FullPoster: View {
	@State private var posterVM = PosterVM()
	let serie: TVSerie
	var type: ImageType = .poster
	
    var body: some View {
		Group {
			if let image = posterVM.poster {
				Image(uiImage: image)
					.resizable()
					.scaledToFill()
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
			switch type {
				case .backdrop:
					posterVM.getImage(path: serie.details.backdropPath, type: .backdrop)
				case .poster:
					posterVM.getImage(path: serie.details.posterPath, type: .poster)
				default: ()
			}
		}
    }
}

#Preview {
	FullPoster(serie: .preview)
}
