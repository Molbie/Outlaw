//
//  SetTests.swift
//  Outlaw
//
//  Created by Brian Mullen on 11/9/16.
//  Copyright © 2016 Molbie LLC. All rights reserved.
//

import XCTest
@testable import Outlaw


class SetTests: OutlawTestCase {
    lazy var data = OutlawTestCase.jsonData(for: "SetTests")
    
    func testValue() {
        let bool: Set<Bool> = try! data.value(for: "bool")
        XCTAssertEqual(bool.count, 2)
        XCTAssertEqual(bool.first, false)
        
        let string: Set<String> = try! data.value(for: "string")
        XCTAssertEqual(string.count, 1)
        XCTAssertEqual(string.first, "Hello, Outlaw!")
        
        let character: Set<Character> = try! data.value(for: "character")
        XCTAssertEqual(character.count, 1)
        XCTAssertEqual(character.first, "O")
        
        let float: Set<Float> = try! data.value(for: "float")
        XCTAssertEqual(float.count, 1)
        XCTAssertEqual(float.first, 3.14)
        
        let double: Set<Double> = try! data.value(for: "double")
        XCTAssertEqual(double.count, 1)
        XCTAssertEqual(double.first, 3.14159265359)
        
        let int: Set<Int> = try! data.value(for: "int")
        XCTAssertEqual(int.count, 1)
        XCTAssertEqual(int.first, -3)
        
        let int8: Set<Int8> = try! data.value(for: "int8")
        XCTAssertEqual(int8.count, 1)
        XCTAssertEqual(int8.first, -8)
        
        let int16: Set<Int16> = try! data.value(for: "int16")
        XCTAssertEqual(int16.count, 1)
        XCTAssertEqual(int16.first, -16)
        
        let int32: Set<Int32> = try! data.value(for: "int32")
        XCTAssertEqual(int32.count, 1)
        XCTAssertEqual(int32.first, -32)
        
        let int64: Set<Int64> = try! data.value(for: "int64")
        XCTAssertEqual(int64.count, 1)
        XCTAssertEqual(int64.first, -64)
        
        let uint: Set<UInt> = try! data.value(for: "uint")
        XCTAssertEqual(uint.count, 1)
        XCTAssertEqual(uint.first, 3)
        
        let uint8: Set<UInt8> = try! data.value(for: "uint8")
        XCTAssertEqual(uint8.count, 1)
        XCTAssertEqual(uint8.first, 8)
        
        let uint16: Set<UInt16> = try! data.value(for: "uint16")
        XCTAssertEqual(uint16.count, 1)
        XCTAssertEqual(uint16.first, 16)
        
        let uint32: Set<UInt32> = try! data.value(for: "uint32")
        XCTAssertEqual(uint32.count, 1)
        XCTAssertEqual(uint32.first, 32)
        
        let uint64: Set<UInt64> = try! data.value(for: "uint64")
        XCTAssertEqual(uint64.count, 1)
        XCTAssertEqual(uint64.first, 64)
        
        let url: Set<URL> = try! data.value(for: "url")
        XCTAssertEqual(url.count, 1)
        XCTAssertEqual(url.first?.absoluteString, "https://developer.apple.com/")
    }
    
