//
//  DateTests.swift
//  Outlaw
//
//  Created by Brian Mullen on 11/17/16.
//  Copyright © 2016 Molbie LLC. All rights reserved.
//

import XCTest
@testable import Outlaw


class DateTests: OutlawTestCase {
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
    
    func testValue() {
        let value: Date = try! data.value(for: "date")
        XCTAssertEqual(formatDate(value), formatDate(dateForAssert()))
    }
    
    func testNestedValue() {
        let value: Date = try! data.value(for: "object.date")
        XCTAssertEqual(formatDate(value), formatDate(dateForAssert()))
    }
    
    func testKeyNotFound() {
        var value: Date = Date()
        
        let ex = self.expectation(description: "Key not found")
        do {
            value = try data.value(for: "keyNotFound")
        }
        catch {
            if case OutlawError.keyNotFound = error {
                ex.fulfill()
            }
        }
        self.waitForExpectations(timeout: 1, handler: nil)
        XCTAssertNotEqual(formatDate(value), formatDate(dateForAssert()))
    }
    
    func testTypeMismatch() {
        var value: Date = Date()
        
        let ex = self.expectation(description: "Type mismatch")
        do {
            value = try data.value(for: "bool")
        }
        catch {
            if case OutlawError.typeMismatchWithKey = error {
                ex.fulfill()
            }
        }
        self.waitForExpectations(timeout: 1, handler: nil)
        XCTAssertNotEqual(formatDate(value), formatDate(dateForAssert()))
    }
    
// MARK: -
// MARK: Optionals
    
    func testOptional() {
        let value: Date? = data.value(for: "date")
        XCTAssertEqual(formatDate(value!), formatDate(dateForAssert()))
    }
    
    func testOptionalNestedValue() {
        let value: Date? = data.value(for: "object.date")
        XCTAssertEqual(formatDate(value!), formatDate(dateForAssert()))
    }
    
    func testOptionalKeyNotFound() {
        let value: Date? = data.value(for: "keyNotFound")
        XCTAssertNil(value)
    }
    
    func testOptionalTypeMismatch() {
        let value: Date? = data.value(for: "bool")
        XCTAssertNil(value)
    }
}
