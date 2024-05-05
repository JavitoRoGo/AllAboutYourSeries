//
//  AppConfig.swift
//  AllAboutYourSeries
//
//  Created by Javier Rodríguez Gómez on 30/4/24.
//

import Foundation
import JSONLibrary

enum ImageType: String {
	case backdrop
	case logo
	case poster
	case profile
	case still
}

final class AppConfig: NetworkInteractor {
	var session: URLSession = .shared
	
	static let shared = AppConfig()
	
	var APIKEY: String?
	var secureBaseURL: URL?
	var backdrop = ""
	var logo = ""
	var poster = ""
	var profile = ""
	var still = ""
	
	init() {
		try? getAPIKEY()
		Task { try? await getConfig() }
	}
	
	private func getAPIKEY() throws {
		guard let url = Bundle.main.url(forResource: "configAPI", withExtension: "plist") else { return }
		let data = try Data(contentsOf: url)
		let plist = try PropertyListDecoder().decode([String: String].self, from: data)
		APIKEY = plist["API_KEY"]
	}
	
	private func getConfig() async throws {
		let config = try await getJSON(request: .get(url: configURL, token: APIKEY), type: APIImageConfiguration.self)
		secureBaseURL = URL(string: config.images.secureBaseURL)
		backdrop = config.images.backdropSizes.dropLast(2).last ?? ""
		logo = config.images.logoSizes.dropLast(2).last ?? ""
		poster = config.images.posterSizes.dropLast(2).last ?? ""
		profile = config.images.profileSizes.dropLast(2).last ?? ""
		still = config.images.stillSizes.dropLast(2).last ?? ""
	}
	
	func getImageURL(type: ImageType, path: String?) -> URL? {
		guard let secureBaseURL, let path else { return nil }
		let prefix = switch type {
		case .backdrop:
			backdrop
		case .logo:
			logo
		case .poster:
			poster
		case .profile:
			profile
		case .still:
			still
		}
		return secureBaseURL.appending(path: prefix).appending(path: path)
	}
}
