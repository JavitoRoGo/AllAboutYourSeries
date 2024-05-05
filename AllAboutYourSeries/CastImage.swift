//
//  CastImage.swift
//  AllAboutYourSeries
//
//  Created by Javier Rodríguez Gómez on 1/5/24.
//

import SwiftUI

struct CastImage: View {
	@State private var posterVM = PosterVM()
	let cast: CastCrew
	
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
						Image(systemName: "person")
							.resizable()
							.scaledToFit()
							.foregroundStyle(.secondary)
							.padding()
					}
			}
		}
		.onAppear {
			posterVM.getImage(path: cast.profilePath, type: .profile)
		}
	}
}

#Preview {
	CastImage(cast: TVSerie.preview.cast[0])
}
