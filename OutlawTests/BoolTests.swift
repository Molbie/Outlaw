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
}