    func testNestedValue() {
        let bool: Set<Bool> = try! data.value(for: "object.bool")
        XCTAssertEqual(bool.count, 2)
        XCTAssertEqual(bool.first, false)
        
        let string: Set<String> = try! data.value(for: "object.string")
        XCTAssertEqual(string.count, 1)
        XCTAssertEqual(string.first, "Hello, Outlaw!")
        
        let character: Set<Character> = try! data.value(for: "object.character")
        XCTAssertEqual(character.count, 1)
        XCTAssertEqual(character.first, "O")
        
        let float: Set<Float> = try! data.value(for: "object.float")
        XCTAssertEqual(float.count, 1)
        XCTAssertEqual(float.first, 3.14)
        
        let double: Set<Double> = try! data.value(for: "object.double")
        XCTAssertEqual(double.count, 1)
        XCTAssertEqual(double.first, 3.14159265359)
        
        let int: Set<Int> = try! data.value(for: "object.int")
        XCTAssertEqual(int.count, 1)
        XCTAssertEqual(int.first, -3)
        
        let int8: Set<Int8> = try! data.value(for: "object.int8")
        XCTAssertEqual(int8.count, 1)
        XCTAssertEqual(int8.first, -8)
        
        let int16: Set<Int16> = try! data.value(for: "object.int16")
        XCTAssertEqual(int16.count, 1)
        XCTAssertEqual(int16.first, -16)
        
        let int32: Set<Int32> = try! data.value(for: "object.int32")
        XCTAssertEqual(int32.count, 1)
        XCTAssertEqual(int32.first, -32)
        
        let int64: Set<Int64> = try! data.value(for: "object.int64")
        XCTAssertEqual(int64.count, 1)
        XCTAssertEqual(int64.first, -64)
        
        let uint: Set<UInt> = try! data.value(for: "object.uint")
        XCTAssertEqual(uint.count, 1)
        XCTAssertEqual(uint.first, 3)
        
        let uint8: Set<UInt8> = try! data.value(for: "object.uint8")
        XCTAssertEqual(uint8.count, 1)
        XCTAssertEqual(uint8.first, 8)
        
        let uint16: Set<UInt16> = try! data.value(for: "object.uint16")
        XCTAssertEqual(uint16.count, 1)
        XCTAssertEqual(uint16.first, 16)
        
        let uint32: Set<UInt32> = try! data.value(for: "object.uint32")
        XCTAssertEqual(uint32.count, 1)
        XCTAssertEqual(uint32.first, 32)
        
        let uint64: Set<UInt64> = try! data.value(for: "object.uint64")
        XCTAssertEqual(uint64.count, 1)
        XCTAssertEqual(uint64.first, 64)
        
        let url: Set<URL> = try! data.value(for: "object.url")
        XCTAssertEqual(url.count, 1)
        XCTAssertEqual(url.first?.absoluteString, "https://developer.apple.com/")
    }
    
    func testKeyNotFound() {
        var value: Set<Int> = []
        
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
        XCTAssertEqual(value.count, 0)
    }
    
    func testTypeMismatch() {
        var value: Set<Int> = []
        
        let ex = self.expectation(description: "Type mismatch")
        do {
            value = try data.value(for: "object")
        }
        catch {
            if case OutlawError.typeMismatchWithKey = error {
                ex.fulfill()
            }
        }
        self.waitForExpectations(timeout: 1, handler: nil)
        XCTAssertEqual(value.count, 0)
    }
    
// MARK: -
// MARK: Optionals
    
    func testOptional() {
        let bool: Set<Bool>? = data.value(for: "bool")
        XCTAssertEqual(bool?.count, 2)
        XCTAssertEqual(bool?.first, false)
        
        let string: Set<String>? = data.value(for: "string")
        XCTAssertEqual(string?.count, 1)
        XCTAssertEqual(string?.first, "Hello, Outlaw!")
        
        let character: Set<Character>? = data.value(for: "character")
        XCTAssertEqual(character?.count, 1)
        XCTAssertEqual(character?.first, "O")
        
        let float: Set<Float>? = data.value(for: "float")
        XCTAssertEqual(float?.count, 1)
        XCTAssertEqual(float?.first, 3.14)
        
        let double: Set<Double>? = data.value(for: "double")
        XCTAssertEqual(double?.count, 1)
        XCTAssertEqual(double?.first, 3.14159265359)
        
        let int: Set<Int>? = data.value(for: "int")
        XCTAssertEqual(int?.count, 1)
        XCTAssertEqual(int?.first, -3)
        
        let int8: Set<Int8>? = data.value(for: "int8")
        XCTAssertEqual(int8?.count, 1)
        XCTAssertEqual(int8?.first, -8)
        
        let int16: Set<Int16>? = data.value(for: "int16")
        XCTAssertEqual(int16?.count, 1)
        XCTAssertEqual(int16?.first, -16)
        
        let int32: Set<Int32>? = data.value(for: "int32")
        XCTAssertEqual(int32?.count, 1)
        XCTAssertEqual(int32?.first, -32)
        
        let int64: Set<Int64>? = data.value(for: "int64")
        XCTAssertEqual(int64?.count, 1)
        XCTAssertEqual(int64?.first, -64)
        
        let uint: Set<UInt>? = data.value(for: "uint")
        XCTAssertEqual(uint?.count, 1)
        XCTAssertEqual(uint?.first, 3)
        
        let uint8: Set<UInt8>? = data.value(for: "uint8")
        XCTAssertEqual(uint8?.count, 1)
        XCTAssertEqual(uint8?.first, 8)
        
        let uint16: Set<UInt16>? = data.value(for: "uint16")
        XCTAssertEqual(uint16?.count, 1)
        XCTAssertEqual(uint16?.first, 16)
        
        let uint32: Set<UInt32>? = data.value(for: "uint32")
        XCTAssertEqual(uint32?.count, 1)
        XCTAssertEqual(uint32?.first, 32)
        
        let uint64: Set<UInt64>? = data.value(for: "uint64")
        XCTAssertEqual(uint64?.count, 1)
        XCTAssertEqual(uint64?.first, 64)
        
        let url: Set<URL>? = data.value(for: "url")
        XCTAssertEqual(url?.count, 1)
        XCTAssertEqual(url?.first?.absoluteString, "https://developer.apple.com/")
    }
    
