//
//  URLTests.swift
//  Outlaw
//
//  Created by Brian Mullen on 11/15/16.
//  Copyright © 2016 Molbie LLC. All rights reserved.
//

import XCTest
@testable import Outlaw


class URLTests: OutlawTestCase {
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
        let value: URL = try! data.value(for: "url")
        XCTAssertEqual(value.absoluteString, "https://developer.apple.com/")
    }
    
    func testNestedValue() {
        let value: URL = try! data.value(for: "object.url")
        XCTAssertEqual(value.absoluteString, "https://developer.apple.com/")
    }
    
    func testKeyNotFound() {
        var value: URL = URL(string: "/")!
        
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
        XCTAssertEqual(value.absoluteString, "/")
    }
    
    func testTypeMismatch() {
        var value: URL = URL(string: "/")!
        
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
        XCTAssertEqual(value.absoluteString, "/")
    }
    
// MARK: -
// MARK: Optionals
    
    func testOptional() {
        let value: URL? = data.value(for: "url")
        XCTAssertEqual(value?.absoluteString, "https://developer.apple.com/")
    }
    
    func testOptionalNestedValue() {
        let value: URL? = data.value(for: "object.url")
        XCTAssertEqual(value?.absoluteString, "https://developer.apple.com/")
    }
    
    func testOptionalKeyNotFound() {
        let value: URL? = data.value(for: "keyNotFound")
        XCTAssertNil(value)
    }
    
    func testOptionalTypeMismatch() {
        let value: URL? = data.value(for: "bool")
        XCTAssertNil(value)
    }
    
// MARK: -
// MARK: Transforms
    
    func testTransformValue() {
        let value: URL = try! data.value(for: "transform", with: { (rawValue: String) -> URL in
            let urlValue = rawValue == "HOMEPAGE" ? "http://molbie.co" : rawValue
            guard let value = URL(string: urlValue) else {
                throw OutlawError.typeMismatchWithKey(key: "transform", expected: URL.self, actual: rawValue)
            }
            
            return value
        })
        XCTAssertEqual(value.absoluteString, "http://molbie.co")
    }
    
    func testOptionalTransformValue() {
        let value: URL = try! data.value(for: "transform", with: { (rawValue: String?) -> URL in
            let urlValue = rawValue == "HOMEPAGE" ? "http://molbie.co" : (rawValue ?? "")
            guard let value = URL(string: urlValue) else {
                throw OutlawError.typeMismatchWithKey(key: "transform", expected: URL.self, actual: rawValue ?? "")
            }
            
            return value
        })
        XCTAssertEqual(value.absoluteString, "http://molbie.co")
    }
    
    func testTransformOptionalValue() {
        let value: URL? = data.value(for: "transform", with: { (rawValue: String) -> URL? in
            let urlValue = rawValue == "HOMEPAGE" ? "http://molbie.co" : rawValue
            return URL(string: urlValue)
        })
        XCTAssertEqual(value?.absoluteString, "http://molbie.co")
    }
    
    func testOptionalTransformOptionalValue() {
        let value: URL? = data.value(for: "transform", with: { (rawValue: String?) -> URL? in
            let urlValue = rawValue == "HOMEPAGE" ? "http://molbie.co" : (rawValue ?? "")
            return URL(string: urlValue)
        })
        XCTAssertEqual(value?.absoluteString, "http://molbie.co")
    }
}
