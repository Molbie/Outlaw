//
//  UInt32Tests.swift
//  Outlaw
//
//  Created by Brian Mullen on 11/6/16.
//  Copyright © 2016 Molbie LLC. All rights reserved.
//

import XCTest
@testable import Outlaw


class UInt32Tests: OutlawTestCase {
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
        let value: UInt32 = try! data.value(for: "uint32")
        XCTAssertEqual(value, 32)
    }
    
    func testNestedValue() {
        let value: UInt32 = try! data.value(for: "object.uint32")
        XCTAssertEqual(value, 32)
    }
    
    func testKeyNotFound() {
        var value: UInt32 = 0
        
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
        var value: UInt32 = 0
        
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
        let value: UInt32? = data.optional(for: "uint32")
        XCTAssertEqual(value, 32)
    }
    
    func testOptionalNestedValue() {
        let value: UInt32? = data.optional(for: "object.uint32")
        XCTAssertEqual(value, 32)
    }
    
    func testOptionalKeyNotFound() {
        let value: UInt32? = data.optional(for: "keyNotFound")
        XCTAssertNil(value)
    }
    
    func testOptionalTypeMismatch() {
        let value: UInt32? = data.optional(for: "string")
        XCTAssertNil(value)
    }
    
// MARK: -
// MARK: Bounds
    
    func testLowerBounds() {
        let value: UInt32 = try! data.value(for: "minValue")
        XCTAssertEqual(value, 0)
    }
    
    func testUpperBounds() {
        let value: UInt32 = try! data.value(for: "maxValue")
        XCTAssertEqual(value, 4294967295)
    }
    
// MARK: -
// MARK: Transforms
    
    func testTransformValue() {
        let value: UInt32 = try! data.value(for: "transform", with: { (rawValue: String) -> UInt32 in
            guard let value = UInt32(rawValue) else {
                throw OutlawError.typeMismatchWithKey(key: "transform", expected: Int.self, actual: rawValue)
            }
            return value
        })
        XCTAssertEqual(value, 12345)
    }
    
    func testOptionalTransformValue() {
        let value: UInt32 = try! data.value(for: "transform", with: { (rawValue: String?) -> UInt32 in
            guard let value = UInt32(rawValue ?? "0") else {
                throw OutlawError.typeMismatchWithKey(key: "transform", expected: Int.self, actual: rawValue ?? "nil")
            }
            return value
        })
        XCTAssertEqual(value, 12345)
    }
    
    func testTransformOptionalValue() {
        let value: UInt32? = data.optional(for: "transform", with: { (rawValue: String) -> UInt32? in
            return UInt32(rawValue)
        })
        XCTAssertEqual(value, 12345)
    }
    
    func testOptionalTransformOptionalValue() {
        let value: UInt32? = data.optional(for: "transform", with: { (rawValue: String?) -> UInt32? in
            guard let rawValue = rawValue else { return nil }
            return UInt32(rawValue)
        })
        XCTAssertEqual(value, 12345)
    }
}
