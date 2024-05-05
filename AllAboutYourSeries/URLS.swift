//
//  URLS.swift
//  AllAboutYourSeries
//
//  Created by Javier Rodríguez Gómez on 30/4/24.
//

import Foundation

let api = URL(string: "https://api.themoviedb.org/3/tv")!
let apiSearchURL = URL(string: "https://api.themoviedb.org/3/search/tv")!
let configURL = URL(string: "https://api.themoviedb.org/3/configuration")!

extension URL {
	static func serieDetails(id: Int) -> URL {
		api.appending(path: "\(id)").appending(queryItems: [.language])
	}
	
	static func serieCredits(id: Int) -> URL {
		api.appending(path: "\(id)").appending(path: "credits").appending(queryItems: [.language])
	}
	
	static func serieSeason(id: Int, number: Int) -> URL {
		api.appending(path: "\(id)").appending(path: "season").appending(path: "\(number)").appending(queryItems: [.language])
	}
	
	static func searchURL(text: String) -> URL {
		apiSearchURL.appending(queryItems: [.search(text: text), .language])
	}
}

extension URLQueryItem {
	static let language = URLQueryItem(name: "language", value: "en-US")
	static func search(text: String) -> URLQueryItem {
		URLQueryItem(name: "query", value: text)
	}
}
