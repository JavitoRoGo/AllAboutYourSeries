//
//  TVSerieLogic.swift
//  AllAboutYourSeries
//
//  Created by Javier Rodríguez Gómez on 1/5/24.
//

import SwiftUI

@Observable
final class TVSerieLogic {
	static let shared = TVSerieLogic()
	let interactor: TVDataDownloader
	
	init(interactor: TVDataDownloader = TVDownloader.shared) {
		self.interactor = interactor
	}
	
	func downloadSerie(id: Int) async throws -> TVSerie {
		try await interactor.getTVSerie(id: id)
	}
	
	func searchSeries(text: String) async throws -> [TVSerieSearches] {
		try await interactor.searchForSeries(text: text)
	}
}
