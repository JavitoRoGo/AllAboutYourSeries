//
//  MainAppView.swift
//  AllAboutYourSeries
//
//  Created by Javier Rodríguez Gómez on 2/5/24.
//

import SwiftUI

struct MainAppView: View {
	@Environment(SeriesVM.self) private var vm
	@State private var search = "Futurama"
	@State private var showResults = false
	@State private var allSearch: [String] = []
	
    var body: some View {
		@Bindable var bvm = vm
		
		NavigationStack {
			ZStack {
				if let serie = vm.selected {
					SerieDetailView(serie: serie)
				}
				VStack {
					Form {
						Section {
							HStack {
								TextField("Search by name", text: $search)
									.autocorrectionDisabled()
								Button("Go") {
									Task {
										await vm.search(text: search)
										showResults = true
									}
								}
								.buttonStyle(.bordered)
								.disabled(search.isEmpty)
							}
						} footer: {
							Text("Search for a TV show by its name.")
						}
						
						if showResults {
							Section {
								ForEach(vm.searchResults) { result in
									HStack {
										Text(result.name)
										Spacer()
									}
									.background(.background)
									.onTapGesture {
										Task { await vm.getSerie(id: result.id) }
									}
								}
							} header: {
								HStack {
									Text("Results")
									Spacer()
									Button("Hide") {
										showResults.toggle()
									}
									.font(.subheadline)
								}
							} footer: {
								Text("Tap to see all the details, where you can set is as favorite.")
							}
						}
						ScrollCardView()
					}
				}
				.opacity(vm.selected == nil ? 1.0 : 0.0)
			}
			.navigationTitle(vm.selected == nil ? "InfoSeries" : "")
			.alert("Ups!", isPresented: $bvm.showAlert) { } message: {
				Text(vm.errorMessage)
			}
		}
    }
}

#Preview {
    MainAppView()
		.environment(SeriesVM())
}
