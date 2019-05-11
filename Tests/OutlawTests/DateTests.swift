//
//  DateTests.swift
//  Outlaw
//
//  Created by Brian Mullen on 11/17/16.
//  Copyright © 2016 Molbie LLC. All rights reserved.
//

import XCTest
@testable import Outlaw


class DateTests: OutlawTestCase, DateTesting {
    static var allTests = [("testValue", testValue),
                           ("testNestedValue", testNestedValue),
                           ("testKeyNotFound", testKeyNotFound),
                           ("testTypeMismatch", testTypeMismatch),
                           ("testOptional", testOptional),
                           ("testOptionalNestedValue", testOptionalNestedValue),
                           ("testOptionalKeyNotFound", testOptionalKeyNotFound),
                           ("testOptionalTypeMismatch", testOptionalTypeMismatch),
                           ("testTransformValue", testTransformValue),
                           ("testOptionalTransformValue", testOptionalTransformValue),
                           ("testTransformOptionalValue", testTransformOptionalValue),
                           ("testOptionalTransformOptionalValue", testOptionalTransformOptionalValue)]
    
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
        let value: Date? = data.optional(for: "date")
        XCTAssertEqual(formatDate(value!), formatDate(dateForAssert()))
    }
    
    func testOptionalNestedValue() {
        let value: Date? = data.optional(for: "object.date")
        XCTAssertEqual(formatDate(value!), formatDate(dateForAssert()))
    }
    
    func testOptionalKeyNotFound() {
        let value: Date? = data.optional(for: "keyNotFound")
        XCTAssertNil(value)
    }
    
    func testOptionalTypeMismatch() {
        let value: Date? = data.optional(for: "bool")
        XCTAssertNil(value)
    }
    
// MARK: -
// MARK: Transforms
    
    func testTransformValue() {
        let formatter = shortDateformatter()
        
        let value: Date = try! data.value(for: "transform", with: { (rawValue: String) -> Date in
            return formatter.date(from: rawValue)!
        })
        XCTAssertEqual(formatShortDate(value), formatShortDate(shortDateForAssert()))
    }
    
    func testOptionalTransformValue() {
        let formatter = shortDateformatter()
        
        let value: Date = try! data.value(for: "transform", with: { (rawValue: String?) -> Date in
            guard let dateValue = rawValue else {
                throw OutlawError.typeMismatchWithKey(key: "transform", expected: Date.self, actual: rawValue ?? "")
            }
            
            return formatter.date(from: dateValue)!
        })
        XCTAssertEqual(formatShortDate(value), formatShortDate(shortDateForAssert()))
    }
    
    func testTransformOptionalValue() {
        let formatter = shortDateformatter()
        
        let value: Date? = data.optional(for: "transform", with: formatter.date)
        XCTAssertEqual(formatShortDate(value!), formatShortDate(shortDateForAssert()))
    }
    
    func testOptionalTransformOptionalValue() {
        let formatter = shortDateformatter()
        
        let value: Date? = data.optional(for: "transform", with: { (rawValue: String?) -> Date? in
            guard let rawValue = rawValue else { return nil }
            return formatter.date(from: rawValue)
        })
        XCTAssertEqual(formatShortDate(value!), formatShortDate(shortDateForAssert()))
    }
}
