//
//  UInt64Tests.swift
//  Outlaw
//
//  Created by Brian Mullen on 11/6/16.
//  Copyright © 2016 Molbie LLC. All rights reserved.
//

import XCTest
@testable import Outlaw


class UInt64Tests: OutlawTestCase {
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
        let value: UInt64 = try! data.value(for: "uint64")
        XCTAssertEqual(value, 64)
    }
    
    func testNestedValue() {
        let value: UInt64 = try! data.value(for: "object.uint64")
        XCTAssertEqual(value, 64)
    }
    
    func testKeyNotFound() {
        var value: UInt64 = 0
        
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
        var value: UInt64 = 0
        
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
        let value: UInt64? = data.optional(for: "uint64")
        XCTAssertEqual(value, 64)
    }
    
    func testOptionalNestedValue() {
        let value: UInt64? = data.optional(for: "object.uint64")
        XCTAssertEqual(value, 64)
    }
    
    func testOptionalKeyNotFound() {
        let value: UInt64? = data.optional(for: "keyNotFound")
        XCTAssertNil(value)
    }
    
    func testOptionalTypeMismatch() {
        let value: UInt64? = data.optional(for: "string")
        XCTAssertNil(value)
    }
    
// MARK: -
// MARK: Bounds
    
    func testLowerBounds() {
        let value: UInt64 = try! data.value(for: "minValue")
        XCTAssertEqual(value, 0)
    }
    
    func testUpperBounds() {
        let value: UInt64 = try! data.value(for: "maxValue")
        let maxValue: UInt64 = 18446744073709551615
        XCTAssertEqual(value, maxValue)
    }
    
// MARK: -
// MARK: Transforms
    
    func testTransformValue() {
        let value: UInt64 = try! data.value(for: "transform", with: { (rawValue: String) -> UInt64 in
            guard let value = UInt64(rawValue) else {
                throw OutlawError.typeMismatchWithKey(key: "transform", expected: Int.self, actual: rawValue)
            }
            return value
        })
        XCTAssertEqual(value, 12345)
    }
    
    func testOptionalTransformValue() {
        let value: UInt64 = try! data.value(for: "transform", with: { (rawValue: String?) -> UInt64 in
            guard let value = UInt64(rawValue ?? "0") else {
                throw OutlawError.typeMismatchWithKey(key: "transform", expected: Int.self, actual: rawValue ?? "nil")
            }
            return value
        })
        XCTAssertEqual(value, 12345)
    }
    
    func testTransformOptionalValue() {
        let value: UInt64? = data.optional(for: "transform", with: { (rawValue: String) -> UInt64? in
            return UInt64(rawValue)
        })
        XCTAssertEqual(value, 12345)
    }
    
    func testOptionalTransformOptionalValue() {
        let value: UInt64? = data.optional(for: "transform", with: { (rawValue: String?) -> UInt64? in
            guard let rawValue = rawValue else { return nil }
            return UInt64(rawValue)
        })
        XCTAssertEqual(value, 12345)
    }
}
