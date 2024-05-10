//
//  PreviewData.swift
//  AllAboutYourSeries
//
//  Created by Javier Rodríguez Gómez on 1/5/24.
//

import Foundation

extension TVSerie {
	static let preview = TVSerie(
		id: 2710,
		details: TVDetail(
			id: 2710,
			backdropPath: "/uqTCaYBoSLT9MAdyQ9tU6QyCZ3A.jpg",
			firstAirDate: "2005-08-04",
			inProduction: true,
			lastAirDate: "2023-07-19",
			name: "It's Always Sunny in Philadelphia",
			networks: [Network(id: 88, logoPath: "/aexGjtcs42DgRtZh7zOxayiry4J.png", name: "FX"),
					  Network(id: 1035, logoPath: "/hDLXRZMBOCbpVYpkBbIlLvMXgdX.png", name: "FXX")],
			numberOfEpisodes: 169,
			numberOfSeasons: 16,
			overview: "Four egocentric friends run a neighborhood Irish pub in Philadelphia and try to find their way through the adult world of work and relationships. Unfortunately, their warped views and precarious judgments often lead them to trouble, creating a myriad of uncomfortable situations that usually only get worse before they get better.",
			posterPath: "/pRWO6ufqSNkWvPXDDQhBwPNSv4K.jpg",
			productionCompanies: [Network(id: 787, logoPath: "/cCefBs1t7jxtiz3eCxBp9yxrxGx.png", name: "3 Arts Entertainment"),
								 Network(id: 15992, logoPath: nil, name: "Bluebush Productions"),
								 Network(id: 15990, logoPath: "/5cT4zwHA66uNAr2p3CcBDLddXu2.png", name: "FX Productions"),
								 Network(id: 109413, logoPath: nil, name: "RCG Productions")],
			tagline: "More Gang for your buck.",
			voteAverage: 8.294
		),
		cast: [CastCrew(
			name: "Kaitlin Olson",
			profilePath: "/z84SKRCVl9zPhP9AINVS8Bx8dRO.jpg",
			character: "Deandra Reynolds",
			order: 3,
			department: nil,
			job: nil
		)],
		crew: [CastCrew(
			name: "Charlie Day",
			profilePath: "/c0HNhjChGybnHa4eoLyqO4dDu1j.jpg",
			character: nil,
			order: nil,
			department: "Production",
			job: "Executive Producer"
		)],
		seasons: [TVSeason(
			airDate: "2005-08-04",
			episodes: [TVEpisode(airDate: "2005-08-04", episodeNumber: 1, name: "The Gang Gets Racist", overview: "The guys hire Dee's friend, Terrell to promote the bar.  Meanwhile, Charlie tries to prove that he is not a racist.", runtime: 22, seasonNumber: 1, stillPath: "/wtzMmzuG32wUk194VLCnS1FQhw9.jpg", voteAverage: 7.533),
					   TVEpisode(airDate: "2005-08-11", episodeNumber: 2, name: "Charlie Wants an Abortion", overview: "A girl from Charlie's past reveals they have a child together. Mac sees the benefits in being a pro-life advocate, while Dennis uses an abortion rally to meet women.", runtime: 23, seasonNumber: 1, stillPath: "/A0X5pif6SQOgtaMF8GBaQF2VTbz.jpg", voteAverage: 8.292)],
			name: "Season 1",
			overview: "The first season of It's Always Sunny in Philadelphia, premiered on FX on August 4, 2005. The season contains 7 episodes and concluded airing on September 15, 2005.",
			posterPath: "/guv75qky4x3MVYd16IBJMRGIDEV.jpg",
			seasonNumber: 1,
			voteAverage: 8
		)]
	)
}

extension TVSerieSearches {
	static let preview = TVSerieSearches(
		id: 2710,
		name: "It's Always Sunny in Philadelphia",
		backdropPath: "/uqTCaYBoSLT9MAdyQ9tU6QyCZ3A.jpg",
		posterPath: "/pRWO6ufqSNkWvPXDDQhBwPNSv4K.jpg"
	)
}

