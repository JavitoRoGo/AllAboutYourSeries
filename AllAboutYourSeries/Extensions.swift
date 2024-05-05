//
//  Extensions.swift
//  AllAboutYourSeries
//
//  Created by Javier Rodríguez Gómez on 1/5/24.
//

import SwiftUI

extension String {
	var toDateFormatted: String {
		let formatter = DateFormatter()
		formatter.dateFormat = "yyyy-MM-dd"
		let date = formatter.date(from: self)
		return date?.formatted(date: .abbreviated, time: .omitted) ?? "no date"
	}
}
