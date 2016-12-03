//
//  XCTestCase+JSON.swift
//  Outlaw
//
//  Created by Brian Mullen on 11/26/16.
//  Copyright © 2016 Molbie LLC. All rights reserved.
//

import XCTest
@testable import Outlaw


public class OutlawTestCase: XCTestCase {
    public func jsonUrl(for resource: String) -> URL? {
        guard let path = Bundle(for: OutlawTestCase.self).path(forResource: resource, ofType: "json") else { return nil }
        
        return URL(fileURLWithPath: path)
    }
    
    public func jsonData(for resource: String) -> [String: Any] {
        guard let url = jsonUrl(for: resource) else { return [:] }
        return try! JSON.value(from: url)
    }
    
    public var data: [String: Any]!
    
    public override func setUp() {
        super.setUp()
        
        data = jsonData(for: "\(type(of: self))")
    }
}

public protocol DateTesting {}
public extension DateTesting {
    func formatDate(_ date: Date) -> String {
        if #available(OSX 10.12, iOS 10.0, tvOS 10.0, watchOS 3.0, *) {
            return ISO8601DateFormatter().string(from: date)
        }
        else {
            let formatter = DateFormatter()
            formatter.timeZone = TimeZone(abbreviation: "GMT")
            formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssXXXXX"
            return formatter.string(from: date)
        }
    }
    
    func formatString(_ string: String) -> Date {
        if #available(OSX 10.12, iOS 10.0, tvOS 10.0, watchOS 3.0, *) {
            return ISO8601DateFormatter().date(from: string)!
        }
        else {
            let formatter = DateFormatter()
            formatter.timeZone = TimeZone(abbreviation: "GMT")
            formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssXXXXX"
            return formatter.date(from: string)!
        }
    }
    
    func dateForAssert() -> Date {
        return formatString("2016-11-18T04:26:59Z")
    }
    
    func shortDateformatter() -> DateFormatter {
        let formatter = DateFormatter()
        formatter.timeZone = TimeZone(abbreviation: "GMT")
        formatter.dateFormat = "MM/dd/yyyy"
        return formatter
    }
    
    func formatShortDate(_ date: Date) -> String {
        return shortDateformatter().string(from: date)
    }
    
    func formatShortString(_ string: String) -> Date {
        return shortDateformatter().date(from: string)!
    }
    
    func shortDateForAssert() -> Date {
        return formatShortString("11/18/2016")
    }
}
