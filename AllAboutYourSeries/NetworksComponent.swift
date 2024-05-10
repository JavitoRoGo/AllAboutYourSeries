//
//  NetworksComponent.swift
//  AllAboutYourSeries
//
//  Created by Javier Rodríguez Gómez on 3/5/24.
//

import SwiftUI

struct NetworksComponent: View {
	let serie: TVSerieDTO
	
    var body: some View {
		VStack(alignment: .leading, spacing: 0.0) {
			Text("NETWORK:")
				.bold()
				.padding(.leading)
			ScrollView(.horizontal) {
				LazyHStack {
					ForEach(serie.details.networks) { network in
						VStack {
							LogoImage(network: network)
								.frame(height: 50)
							Text(network.name)
						}
						.padding(.horizontal)
					}
				}
				.safeAreaPadding()
			}
			.scrollIndicators(.hidden)
		}
		VStack(alignment: .leading, spacing: 0.0) {
			Text("PRODUCTION COMPANIES:")
				.bold()
				.padding(.leading)
			ScrollView(.horizontal) {
				LazyHStack {
					ForEach(serie.details.productionCompanies) { company in
						VStack {
							LogoImage(network: company)
								.frame(height: 50)
							Text(company.name)
						}
						.padding(.horizontal)
					}
				}
				.safeAreaPadding()
			}
			.scrollIndicators(.hidden)
		}
    }
}

#Preview {
	NetworksComponent(serie: .preview)
}