extension TVSerieDTO {
	static let preview = TVSerieDTO(
		id: 2710,
		details: TVDetailDTO(
			id: 2710,
			backdropPath: "/uqTCaYBoSLT9MAdyQ9tU6QyCZ3A.jpg",
			firstAirDate: "2005-08-04",
			inProduction: true,
			lastAirDate: "2023-07-19",
			name: "It's Always Sunny in Philadelphia",
			networks: [NetworkDTO(id: 88, logoPath: "/aexGjtcs42DgRtZh7zOxayiry4J.png", name: "FX"),
					   NetworkDTO(id: 1035, logoPath: "/hDLXRZMBOCbpVYpkBbIlLvMXgdX.png", name: "FXX")],
			numberOfEpisodes: 169,
			numberOfSeasons: 16,
			overview: "Four egocentric friends run a neighborhood Irish pub in Philadelphia and try to find their way through the adult world of work and relationships. Unfortunately, their warped views and precarious judgments often lead them to trouble, creating a myriad of uncomfortable situations that usually only get worse before they get better.",
			posterPath: "/pRWO6ufqSNkWvPXDDQhBwPNSv4K.jpg",
			productionCompanies: [NetworkDTO(id: 787, logoPath: "/cCefBs1t7jxtiz3eCxBp9yxrxGx.png", name: "3 Arts Entertainment"),
								  NetworkDTO(id: 15992, logoPath: nil, name: "Bluebush Productions"),
								  NetworkDTO(id: 15990, logoPath: "/5cT4zwHA66uNAr2p3CcBDLddXu2.png", name: "FX Productions"),
								  NetworkDTO(id: 109413, logoPath: nil, name: "RCG Productions")],
			tagline: "More Gang for your buck.",
			voteAverage: 8.294
		),
		cast: [CastCrewDTO(
			dbid: 33,
			name: "Kaitlin Olson",
			profilePath: "/z84SKRCVl9zPhP9AINVS8Bx8dRO.jpg",
			character: "Deandra Reynolds",
			order: 3,
			department: nil,
			job: nil
		)],
		crew: [CastCrewDTO(
			dbid: 22,
			name: "Charlie Day",
			profilePath: "/c0HNhjChGybnHa4eoLyqO4dDu1j.jpg",
			character: nil,
			order: nil,
			department: "Production",
			job: "Executive Producer"
		)],
		seasons: [TVSeasonDTO(
			dbid: 8789,
			airDate: "2005-08-04",
			episodes: [TVEpisodeDTO(dbid: 213050, airDate: "2005-08-04", episodeNumber: 1, name: "The Gang Gets Racist", overview: "The guys hire Dee's friend, Terrell to promote the bar.  Meanwhile, Charlie tries to prove that he is not a racist.", runtime: 22, seasonNumber: 1, stillPath: "/wtzMmzuG32wUk194VLCnS1FQhw9.jpg", voteAverage: 7.533),
					   TVEpisodeDTO(dbid: 213052, airDate: "2005-08-11", episodeNumber: 2, name: "Charlie Wants an Abortion", overview: "A girl from Charlie's past reveals they have a child together. Mac sees the benefits in being a pro-life advocate, while Dennis uses an abortion rally to meet women.", runtime: 23, seasonNumber: 1, stillPath: "/A0X5pif6SQOgtaMF8GBaQF2VTbz.jpg", voteAverage: 8.292)],
			name: "Season 1",
			overview: "The first season of It's Always Sunny in Philadelphia, premiered on FX on August 4, 2005. The season contains 7 episodes and concluded airing on September 15, 2005.",
			posterPath: "/guv75qky4x3MVYd16IBJMRGIDEV.jpg",
			seasonNumber: 1,
			voteAverage: 8
		)]
	)
}
