//
//  Int64Tests.swift
//  Outlaw
//
//  Created by Brian Mullen on 11/6/16.
//  Copyright © 2016 Molbie LLC. All rights reserved.
//

import XCTest
@testable import Outlaw


class Int64Tests: OutlawTestCase {
    lazy var data = OutlawTestCase.jsonData(for: "Int64Tests")
    
    func testValue() {
        let value: Int64 = try! data.value(for: "int64")
        XCTAssertEqual(value, -64)
    }
    
    func testNestedValue() {
        let value: Int64 = try! data.value(for: "object.int64")
        XCTAssertEqual(value, -64)
    }
    
    func testKeyNotFound() {
        var value: Int64 = 0
        
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
        var value: Int64 = 0
        
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
        let value: Int64? = data.value(for: "int64")
        XCTAssertEqual(value, -64)
    }
    
    func testOptionalNestedValue() {
        let value: Int64? = data.value(for: "object.int64")
        XCTAssertEqual(value, -64)
    }
    
    func testOptionalKeyNotFound() {
        let value: Int64? = data.value(for: "keyNotFound")
        XCTAssertNil(value)
    }
    
    func testOptionalTypeMismatch() {
        let value: Int64? = data.value(for: "string")
        XCTAssertNil(value)
    }
    
// MARK: -
// MARK: Bounds
    
    func testLowerBounds() {
        let value: Int64 = try! data.value(for: "minValue")
        XCTAssertEqual(value, -9223372036854775808)
    }
    
    func testUpperBounds() {
        let value: Int64 = try! data.value(for: "maxValue")
        XCTAssertEqual(value, 9223372036854775807)
    }
}
