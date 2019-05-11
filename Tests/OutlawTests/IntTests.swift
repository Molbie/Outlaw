//
//  IntTests.swift
//  Outlaw
//
//  Created by Brian Mullen on 11/5/16.
//  Copyright © 2016 Molbie LLC. All rights reserved.
//

import XCTest
@testable import Outlaw


class IntTests: OutlawTestCase {
    static var allTests = [("testValue", testValue),
                           ("testNestedValue", testNestedValue),
                           ("testKeyNotFound", testKeyNotFound),
                           ("testTypeMismatch", testTypeMismatch),
                           ("testOptional", testOptional),
                           ("testOptionalNestedValue", testOptionalNestedValue),
                           ("testOptionalKeyNotFound", testOptionalKeyNotFound),
                           ("testOptionalTypeMismatch", testOptionalTypeMismatch),
                           ("testLowerBounds", testLowerBounds),
                           ("testUpperBounds", testUpperBounds),
                           ("testTransformValue", testTransformValue),
                           ("testOptionalTransformValue", testOptionalTransformValue),
                           ("testTransformOptionalValue", testTransformOptionalValue),
                           ("testOptionalTransformOptionalValue", testOptionalTransformOptionalValue)]
    
    func testValue() {
        let value: Int = try! data.value(for: "int")
        XCTAssertEqual(value, -3)
    }
    
    func testNestedValue() {
        let value: Int = try! data.value(for: "object.int")
        XCTAssertEqual(value, -3)
    }
    
    func testKeyNotFound() {
        var value: Int = 0
        
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
        XCTAssertEqual(value, 0)
    }
    
    func testTypeMismatch() {
        var value: Int = 0
        
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
        XCTAssertEqual(value, 0)
    }
    
// MARK: -
// MARK: Optionals
    
    func testOptional() {
        let value: Int? = data.optional(for: "int")
        XCTAssertEqual(value, -3)
    }
    
    func testOptionalNestedValue() {
        let value: Int? = data.optional(for: "object.int")
        XCTAssertEqual(value, -3)
    }
    
    func testOptionalKeyNotFound() {
        let value: Int? = data.optional(for: "keyNotFound")
        XCTAssertNil(value)
    }
    
    func testOptionalTypeMismatch() {
        let value: Int? = data.optional(for: "string")
        XCTAssertNil(value)
    }
    
// MARK: -
// MARK: Bounds
    
    func testLowerBounds() {
        let value: Int = try! data.value(for: "minValue")
        let minValue: Int64 = -9223372036854775808
        XCTAssertEqual(value, Int(minValue))
    }
    
    func testUpperBounds() {
        let value: Int = try! data.value(for: "maxValue")
        let maxValue: Int64 = 9223372036854775807
        XCTAssertEqual(value, Int(maxValue))
    }
    
// MARK: -
// MARK: Transforms
    
    func testTransformValue() {
        let value: Int = try! data.value(for: "transform", with: { (rawValue: String) -> Int in
            guard let value = Int(rawValue) else {
                throw OutlawError.typeMismatchWithKey(key: "transform", expected: Int.self, actual: rawValue)
            }
            return value
        })
        XCTAssertEqual(value, 12345)
    }
    
    func testOptionalTransformValue() {
        let value: Int = try! data.value(for: "transform", with: { (rawValue: String?) -> Int in
            guard let value = Int(rawValue ?? "0") else {
                throw OutlawError.typeMismatchWithKey(key: "transform", expected: Int.self, actual: rawValue ?? "nil")
            }
            return value
        })
        XCTAssertEqual(value, 12345)
    }
    
    func testTransformOptionalValue() {
        let value: Int? = data.optional(for: "transform", with: { (rawValue: String) -> Int? in
            return Int(rawValue)
        })
        XCTAssertEqual(value, 12345)
    }
    
    func testOptionalTransformOptionalValue() {
        let value: Int? = data.optional(for: "transform", with: { (rawValue: String?) -> Int? in
            guard let rawValue = rawValue else { return nil }
            return Int(rawValue)
        })
        XCTAssertEqual(value, 12345)
    }
}
