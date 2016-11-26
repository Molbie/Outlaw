//
//  UInt16Tests.swift
//  Outlaw
//
//  Created by Brian Mullen on 11/6/16.
//  Copyright © 2016 Molbie LLC. All rights reserved.
//

import XCTest
@testable import Outlaw


class UInt16Tests: OutlawTestCase {
    lazy var data = OutlawTestCase.jsonData(for: "UInt16Tests")
    
    func testValue() {
        let value: UInt16 = try! data.value(for: "uint16")
        XCTAssertEqual(value, 16)
    }
    
    func testNestedValue() {
        let value: UInt16 = try! data.value(for: "object.uint16")
        XCTAssertEqual(value, 16)
    }
    
    func testKeyNotFound() {
        var value: UInt16 = 0
        
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
        var value: UInt16 = 0
        
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
        let value: UInt16? = data.value(for: "uint16")
        XCTAssertEqual(value, 16)
    }
    
    func testOptionalNestedValue() {
        let value: UInt16? = data.value(for: "object.uint16")
        XCTAssertEqual(value, 16)
    }
    
    func testOptionalKeyNotFound() {
        let value: UInt16? = data.value(for: "keyNotFound")
        XCTAssertNil(value)
    }
    
    func testOptionalTypeMismatch() {
        let value: UInt16? = data.value(for: "string")
        XCTAssertNil(value)
    }
    
// MARK: -
// MARK: Bounds
    
    func testLowerBounds() {
        let value: UInt16 = try! data.value(for: "minValue")
        XCTAssertEqual(value, 0)
    }
    
    func testUpperBounds() {
        let value: UInt16 = try! data.value(for: "maxValue")
        XCTAssertEqual(value, 65535)
    }
}
