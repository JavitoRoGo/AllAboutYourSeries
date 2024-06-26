//
//  Extensions.swift
//  AllAboutYourSeries
//
//  Created by Javier Rodríguez Gómez on 1/5/24.
//

import SwiftUI
import OSLog

extension String {
	var toDateFormatted: String {
		let formatter = DateFormatter()
		formatter.dateFormat = "yyyy-MM-dd"
		let date = formatter.date(from: self)
		return date?.formatted(date: .abbreviated, time: .omitted) ?? "no date"
	}
}

extension Logger {
	static let subsystem = Bundle.main.bundleIdentifier!
	static let fileLocation = Logger(subsystem: subsystem, category: "FileLocation")
	static let tvDataInteractor = Logger(subsystem: subsystem, category: "TVDataInteractor")
	static let serieLogic = Logger(subsystem: subsystem, category: "SerieLogic")
	static let seriesVM = Logger(subsystem: subsystem, category: "SeriesVM")
}
