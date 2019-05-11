//
//  StringTests.swift
//  Outlaw
//
//  Created by Brian Mullen on 11/5/16.
//  Copyright © 2016 Molbie LLC. All rights reserved.
//

import XCTest
@testable import Outlaw


class StringTests: OutlawTestCase {
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
        let value: String = try! data.value(for: "string")
        XCTAssertEqual(value, "Hello, Outlaw!")
    }
    
    func testNestedValue() {
        let value: String = try! data.value(for: "object.string")
        XCTAssertEqual(value, "Hello, Outlaw!")
    }
    
    func testKeyNotFound() {
        var value: String = ""
        
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
        XCTAssertEqual(value, "")
    }
    
    func testTypeMismatch() {
        var value: String = ""
        
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
        XCTAssertEqual(value, "")
    }
    
// MARK: -
// MARK: Optionals
    
    func testOptional() {
        let value: String? = data.optional(for: "string")
        XCTAssertEqual(value, "Hello, Outlaw!")
    }
    
    func testOptionalNestedValue() {
        let value: String? = data.optional(for: "object.string")
        XCTAssertEqual(value, "Hello, Outlaw!")
    }
    
    func testOptionalKeyNotFound() {
        let value: String? = data.optional(for: "keyNotFound")
        XCTAssertNil(value)
    }
    
    func testOptionalTypeMismatch() {
        let value: String? = data.optional(for: "bool")
        XCTAssertNil(value)
    }
    
// MARK: -
// MARK: Transforms
    
    func testTransformValue() {
        let value: String = try! data.value(for: "transform", with: { (rawValue: Bool) -> String in
            return rawValue ? "TRUE" : "FALSE"
        })
        XCTAssertEqual(value, "TRUE")
    }
    
    func testOptionalTransformValue() {
        let value: String = try! data.value(for: "transform", with: { (rawValue: Bool?) -> String in
            guard let rawValue = rawValue else { return "FALSE" }
            return rawValue ? "TRUE" : "FALSE"
        })
        XCTAssertEqual(value, "TRUE")
    }
    
    func testTransformOptionalValue() {
        let value: String? = data.optional(for: "transform", with: { (rawValue: Bool) -> String? in
            return rawValue ? "TRUE" : "FALSE"
        })
        XCTAssertEqual(value, "TRUE")
    }
    
    func testOptionalTransformOptionalValue() {
        let value: String? = data.optional(for: "transform", with: { (rawValue: Bool?) -> String? in
            guard let rawValue = rawValue else { return nil }
            return rawValue ? "TRUE" : "FALSE"
        })
        XCTAssertEqual(value, "TRUE")
    }
}
