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
    lazy var data = OutlawTestCase.jsonData(for: "IntTests")
    
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
        let value: Int? = data.value(for: "int")
        XCTAssertEqual(value, -3)
    }
    
    func testOptionalNestedValue() {
        let value: Int? = data.value(for: "object.int")
        XCTAssertEqual(value, -3)
    }
    
    func testOptionalKeyNotFound() {
        let value: Int? = data.value(for: "keyNotFound")
        XCTAssertNil(value)
    }
    
    func testOptionalTypeMismatch() {
        let value: Int? = data.value(for: "string")
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
}
