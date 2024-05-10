//
//  AllAboutYourSeriesApp.swift
//  AllAboutYourSeries
//
//  Created by Javier Rodríguez Gómez on 30/4/24.
//

import SwiftData
import SwiftUI

@main
struct AllAboutYourSeriesApp: App {
	@State private var vm = SeriesVM()
	
    var body: some Scene {
        WindowGroup {
            MainAppView()
				.environment(vm)
				.onAppear {
					print(URL.cachesDirectory.absoluteString)
				}
        }
		.modelContainer(for: TVSerie.self)
    }
}
