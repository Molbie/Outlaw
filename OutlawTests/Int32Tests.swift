//
//  Int32Tests.swift
//  Outlaw
//
//  Created by Brian Mullen on 11/5/16.
//  Copyright © 2016 Molbie LLC. All rights reserved.
//

import XCTest
@testable import Outlaw


class Int32Tests: OutlawTestCase {
    func testValue() {
        let value: Int32 = try! data.value(for: "int32")
        XCTAssertEqual(value, -32)
    }
    
    func testNestedValue() {
        let value: Int32 = try! data.value(for: "object.int32")
        XCTAssertEqual(value, -32)
    }
    
    func testKeyNotFound() {
        var value: Int32 = 0
        
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
        var value: Int32 = 0
        
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
        let value: Int32? = data.value(for: "int32")
        XCTAssertEqual(value, -32)
    }
    
    func testOptionalNestedValue() {
        let value: Int32? = data.value(for: "object.int32")
        XCTAssertEqual(value, -32)
    }
    
    func testOptionalKeyNotFound() {
        let value: Int32? = data.value(for: "keyNotFound")
        XCTAssertNil(value)
    }
    
    func testOptionalTypeMismatch() {
        let value: Int32? = data.value(for: "string")
        XCTAssertNil(value)
    }
    
// MARK: -
// MARK: Bounds
    
    func testLowerBounds() {
        let value: Int32 = try! data.value(for: "minValue")
        XCTAssertEqual(value, -2147483648)
    }
    
    func testUpperBounds() {
        let value: Int32 = try! data.value(for: "maxValue")
        XCTAssertEqual(value, 2147483647)
    }
    
// MARK: -
// MARK: Transforms
    
    func testTransformValue() {
        let value: Int32 = try! data.value(for: "transform", with: { (rawValue: String) -> Int32 in
            guard let value = Int32(rawValue) else {
                throw OutlawError.typeMismatchWithKey(key: "transform", expected: Int.self, actual: rawValue)
            }
            return value
        })
        XCTAssertEqual(value, 12345)
    }
    
    func testOptionalTransformValue() {
        let value: Int32 = try! data.value(for: "transform", with: { (rawValue: String?) -> Int32 in
            guard let value = Int32(rawValue ?? "0") else {
                throw OutlawError.typeMismatchWithKey(key: "transform", expected: Int.self, actual: rawValue ?? "nil")
            }
            return value
        })
        XCTAssertEqual(value, 12345)
    }
    
    func testTransformOptionalValue() {
        let value: Int32? = data.value(for: "transform", with: { (rawValue: String) -> Int32? in
            return Int32(rawValue)
        })
        XCTAssertEqual(value, 12345)
    }
    
    func testOptionalTransformOptionalValue() {
        let value: Int32? = data.value(for: "transform", with: { (rawValue: String?) -> Int32? in
            guard let rawValue = rawValue else { return nil }
            return Int32(rawValue)
        })
        XCTAssertEqual(value, 12345)
    }
}
