//
//  UIntTests.swift
//  Outlaw
//
//  Created by Brian Mullen on 11/6/16.
//  Copyright © 2016 Molbie LLC. All rights reserved.
//

import XCTest
@testable import Outlaw


class UIntTests: OutlawTestCase {
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
        let value: UInt = try! data.value(for: "uint")
        XCTAssertEqual(value, 3)
    }
    
    func testNestedValue() {
        let value: UInt = try! data.value(for: "object.uint")
        XCTAssertEqual(value, 3)
    }
    
    func testKeyNotFound() {
        var value: UInt = 0
        
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
        var value: UInt = 0
        
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
        let value: UInt? = data.value(for: "uint")
        XCTAssertEqual(value, 3)
    }
    
    func testOptionalNestedValue() {
        let value: UInt? = data.value(for: "object.uint")
        XCTAssertEqual(value, 3)
    }
    
    func testOptionalKeyNotFound() {
        let value: UInt? = data.value(for: "keyNotFound")
        XCTAssertNil(value)
    }
    
    func testOptionalTypeMismatch() {
        let value: UInt? = data.value(for: "string")
        XCTAssertNil(value)
    }
    
// MARK: -
// MARK: Bounds
    
    func testLowerBounds() {
        let value: UInt = try! data.value(for: "minValue")
        XCTAssertEqual(value, 0)
    }
    
    func testUpperBounds() {
        let value: UInt = try! data.value(for: "maxValue")
        let maxValue: UInt64 = 18446744073709551615
        XCTAssertEqual(value, UInt(maxValue))
    }
    
// MARK: -
// MARK: Transforms
    
    func testTransformValue() {
        let value: UInt = try! data.value(for: "transform", with: { (rawValue: String) -> UInt in
            guard let value = UInt(rawValue) else {
                throw OutlawError.typeMismatchWithKey(key: "transform", expected: Int.self, actual: rawValue)
            }
            return value
        })
        XCTAssertEqual(value, 12345)
    }
    
    func testOptionalTransformValue() {
        let value: UInt = try! data.value(for: "transform", with: { (rawValue: String?) -> UInt in
            guard let value = UInt(rawValue ?? "0") else {
                throw OutlawError.typeMismatchWithKey(key: "transform", expected: Int.self, actual: rawValue ?? "nil")
            }
            return value
        })
        XCTAssertEqual(value, 12345)
    }
    
    func testTransformOptionalValue() {
        let value: UInt? = data.value(for: "transform", with: { (rawValue: String) -> UInt? in
            return UInt(rawValue)
        })
        XCTAssertEqual(value, 12345)
    }
    
    func testOptionalTransformOptionalValue() {
        let value: UInt? = data.value(for: "transform", with: { (rawValue: String?) -> UInt? in
            guard let rawValue = rawValue else { return nil }
            return UInt(rawValue)
        })
        XCTAssertEqual(value, 12345)
    }
}
