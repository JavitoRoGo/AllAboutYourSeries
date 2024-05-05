//
//  LogoImage.swift
//  AllAboutYourSeries
//
//  Created by Javier Rodríguez Gómez on 2/5/24.
//

import SwiftUI

struct LogoImage: View {
	@State private var posterVM = PosterVM()
	let network: Network
	
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
						Image(systemName: "sparkles.tv")
							.resizable()
							.scaledToFit()
							.foregroundStyle(.secondary)
							.padding()
					}
			}
		}
		.onAppear {
			posterVM.getImage(path: network.logoPath, type: .logo)
		}
	}
}

#Preview {
	LogoImage(network: TVSerie.preview.details.networks[0])
}
