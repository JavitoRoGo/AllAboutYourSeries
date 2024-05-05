//
//  MainAppView.swift
//  AllAboutYourSeries
//
//  Created by Javier Rodríguez Gómez on 2/5/24.
//

import SwiftUI

struct MainAppView: View {
	@Environment(SeriesVM.self) private var vm
	@State private var search = ""
	@State private var showResults = false
	@State private var allSearch: [String] = []
	
    var body: some View {
		@Bindable var bvm = vm
		
		NavigationStack {
			ZStack {
				if let serie = vm.serie {
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
									.swipeActions {
										Button {
											// guardar o borrar de los favoritos
										} label: {
											Image(systemName: "star.fill")
										}
										.tint(.yellow)
									}
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
								Text("Tap to see all the details, and swipe to save as favorite.")
							}
						}
					}
					
					// mostrar favoritos como grid de cards
					
//					HStack {
//						ForEach(series, id: \.self) { index in
//							Button {
//								Task {
//									await vm.getSerie(id: index)
//								}
//							} label: {
//								Text("Ir a \(index)")
//							}
//							.buttonStyle(.bordered)
//						}
//					}
				}
				.opacity(vm.serie == nil ? 1.0 : 0.0)
			}
			.navigationTitle(vm.serie == nil ? "InfoSeries" : "")
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
