//
//  SeasonDetailView.swift
//  AllAboutYourSeries
//
//  Created by Javier Rodríguez Gómez on 9/5/24.
//

import SwiftUI

struct SeasonDetailView: View {
	let serie: TVSerieDTO
	
    var body: some View {
		ScrollView {
			LazyVStack {
				ForEach(serie.seasons) { season in
					Text(season.seasonNumber.formatted())
				}
			}
		}
		.safeAreaPadding()
		.onAppear {
			print(serie.seasons.count)
		}
    }
}

#Preview {
	SeasonDetailView(serie: .preview)
}
