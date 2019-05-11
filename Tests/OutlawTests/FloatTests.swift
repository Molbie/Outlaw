//
//  FloatTests.swift
//  Outlaw
//
//  Created by Brian Mullen on 11/5/16.
//  Copyright © 2016 Molbie LLC. All rights reserved.
//

import XCTest
@testable import Outlaw


class FloatTests: OutlawTestCase {
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
        let value: Float = try! data.value(for: "float")
        XCTAssertEqual(value, 3.14)
    }
    
    func testNestedValue() {
        let value: Float = try! data.value(for: "object.float")
        XCTAssertEqual(value, 3.14)
    }
    
    func testKeyNotFound() {
        var value: Float = 0
        
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
        var value: Float = 0
        
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
        let value: Float? = data.optional(for: "float")
        XCTAssertEqual(value, 3.14)
    }
    
    func testOptionalNestedValue() {
        let value: Float? = data.optional(for: "object.float")
        XCTAssertEqual(value, 3.14)
    }
    
    func testOptionalKeyNotFound() {
        let value: Float? = data.optional(for: "keyNotFound")
        XCTAssertNil(value)
    }
    
    func testOptionalTypeMismatch() {
        let value: Float? = data.optional(for: "string")
        XCTAssertNil(value)
    }
    
// MARK: -
// MARK: Bounds
    
    func testLowerBounds() {
        let value: Float = try! data.value(for: "minValue")
        XCTAssertEqual(value, 1.17549e-37)
    }
    
    func testUpperBounds() {
        let value: Float = try! data.value(for: "maxValue")
        XCTAssertEqual(value, 3.40282e+38)
    }
    
// MARK: -
// MARK: Transforms
    
    func testTransformValue() {
        let value: Float = try! data.value(for: "transform", with: { (rawValue: String) -> Float in
            return rawValue == "PI" ? 3.14 : 0
        })
        XCTAssertEqual(value, 3.14)
    }
    
    func testOptionalTransformValue() {
        let value: Float = try! data.value(for: "transform", with: { (rawValue: String?) -> Float in
            guard let rawValue = rawValue else { return 0 }
            return rawValue == "PI" ? 3.14 : 0
        })
        XCTAssertEqual(value, 3.14)
    }
    
    func testTransformOptionalValue() {
        let value: Float? = data.optional(for: "transform", with: { (rawValue: String) -> Float? in
            return rawValue == "PI" ? 3.14 : 0
        })
        XCTAssertEqual(value, 3.14)
    }
    
    func testOptionalTransformOptionalValue() {
        let value: Float? = data.optional(for: "transform", with: { (rawValue: String?) -> Float? in
            guard let rawValue = rawValue else { return nil }
            return rawValue == "PI" ? 3.14 : 0
        })
        XCTAssertEqual(value, 3.14)
    }
}
