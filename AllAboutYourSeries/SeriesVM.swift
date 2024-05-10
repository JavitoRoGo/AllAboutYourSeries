//
//  SeriesVM.swift
//  AllAboutYourSeries
//
//  Created by Javier Rodríguez Gómez on 1/5/24.
//

import SwiftData
import SwiftUI

@Observable
final class SeriesVM {
	let logic = TVSerieLogic.shared
	
	var selected: TVSerieDTO?
	var showAlert = false
	var errorMessage = ""
	
	var searchResults = [TVSerieSearches]()
	
	func getSerie(id: Int) async {
		do {
			let download = try await logic.downloadSerie(id: id)
			await MainActor.run {
				selected = download
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
	
	func setFavorite(serie: TVSerieDTO, context: ModelContext) {
		do {
			try logic.setFavorite(serie: serie, context: context)
		} catch {
			errorMessage = error.localizedDescription
			showAlert.toggle()
		}
	}
}
