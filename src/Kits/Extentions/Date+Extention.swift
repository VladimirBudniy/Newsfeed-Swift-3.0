//
//  Date+Extention.swift
//  Newsfeed-Swift
//
//  Created by Vladimir Budniy on 1/3/17.
//  Copyright © 2017 Vladimir Budniy. All rights reserved.
//

import Foundation

extension Date {
    
    static func dateWithString(string: String, dateFormat: String) -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US")
        dateFormatter.dateFormat = dateFormat
        
        return dateFormatter.date(from: string)!
    }
    
    static func correctStringDateFor(date: Date,
                        localeIdentifier: String = "uk_BI",
                        dateFormat: String = "MMM d, H:mm",
                        secondsFromGMT: Int = 0) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: localeIdentifier)
        dateFormatter.timeZone = NSTimeZone(forSecondsFromGMT: secondsFromGMT) as TimeZone!
        dateFormatter.dateFormat = dateFormat
        
        return dateFormatter.string(from: date)
    }
    
    static func convertDateFromString(string: String) -> Date {
        let currentDate = Date.dateWithString(string: string, dateFormat: "E, d MMM yyyy HH:mm:ss Z")
        return currentDate.convertDateFormat(dateFormat: "yyyy-MM-dd HH:mm")
    }

    // MARK: - Public
    
    func convertDateFormat(dateFormat: String, secondsFromGMT: Int = 0) -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = dateFormat
        let currentStringDate = dateFormatter.string(from: self)
        dateFormatter.timeZone = NSTimeZone(forSecondsFromGMT: secondsFromGMT) as TimeZone!
        
        return dateFormatter.date(from: currentStringDate)!
    }
    
}
