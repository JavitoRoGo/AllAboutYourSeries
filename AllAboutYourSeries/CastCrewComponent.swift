//
//  CastCrewComponent.swift
//  AllAboutYourSeries
//
//  Created by Javier Rodríguez Gómez on 3/5/24.
//

import SwiftUI

struct CastCrewComponent: View {
	let serie: TVSerie
	
    var body: some View {
		VStack(alignment: .leading, spacing: 0.0) {
			Text("CAST:")
				.bold()
				.padding(.leading)
			ScrollView(.horizontal) {
				LazyHStack {
					ForEach(serie.cast) { cast in
						ProfileCard(cast: cast)
					}
				}
				.safeAreaPadding()
			}
			.scrollIndicators(.hidden)
		}
		VStack(alignment: .leading, spacing: 0.0) {
			Text("CREW:")
				.bold()
				.padding(.leading)
			ScrollView(.horizontal) {
				LazyHStack {
					ForEach(serie.crew) { crew in
						ProfileCard(cast: crew)
					}
				}
				.safeAreaPadding()
			}
			.scrollIndicators(.hidden)
		}
    }
}

#Preview {
	CastCrewComponent(serie: .preview)
}
