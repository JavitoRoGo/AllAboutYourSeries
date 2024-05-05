//
//  SeriesVM.swift
//  AllAboutYourSeries
//
//  Created by Javier Rodríguez Gómez on 1/5/24.
//

import SwiftUI

@Observable
final class SeriesVM {
	let logic = TVSerieLogic.shared
	
	var serie: TVSerie?
	var showAlert = false
	var errorMessage = ""
	
	var searchResults = [TVSerieSearches]()
	
	func getSerie(id: Int) async {
		do {
			let download = try await logic.downloadSerie(id: id)
			await MainActor.run {
				serie = download
			}
		} catch {
			await MainActor.run {
				errorMessage = error.localizedDescription
				showAlert.toggle()
			}
		}
	}
	
	func search(text: String) async {
		do {
			let result = try await logic.searchSeries(text: text)
			await MainActor.run {
				searchResults = result
			}
		} catch {
			await MainActor.run {
				errorMessage = error.localizedDescription
				showAlert.toggle()
			}
		}
	}
}

let series = [615, 1433, 2710, 1405, 456]