    func testOptionalNestedValue() {
        let bool: Set<Bool>? = data.value(for: "object.bool")
        XCTAssertEqual(bool?.count, 2)
        XCTAssertEqual(bool?.first, false)
        
        let string: Set<String>? = data.value(for: "object.string")
        XCTAssertEqual(string?.count, 1)
        XCTAssertEqual(string?.first, "Hello, Outlaw!")
        
        let character: Set<Character>? = data.value(for: "object.character")
        XCTAssertEqual(character?.count, 1)
        XCTAssertEqual(character?.first, "O")
        
        let float: Set<Float>? = data.value(for: "object.float")
        XCTAssertEqual(float?.count, 1)
        XCTAssertEqual(float?.first, 3.14)
        
        let double: Set<Double>? = data.value(for: "object.double")
        XCTAssertEqual(double?.count, 1)
        XCTAssertEqual(double?.first, 3.14159265359)
        
        let int: Set<Int>? = data.value(for: "object.int")
        XCTAssertEqual(int?.count, 1)
        XCTAssertEqual(int?.first, -3)
        
        let int8: Set<Int8>? = data.value(for: "object.int8")
        XCTAssertEqual(int8?.count, 1)
        XCTAssertEqual(int8?.first, -8)
        
        let int16: Set<Int16>? = data.value(for: "object.int16")
        XCTAssertEqual(int16?.count, 1)
        XCTAssertEqual(int16?.first, -16)
        
        let int32: Set<Int32>? = data.value(for: "object.int32")
        XCTAssertEqual(int32?.count, 1)
        XCTAssertEqual(int32?.first, -32)
        
        let int64: Set<Int64>? = data.value(for: "object.int64")
        XCTAssertEqual(int64?.count, 1)
        XCTAssertEqual(int64?.first, -64)
        
        let uint: Set<UInt>? = data.value(for: "object.uint")
        XCTAssertEqual(uint?.count, 1)
        XCTAssertEqual(uint?.first, 3)
        
        let uint8: Set<UInt8>? = data.value(for: "object.uint8")
        XCTAssertEqual(uint8?.count, 1)
        XCTAssertEqual(uint8?.first, 8)
        
        let uint16: Set<UInt16>? = data.value(for: "object.uint16")
        XCTAssertEqual(uint16?.count, 1)
        XCTAssertEqual(uint16?.first, 16)
        
        let uint32: Set<UInt32>? = data.value(for: "object.uint32")
        XCTAssertEqual(uint32?.count, 1)
        XCTAssertEqual(uint32?.first, 32)
        
        let uint64: Set<UInt64>? = data.value(for: "object.uint64")
        XCTAssertEqual(uint64?.count, 1)
        XCTAssertEqual(uint64?.first, 64)
        
        let url: Set<URL>? = data.value(for: "object.url")
        XCTAssertEqual(url?.count, 1)
        XCTAssertEqual(url?.first?.absoluteString, "https://developer.apple.com/")
    }
    
    func testOptionalKeyNotFound() {
        let value: Set<Int>? = data.value(for: "keyNotFound")
        XCTAssertNil(value)
    }
    
    func testOptionalTypeMismatch() {
        let value: Set<Int>? = data.value(for: "object")
        XCTAssertNil(value)
    }
}
