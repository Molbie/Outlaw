//
//  Int16Tests.swift
//  Outlaw
//
//  Created by Brian Mullen on 11/5/16.
//  Copyright © 2016 Molbie LLC. All rights reserved.
//

import XCTest
@testable import Outlaw


class Int16Tests: OutlawTestCase {
    func testValue() {
        let value: Int16 = try! data.value(for: "int16")
        XCTAssertEqual(value, -16)
    }
    
    func testNestedValue() {
        let value: Int16 = try! data.value(for: "object.int16")
        XCTAssertEqual(value, -16)
    }
    
    func testKeyNotFound() {
        var value: Int16 = 0
        
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
        var value: Int16 = 0
        
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
        let value: Int16? = data.value(for: "int16")
        XCTAssertEqual(value, -16)
    }
    
    func testOptionalNestedValue() {
        let value: Int16? = data.value(for: "object.int16")
        XCTAssertEqual(value, -16)
    }
    
    func testOptionalKeyNotFound() {
        let value: Int16? = data.value(for: "keyNotFound")
        XCTAssertNil(value)
    }
    
    func testOptionalTypeMismatch() {
        let value: Int16? = data.value(for: "string")
        XCTAssertNil(value)
    }
    
// MARK: -
// MARK: Bounds
    
    func testLowerBounds() {
        let value: Int16 = try! data.value(for: "minValue")
        XCTAssertEqual(value, -32768)
    }
    
    func testUpperBounds() {
        let value: Int16 = try! data.value(for: "maxValue")
        XCTAssertEqual(value, 32767)
    }
    
// MARK: -
// MARK: Transforms
    
    func testTransformValue() {
        let value: Int16 = try! data.value(for: "transform", with: { (rawValue: String) -> Int16 in
            guard let value = Int16(rawValue) else {
                throw OutlawError.typeMismatchWithKey(key: "transform", expected: Int.self, actual: rawValue)
            }
            return value
        })
        XCTAssertEqual(value, 12345)
    }
    
    func testOptionalTransformValue() {
        let value: Int16 = try! data.value(for: "transform", with: { (rawValue: String?) -> Int16 in
            guard let value = Int16(rawValue ?? "0") else {
                throw OutlawError.typeMismatchWithKey(key: "transform", expected: Int.self, actual: rawValue ?? "nil")
            }
            return value
        })
        XCTAssertEqual(value, 12345)
    }
    
    func testTransformOptionalValue() {
        let value: Int16? = data.value(for: "transform", with: { (rawValue: String) -> Int16? in
            return Int16(rawValue)
        })
        XCTAssertEqual(value, 12345)
    }
    
    func testOptionalTransformOptionalValue() {
        let value: Int16? = data.value(for: "transform", with: { (rawValue: String?) -> Int16? in
            guard let rawValue = rawValue else { return nil }
            return Int16(rawValue)
        })
        XCTAssertEqual(value, 12345)
    }
}
