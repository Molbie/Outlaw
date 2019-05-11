//
//  EnumTests.swift
//  Outlaw
//
//  Created by Brian Mullen on 11/9/16.
//  Copyright © 2016 Molbie LLC. All rights reserved.
//

import XCTest
@testable import Outlaw


class EnumTests: OutlawTestCase {
    static var allTests = [("testValue", testValue),
                           ("testArrayValue", testArrayValue),
                           ("testDictionaryValue", testDictionaryValue),
                           ("testSetValue", testSetValue),
                           ("testNestedValue", testNestedValue),
                           ("testNestedArrayValue", testNestedArrayValue),
                           ("testNestedDictionaryValue", testNestedDictionaryValue),
                           ("testNestedSetValue", testNestedSetValue),
                           ("testKeyNotFound", testKeyNotFound),
                           ("testTypeMismatch", testTypeMismatch),
                           ("testOptional", testOptional),
                           ("testOptionalArray", testOptionalArray),
                           ("testOptionalDictionary", testOptionalDictionary),
                           ("testOptionalSet", testOptionalSet),
                           ("testOptionalNestedValue", testOptionalNestedValue),
                           ("testOptionalNestedArray", testOptionalNestedArray),
                           ("testOptionalNestedDictionary", testOptionalNestedDictionary),
                           ("testOptionalNestedSet", testOptionalNestedSet),
                           ("testOptionalKeyNotFound", testOptionalKeyNotFound),
                           ("testOptionalTypeMismatch", testOptionalTypeMismatch)]
    
    func testValue() {
        let value: DayOfWeek = try! data.value(for: "enum")
        XCTAssertEqual(value, .friday)
    }
    
    func testArrayValue() {
        let value: [DayOfWeek] = try! data.value(for: "array")
        XCTAssertEqual(value.count, 7)
        XCTAssertEqual(value.last, .saturday)
    }
    
    func testDictionaryValue() {
        let value: [String: DayOfWeek] = try! data.value(for: "dictionary")
        XCTAssertEqual(value.count, 7)
        XCTAssertEqual(value["Sat"], .saturday)
    }
    
    func testSetValue() {
        let value: Set<DayOfWeek> = try! data.value(for: "set")
        XCTAssertEqual(value.count, 1)
        XCTAssertEqual(value.first, .sunday)
    }
    
    func testNestedValue() {
        let value: DayOfWeek = try! data.value(for: "object.enum")
        XCTAssertEqual(value, .friday)
    }
    
    func testNestedArrayValue() {
        let value: [DayOfWeek] = try! data.value(for: "object.array")
        XCTAssertEqual(value.count, 7)
        XCTAssertEqual(value.last, .saturday)
    }
    
    func testNestedDictionaryValue() {
        let value: [String: DayOfWeek] = try! data.value(for: "object.dictionary")
        XCTAssertEqual(value.count, 7)
        XCTAssertEqual(value["Sat"], .saturday)
    }
    
    func testNestedSetValue() {
        let value: Set<DayOfWeek> = try! data.value(for: "object.set")
        XCTAssertEqual(value.count, 1)
        XCTAssertEqual(value.first, .sunday)
    }
    
    func testKeyNotFound() {
        var value: DayOfWeek = .sunday
        
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
        XCTAssertEqual(value, .sunday)
    }
    
    func testTypeMismatch() {
        var value: DayOfWeek = .sunday
        
        let ex = self.expectation(description: "Type mismatch")
        do {
            value = try data.value(for: "string")
        }
        catch {
            if case OutlawError.typeMismatchWithKey = error {
                ex.fulfill()
            }
        }
        self.waitForExpectations(timeout: 1, handler: nil)
        XCTAssertEqual(value, .sunday)
    }
    
// MARK: -
// MARK: Optionals
    
    func testOptional() {
        let value: DayOfWeek? = data.optional(for: "enum")
        XCTAssertEqual(value, .friday)
    }
    
    func testOptionalArray() {
        let value: [DayOfWeek]? = data.optional(for: "array")
        XCTAssertEqual(value?.count, 7)
        XCTAssertEqual(value?.last, .saturday)
    }
    
    func testOptionalDictionary() {
        let value: [String: DayOfWeek]? = data.optional(for: "dictionary")
        XCTAssertEqual(value?.count, 7)
        XCTAssertEqual(value?["Sat"], .saturday)
    }
    
    func testOptionalSet() {
        let value: Set<DayOfWeek>? = data.optional(for: "set")
        XCTAssertEqual(value?.count, 1)
        XCTAssertEqual(value?.first, .sunday)
    }
    
    func testOptionalNestedValue() {
        let value: DayOfWeek? = data.optional(for: "object.enum")
        XCTAssertEqual(value, .friday)
    }
    
    func testOptionalNestedArray() {
        let value: [DayOfWeek]? = data.optional(for: "object.array")
        XCTAssertEqual(value?.count, 7)
        XCTAssertEqual(value?.last, .saturday)
    }
    
    func testOptionalNestedDictionary() {
        let value: [String: DayOfWeek]? = data.optional(for: "object.dictionary")
        XCTAssertEqual(value?.count, 7)
        XCTAssertEqual(value?["Sat"], .saturday)
    }
    
    func testOptionalNestedSet() {
        let value: Set<DayOfWeek>? = data.optional(for: "object.set")
        XCTAssertEqual(value?.count, 1)
        XCTAssertEqual(value?.first, .sunday)
    }
    
    func testOptionalKeyNotFound() {
        let value: DayOfWeek? = data.optional(for: "keyNotFound")
        XCTAssertNil(value)
    }
    
    func testOptionalTypeMismatch() {
        let value: DayOfWeek? = data.optional(for: "string")
        XCTAssertNil(value)
    }
}
