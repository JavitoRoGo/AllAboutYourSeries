//
//  PosterVM.swift
//  AllAboutYourSeries
//
//  Created by Javier Rodríguez Gómez on 1/5/24.
//

import SwiftUI

@Observable
final class PosterVM {
	var poster: UIImage?
	
	func getImage(path: String?, type: ImageType = .poster) {
		guard let path else { return }
		let docURL = URL.cachesDirectory.appending(path: path)
		if FileManager.default.fileExists(atPath: docURL.path()) {
			if let data = try? Data(contentsOf: docURL) {
				poster = UIImage(data: data)
			}
		} else {
			Task { await getAsyncImage(path: path, type: type) }
		}
	}
	
	private func getAsyncImage(path: String, type: ImageType) async {
		guard let url = AppConfig.shared.getImageURL(type: type, path: path) else { return }
		do {
			let image = try await ImageDownloader.shared.image(from: url)
			await MainActor.run {
				self.poster = image
			}
		} catch {
			print("Error downloading the image \(path)")
		}
	}
}
