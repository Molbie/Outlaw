//
//  Date+Value.swift
//  Outlaw
//
//  Created by Brian Mullen on 11/17/16.
//  Copyright © 2016 Molbie LLC. All rights reserved.
//

import Foundation


extension Date: Value {
    public static func value(from object: Any) throws -> Date {
        guard let value = object as? String else {
            throw OutlawError.typeMismatch(expected: String.self, actual: type(of: object))
        }
        
        let formattedDate: Date?
        
        if #available(OSX 10.12, iOS 10.0, tvOS 10.0, watchOS 3.0, *) {
            formattedDate = ISO8601DateFormatter().date(from: value)
        }
        else {
            formattedDate = DateFormatter.ISO8601DateFormatter.date(from: value)
        }
        
        guard let date = formattedDate else {
            throw OutlawError.typeMismatch(expected: "ISO8601 formatted string", actual: value)
        }
        return date
    }
}

fileprivate extension DateFormatter {
    fileprivate static var ISO8601DateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.timeZone = TimeZone(abbreviation: "GMT")
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssXXXXX"
        return formatter
    }
}
