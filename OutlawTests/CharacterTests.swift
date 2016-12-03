//
//  CharacterTests.swift
//  Outlaw
//
//  Created by Brian Mullen on 11/5/16.
//  Copyright © 2016 Molbie LLC. All rights reserved.
//

import XCTest
@testable import Outlaw


class CharacterTests: OutlawTestCase {
    func testValue() {
        let value: Character = try! data.value(for: "character")
        XCTAssertEqual(value, "O")
    }
    
    func testNestedValue() {
        let value: Character = try! data.value(for: "object.character")
        XCTAssertEqual(value, "O")
    }
    
    func testKeyNotFound() {
        var value: Character = Character(" ")
        
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
        XCTAssertEqual(value, Character(" "))
    }
    
    func testTypeMismatch() {
        var value: Character = Character(" ")
        
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
        XCTAssertEqual(value, Character(" "))
    }
    
// MARK: -
// MARK: Optionals
    
    func testOptional() {
        let value: Character? = data.value(for: "character")
        XCTAssertEqual(value, "O")
    }
    
    func testOptionalNestedValue() {
        let value: Character? = data.value(for: "object.character")
        XCTAssertEqual(value, "O")
    }
    
    func testOptionalKeyNotFound() {
        let value: Character? = data.value(for: "keyNotFound")
        XCTAssertNil(value)
    }
    
    func testOptionalTypeMismatch() {
        let value: Character? = data.value(for: "bool")
        XCTAssertNil(value)
    }
    
// MARK: -
// MARK: Transforms
    
    func testTransformValue() {
        let value: Character = try! data.value(for: "transform", with: { (rawValue: Bool) -> Character in
            return rawValue ? "1" : "0"
        })
        XCTAssertEqual(value, "1")
    }
    
    func testOptionalTransformValue() {
        let value: Character = try! data.value(for: "transform", with: { (rawValue: Bool?) -> Character in
            guard let rawValue = rawValue else { return "0" }
            return rawValue ? "1" : "0"
        })
        XCTAssertEqual(value, "1")
    }
    
    func testTransformOptionalValue() {
        let value: Character? = data.value(for: "transform", with: { (rawValue: Bool) -> Character? in
            return rawValue ? "1" : "0"
        })
        XCTAssertEqual(value, "1")
    }
    
    func testOptionalTransformOptionalValue() {
        let value: Character? = data.value(for: "transform", with: { (rawValue: Bool?) -> Character? in
            guard let rawValue = rawValue else { return nil }
            return rawValue ? "1" : "0"
        })
        XCTAssertEqual(value, "1")
    }
}
