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
        
        guard let date = DateFormatter.ISO8601DateFormatter.date(from: value) else {
            throw OutlawError.typeMismatch(expected: "ISO8601 formatted string", actual: value)
        }
        return date
    }
}

fileprivate extension DateFormatter {
    static var ISO8601DateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.timeZone = TimeZone(abbreviation: "GMT")
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssXXXXX"
        return formatter
    }
}
