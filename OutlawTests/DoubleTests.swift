//
//  DoubleTests.swift
//  Outlaw
//
//  Created by Brian Mullen on 11/5/16.
//  Copyright © 2016 Molbie LLC. All rights reserved.
//

import XCTest
@testable import Outlaw


class DoubleTests: OutlawTestCase {
    func testValue() {
        let value: Double = try! data.value(for: "double")
        XCTAssertEqual(value, 3.14159265359)
    }
    
    func testNestedValue() {
        let value: Double = try! data.value(for: "object.double")
        XCTAssertEqual(value, 3.14159265359)
    }
    
    func testKeyNotFound() {
        var value: Double = 0
        
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
        var value: Double = 0
        
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
        let value: Double? = data.value(for: "double")
        XCTAssertEqual(value, 3.14159265359)
    }
    
    func testOptionalNestedValue() {
        let value: Double? = data.value(for: "object.double")
        XCTAssertEqual(value, 3.14159265359)
    }
    
    func testOptionalKeyNotFound() {
        let value: Double? = data.value(for: "keyNotFound")
        XCTAssertNil(value)
    }
    
    func testOptionalTypeMismatch() {
        let value: Double? = data.value(for: "string")
        XCTAssertNil(value)
    }
    
// MARK: -
// MARK: Bounds
    
    func testLowerBounds() {
        let value: Double = try! data.value(for: "minValue")
        XCTAssertEqualWithAccuracy(value, 2.2250738585072e-115, accuracy: 0.1e-115)
    }
    
    func testUpperBounds() {
        let value: Double = try! data.value(for: "maxValue")
        XCTAssertEqualWithAccuracy(value, 1.79769313486232e+115, accuracy: 0.1e+115)
    }
}
