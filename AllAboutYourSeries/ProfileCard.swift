//
//  ProfileCard.swift
//  AllAboutYourSeries
//
//  Created by Javier Rodríguez Gómez on 1/5/24.
//

import SwiftUI

struct ProfileCard: View {
	let cast: CastCrewDTO
	
    var body: some View {
        RoundedRectangle(cornerRadius: 10)
			.fill(.background)
			.frame(width: 125, height: 250)
			.overlay {
				VStack(spacing: 0) {
					CastImage(cast: cast)
					VStack(alignment: .leading) {
						Text(cast.name)
							.font(.caption)
							.lineLimit(2, reservesSpace: true)
						if let character = cast.character {
							Text(character)
								.font(.caption2)
								.bold()
								.lineLimit(2, reservesSpace: true)
						}
						if let job = cast.job {
							Text(job)
								.font(.caption2)
								.bold()
								.lineLimit(2, reservesSpace: true)
						}
					}
					.frame(maxWidth: .infinity, alignment: .leading)
				}
			}
			.clipShape(.rect(cornerRadius: 10))
			.shadow(color: .black.opacity(0.4), radius: 5, x: 0, y: 5)
			.padding(.horizontal, 5)
			.frame(height: 250)
    }
}

#Preview {
    ProfileCard(cast: TVSerieDTO.preview.cast[0])
}
