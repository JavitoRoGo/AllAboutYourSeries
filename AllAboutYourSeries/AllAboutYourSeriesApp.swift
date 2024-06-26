//
//  AllAboutYourSeriesApp.swift
//  AllAboutYourSeries
//
//  Created by Javier Rodríguez Gómez on 30/4/24.
//

import SwiftData
import SwiftUI
import OSLog

@main
struct AllAboutYourSeriesApp: App {
	@State private var vm = SeriesVM()
	let logger = Logger.fileLocation
	
    var body: some Scene {
        WindowGroup {
            MainAppView()
				.environment(vm)
				.onAppear {
					logger.info("\(URL.documentsDirectory.path())")
				}
        }
		.modelContainer(for: TVSerie.self)
    }
}
