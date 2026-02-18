//
//  DateHelper.swift
//  Cafe-iOS-Anton
//
//  Created by Антон Абалуев on 15.02.2026.
//
import Foundation

class DateHelper {
    static func formatDateString(_ dateString: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        
        if let date = dateFormatter.date(from: dateString) {
            dateFormatter.dateFormat = "dd.MM.yyyy HH:mm"
            return dateFormatter.string(from: date)
        }
        return ""
    }
}
