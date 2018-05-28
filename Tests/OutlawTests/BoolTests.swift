//
//  BoolTests.swift
//  OutlawTests
//
//  Created by Brian Mullen on 11/5/16.
//  Copyright © 2016 Molbie LLC. All rights reserved.
//

import XCTest
@testable import Outlaw


class BoolTests: OutlawTestCase {
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
        let value: Bool = try! data.value(for: "bool")
        XCTAssertEqual(value, true)
    }
    
    func testNestedValue() {
        let value: Bool = try! data.value(for: "object.bool")
        XCTAssertEqual(value, true)
    }
    
    func testKeyNotFound() {
        var value: Bool = false
        
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
        XCTAssertEqual(value, false)
    }
    
    func testTypeMismatch() {
        var value: Bool = false
        
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
        XCTAssertEqual(value, false)
    }

// MARK: -
// MARK: Optionals
    
    func testOptional() {
        let value: Bool? = data.value(for: "bool")
        XCTAssertEqual(value, true)
    }
    
    func testOptionalNestedValue() {
        let value: Bool? = data.value(for: "object.bool")
        XCTAssertEqual(value, true)
    }
    
    func testOptionalKeyNotFound() {
        let value: Bool? = data.value(for: "keyNotFound")
        XCTAssertNil(value)
    }
    
    func testOptionalTypeMismatch() {
        let value: Bool? = data.value(for: "string")
        XCTAssertNil(value)
    }
    
// MARK: -
// MARK: Transforms
    
    func testTransformValue() {
        let value: Bool = try! data.value(for: "transform", with: { (rawValue: String) -> Bool in
            return rawValue == "TRUE"
        })
        XCTAssertEqual(value, true)
    }
    
    func testOptionalTransformValue() {
        let value: Bool = try! data.value(for: "transform", with: { (rawValue: String?) -> Bool in
            return rawValue == "TRUE"
        })
        XCTAssertEqual(value, true)
    }
    
    func testTransformOptionalValue() {
        let value: Bool? = data.value(for: "transform", with: { (rawValue: String) -> Bool? in
            return rawValue == "TRUE"
        })
        XCTAssertEqual(value, true)
    }
    
    func testOptionalTransformOptionalValue() {
        let value: Bool? = data.value(for: "transform", with: { (rawValue: String?) -> Bool? in
            return rawValue == "TRUE"
        })
        XCTAssertEqual(value, true)
    }
}
