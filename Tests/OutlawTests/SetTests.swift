//
//  SetTests.swift
//  Outlaw
//
//  Created by Brian Mullen on 11/9/16.
//  Copyright © 2016 Molbie LLC. All rights reserved.
//

import XCTest
@testable import Outlaw


class SetTests: OutlawTestCase, DateTesting {
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
                           ("testOptionalTransformOptionalValue", testOptionalTransformOptionalValue),
                           ("testTransformValueOfOptionals", testTransformValueOfOptionals),
                           ("testOptionalTransformValueOfOptionals", testOptionalTransformValueOfOptionals),
                           ("testTransformOptionalValueOfOptionals", testTransformOptionalValueOfOptionals),
                           ("testOptionalTransformOptionalValueOfOptionals", testOptionalTransformOptionalValueOfOptionals)]
    
    
    func testValue() {
        let bool: Set<Bool> = try! data.value(for: "bool")
        XCTAssertEqual(bool.count, 2)
        XCTAssertEqual(bool.contains(true), true)
        XCTAssertEqual(bool.contains(false), true)
        
        let string: Set<String> = try! data.value(for: "string")
        XCTAssertEqual(string.count, 1)
        XCTAssertEqual(string.contains("Hello, Outlaw!"), true)
        
        let character: Set<Character> = try! data.value(for: "character")
        XCTAssertEqual(character.count, 1)
        XCTAssertEqual(character.contains("O"), true)
        
        let float: Set<Float> = try! data.value(for: "float")
        XCTAssertEqual(float.count, 1)
        XCTAssertEqual(float.contains(3.14), true)
        
        let double: Set<Double> = try! data.value(for: "double")
        XCTAssertEqual(double.count, 1)
        XCTAssertEqual(double.contains(3.14159265359), true)
        
        let int: Set<Int> = try! data.value(for: "int")
        XCTAssertEqual(int.count, 1)
        XCTAssertEqual(int.contains(-3), true)
        
        let int8: Set<Int8> = try! data.value(for: "int8")
        XCTAssertEqual(int8.count, 1)
        XCTAssertEqual(int8.contains(-8), true)
        
        let int16: Set<Int16> = try! data.value(for: "int16")
        XCTAssertEqual(int16.count, 1)
        XCTAssertEqual(int16.contains(-16), true)
        
        let int32: Set<Int32> = try! data.value(for: "int32")
        XCTAssertEqual(int32.count, 1)
        XCTAssertEqual(int32.contains(-32), true)
        
        let int64: Set<Int64> = try! data.value(for: "int64")
        XCTAssertEqual(int64.count, 1)
        XCTAssertEqual(int64.contains(-64), true)
        
        let uint: Set<UInt> = try! data.value(for: "uint")
        XCTAssertEqual(uint.count, 1)
        XCTAssertEqual(uint.contains(3), true)
        
        let uint8: Set<UInt8> = try! data.value(for: "uint8")
        XCTAssertEqual(uint8.count, 1)
        XCTAssertEqual(uint8.contains(8), true)
        
        let uint16: Set<UInt16> = try! data.value(for: "uint16")
        XCTAssertEqual(uint16.count, 1)
        XCTAssertEqual(uint16.contains(16), true)
        
        let uint32: Set<UInt32> = try! data.value(for: "uint32")
        XCTAssertEqual(uint32.count, 1)
        XCTAssertEqual(uint32.contains(32), true)
        
        let uint64: Set<UInt64> = try! data.value(for: "uint64")
        XCTAssertEqual(uint64.count, 1)
        XCTAssertEqual(uint64.contains(64), true)
        
        let url: Set<URL> = try! data.value(for: "url")
        XCTAssertEqual(url.count, 1)
        XCTAssertEqual(url.contains(URL(string: "https://developer.apple.com/")!), true)
        
        let date: Set<Date> = try! data.value(for: "date")
        XCTAssertEqual(date.count, 1)
        XCTAssertEqual(formatDate(date.first!), formatDate(dateForAssert()))
    }
    
    func testNestedValue() {
        let bool: Set<Bool> = try! data.value(for: "object.bool")
        XCTAssertEqual(bool.count, 2)
        XCTAssertEqual(bool.contains(true), true)
        XCTAssertEqual(bool.contains(false), true)
        
        let string: Set<String> = try! data.value(for: "object.string")
        XCTAssertEqual(string.count, 1)
        XCTAssertEqual(string.contains("Hello, Outlaw!"), true)
        
        let character: Set<Character> = try! data.value(for: "object.character")
        XCTAssertEqual(character.count, 1)
        XCTAssertEqual(character.contains("O"), true)
        
        let float: Set<Float> = try! data.value(for: "object.float")
        XCTAssertEqual(float.count, 1)
        XCTAssertEqual(float.contains(3.14), true)
        
        let double: Set<Double> = try! data.value(for: "object.double")
        XCTAssertEqual(double.count, 1)
        XCTAssertEqual(double.contains(3.14159265359), true)
        
        let int: Set<Int> = try! data.value(for: "object.int")
        XCTAssertEqual(int.count, 1)
        XCTAssertEqual(int.contains(-3), true)
        
        let int8: Set<Int8> = try! data.value(for: "object.int8")
        XCTAssertEqual(int8.count, 1)
        XCTAssertEqual(int8.contains(-8), true)
        
        let int16: Set<Int16> = try! data.value(for: "object.int16")
        XCTAssertEqual(int16.count, 1)
        XCTAssertEqual(int16.contains(-16), true)
        
        let int32: Set<Int32> = try! data.value(for: "object.int32")
        XCTAssertEqual(int32.count, 1)
        XCTAssertEqual(int32.contains(-32), true)
        
        let int64: Set<Int64> = try! data.value(for: "object.int64")
        XCTAssertEqual(int64.count, 1)
        XCTAssertEqual(int64.contains(-64), true)
        
        let uint: Set<UInt> = try! data.value(for: "object.uint")
        XCTAssertEqual(uint.count, 1)
        XCTAssertEqual(uint.contains(3), true)
        
        let uint8: Set<UInt8> = try! data.value(for: "object.uint8")
        XCTAssertEqual(uint8.count, 1)
        XCTAssertEqual(uint8.contains(8), true)
        
        let uint16: Set<UInt16> = try! data.value(for: "object.uint16")
        XCTAssertEqual(uint16.count, 1)
        XCTAssertEqual(uint16.contains(16), true)
        
        let uint32: Set<UInt32> = try! data.value(for: "object.uint32")
        XCTAssertEqual(uint32.count, 1)
        XCTAssertEqual(uint32.contains(32), true)
        
        let uint64: Set<UInt64> = try! data.value(for: "object.uint64")
        XCTAssertEqual(uint64.count, 1)
        XCTAssertEqual(uint64.contains(64), true)
        
        let url: Set<URL> = try! data.value(for: "object.url")
        XCTAssertEqual(url.count, 1)
        XCTAssertEqual(url.contains(URL(string: "https://developer.apple.com/")!), true)
        
        let date: Set<Date> = try! data.value(for: "object.date")
        XCTAssertEqual(date.count, 1)
        XCTAssertEqual(formatDate(date.first!), formatDate(dateForAssert()))
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
        XCTAssertEqual(bool?.contains(true), true)
        XCTAssertEqual(bool?.contains(false), true)
        
        let string: Set<String>? = data.value(for: "string")
        XCTAssertEqual(string?.count, 1)
        XCTAssertEqual(string?.contains("Hello, Outlaw!"), true)
        
        let character: Set<Character>? = data.value(for: "character")
        XCTAssertEqual(character?.count, 1)
        XCTAssertEqual(character?.contains("O"), true)
        
        let float: Set<Float>? = data.value(for: "float")
        XCTAssertEqual(float?.count, 1)
        XCTAssertEqual(float?.contains(3.14), true)
        
        let double: Set<Double>? = data.value(for: "double")
        XCTAssertEqual(double?.count, 1)
        XCTAssertEqual(double?.contains(3.14159265359), true)
        
        let int: Set<Int>? = data.value(for: "int")
        XCTAssertEqual(int?.count, 1)
        XCTAssertEqual(int?.contains(-3), true)
        
        let int8: Set<Int8>? = data.value(for: "int8")
        XCTAssertEqual(int8?.count, 1)
        XCTAssertEqual(int8?.contains(-8), true)
        
        let int16: Set<Int16>? = data.value(for: "int16")
        XCTAssertEqual(int16?.count, 1)
        XCTAssertEqual(int16?.contains(-16), true)
        
        let int32: Set<Int32>? = data.value(for: "int32")
        XCTAssertEqual(int32?.count, 1)
        XCTAssertEqual(int32?.contains(-32), true)
        
        let int64: Set<Int64>? = data.value(for: "int64")
        XCTAssertEqual(int64?.count, 1)
        XCTAssertEqual(int64?.contains(-64), true)
        
        let uint: Set<UInt>? = data.value(for: "uint")
        XCTAssertEqual(uint?.count, 1)
        XCTAssertEqual(uint?.contains(3), true)
        
        let uint8: Set<UInt8>? = data.value(for: "uint8")
        XCTAssertEqual(uint8?.count, 1)
        XCTAssertEqual(uint8?.contains(8), true)
        
        let uint16: Set<UInt16>? = data.value(for: "uint16")
        XCTAssertEqual(uint16?.count, 1)
        XCTAssertEqual(uint16?.contains(16), true)
        
        let uint32: Set<UInt32>? = data.value(for: "uint32")
        XCTAssertEqual(uint32?.count, 1)
        XCTAssertEqual(uint32?.contains(32), true)
        
        let uint64: Set<UInt64>? = data.value(for: "uint64")
        XCTAssertEqual(uint64?.count, 1)
        XCTAssertEqual(uint64?.contains(64), true)
        
        let url: Set<URL>? = data.value(for: "url")
        XCTAssertEqual(url?.count, 1)
        XCTAssertEqual(url?.contains(URL(string: "https://developer.apple.com/")!), true)
        
        let date: Set<Date>? = data.value(for: "date")
        XCTAssertEqual(date?.count, 1)
        XCTAssertEqual(formatDate(date!.first!), formatDate(dateForAssert()))
    }
    
    func testOptionalNestedValue() {
        let bool: Set<Bool>? = data.value(for: "object.bool")
        XCTAssertEqual(bool?.count, 2)
        XCTAssertEqual(bool?.contains(true), true)
        XCTAssertEqual(bool?.contains(false), true)
        
        let string: Set<String>? = data.value(for: "object.string")
        XCTAssertEqual(string?.count, 1)
        XCTAssertEqual(string?.contains("Hello, Outlaw!"), true)
        
        let character: Set<Character>? = data.value(for: "object.character")
        XCTAssertEqual(character?.count, 1)
        XCTAssertEqual(character?.contains("O"), true)
        
        let float: Set<Float>? = data.value(for: "object.float")
        XCTAssertEqual(float?.count, 1)
        XCTAssertEqual(float?.contains(3.14), true)
        
        let double: Set<Double>? = data.value(for: "object.double")
        XCTAssertEqual(double?.count, 1)
        XCTAssertEqual(double?.contains(3.14159265359), true)
        
        let int: Set<Int>? = data.value(for: "object.int")
        XCTAssertEqual(int?.count, 1)
        XCTAssertEqual(int?.contains(-3), true)
        
        let int8: Set<Int8>? = data.value(for: "object.int8")
        XCTAssertEqual(int8?.count, 1)
        XCTAssertEqual(int8?.contains(-8), true)
        
        let int16: Set<Int16>? = data.value(for: "object.int16")
        XCTAssertEqual(int16?.count, 1)
        XCTAssertEqual(int16?.contains(-16), true)
        
        let int32: Set<Int32>? = data.value(for: "object.int32")
        XCTAssertEqual(int32?.count, 1)
        XCTAssertEqual(int32?.contains(-32), true)
        
        let int64: Set<Int64>? = data.value(for: "object.int64")
        XCTAssertEqual(int64?.count, 1)
        XCTAssertEqual(int64?.contains(-64), true)
        
        let uint: Set<UInt>? = data.value(for: "object.uint")
        XCTAssertEqual(uint?.count, 1)
        XCTAssertEqual(uint?.contains(3), true)
        
        let uint8: Set<UInt8>? = data.value(for: "object.uint8")
        XCTAssertEqual(uint8?.count, 1)
        XCTAssertEqual(uint8?.contains(8), true)
        
        let uint16: Set<UInt16>? = data.value(for: "object.uint16")
        XCTAssertEqual(uint16?.count, 1)
        XCTAssertEqual(uint16?.contains(16), true)
        
        let uint32: Set<UInt32>? = data.value(for: "object.uint32")
        XCTAssertEqual(uint32?.count, 1)
        XCTAssertEqual(uint32?.contains(32), true)
        
        let uint64: Set<UInt64>? = data.value(for: "object.uint64")
        XCTAssertEqual(uint64?.count, 1)
        XCTAssertEqual(uint64?.contains(64), true)
        
        let url: Set<URL>? = data.value(for: "object.url")
        XCTAssertEqual(url?.count, 1)
        XCTAssertEqual(url?.contains(URL(string: "https://developer.apple.com/")!), true)
        
        let date: Set<Date>? = data.value(for: "object.date")
        XCTAssertEqual(date?.count, 1)
        XCTAssertEqual(formatDate(date!.first!), formatDate(dateForAssert()))
    }
    
    func testOptionalKeyNotFound() {
        let value: Set<Int>? = data.value(for: "keyNotFound")
        XCTAssertNil(value)
    }
    
    func testOptionalTypeMismatch() {
        let value: Set<Int>? = data.value(for: "object")
        XCTAssertNil(value)
    }
    
// MARK: -
// MARK: Transforms
    
    func testTransformValue() {
        let bool: Set<Bool> = try! data.value(for: "boolTransform", with: { (rawValue: String) -> Bool in
            return rawValue == "TRUE"
        })
        XCTAssertEqual(bool.count, 1)
        XCTAssertEqual(bool.first, true)
        
        let string: Set<String> = try! data.value(for: "stringTransform", with: { (rawValue: Bool) -> String in
            return rawValue ? "TRUE" : "FALSE"
        })
        XCTAssertEqual(string.count, 1)
        XCTAssertEqual(string.first, "TRUE")
        
        let character: Set<Character> = try! data.value(for: "characterTransform", with: { (rawValue: Bool) -> Character in
            return rawValue ? "1" : "0"
        })
        XCTAssertEqual(character.count, 1)
        XCTAssertEqual(character.first, "1")
        
        let float: Set<Float> = try! data.value(for: "floatTransform", with: { (rawValue: String) -> Float in
            return rawValue == "PI" ? 3.14 : 0
        })
        XCTAssertEqual(float.count, 1)
        XCTAssertEqual(float.first, 3.14)
        
        let double: Set<Double> = try! data.value(for: "doubleTransform", with: { (rawValue: String) -> Double in
            return rawValue == "PI" ? 3.14 : 0
        })
        XCTAssertEqual(double.count, 1)
        XCTAssertEqual(double.first, 3.14)
        
        let int: Set<Int> = try! data.value(for: "intTransform", with: { (rawValue: String) -> Int in
            guard let value = Int(rawValue) else {
                throw OutlawError.typeMismatchWithKey(key: "intTransform", expected: Int.self, actual: rawValue)
            }
            return value
        })
        XCTAssertEqual(int.count, 1)
        XCTAssertEqual(int.first, 12345)
        
        let int8: Set<Int8> = try! data.value(for: "int8Transform", with: { (rawValue: String) -> Int8 in
            guard let value = Int8(rawValue) else {
                throw OutlawError.typeMismatchWithKey(key: "intTransform", expected: Int8.self, actual: rawValue)
            }
            return value
        })
        XCTAssertEqual(int8.count, 1)
        XCTAssertEqual(int8.first, 123)
        
        let int16: Set<Int16> = try! data.value(for: "int16Transform", with: { (rawValue: String) -> Int16 in
            guard let value = Int16(rawValue) else {
                throw OutlawError.typeMismatchWithKey(key: "int16Transform", expected: Int16.self, actual: rawValue)
            }
            return value
        })
        XCTAssertEqual(int16.count, 1)
        XCTAssertEqual(int16.first, 12345)
        
        let int32: Set<Int32> = try! data.value(for: "int32Transform", with: { (rawValue: String) -> Int32 in
            guard let value = Int32(rawValue) else {
                throw OutlawError.typeMismatchWithKey(key: "int32Transform", expected: Int32.self, actual: rawValue)
            }
            return value
        })
        XCTAssertEqual(int32.count, 1)
        XCTAssertEqual(int32.first, 12345)
        
        let int64: Set<Int64> = try! data.value(for: "int64Transform", with: { (rawValue: String) -> Int64 in
            guard let value = Int64(rawValue) else {
                throw OutlawError.typeMismatchWithKey(key: "int64Transform", expected: Int64.self, actual: rawValue)
            }
            return value
        })
        XCTAssertEqual(int64.count, 1)
        XCTAssertEqual(int64.first, 12345)
        
        let uint: Set<UInt> = try! data.value(for: "uintTransform", with: { (rawValue: String) -> UInt in
            guard let value = UInt(rawValue) else {
                throw OutlawError.typeMismatchWithKey(key: "uintTransform", expected: UInt.self, actual: rawValue)
            }
            return value
        })
        XCTAssertEqual(uint.count, 1)
        XCTAssertEqual(uint.first, 12345)
        
        let uint8: Set<UInt8> = try! data.value(for: "uint8Transform", with: { (rawValue: String) -> UInt8 in
            guard let value = UInt8(rawValue) else {
                throw OutlawError.typeMismatchWithKey(key: "uintTransform", expected: UInt8.self, actual: rawValue)
            }
            return value
        })
        XCTAssertEqual(uint8.count, 1)
        XCTAssertEqual(uint8.first, 123)
        
        let uint16: Set<UInt16> = try! data.value(for: "uint16Transform", with: { (rawValue: String) -> UInt16 in
            guard let value = UInt16(rawValue) else {
                throw OutlawError.typeMismatchWithKey(key: "uint16Transform", expected: UInt16.self, actual: rawValue)
            }
            return value
        })
        XCTAssertEqual(uint16.count, 1)
        XCTAssertEqual(uint16.first, 12345)
        
        let uint32: Set<UInt32> = try! data.value(for: "uint32Transform", with: { (rawValue: String) -> UInt32 in
            guard let value = UInt32(rawValue) else {
                throw OutlawError.typeMismatchWithKey(key: "uint32Transform", expected: UInt32.self, actual: rawValue)
            }
            return value
        })
        XCTAssertEqual(uint32.count, 1)
        XCTAssertEqual(uint32.first, 12345)
        
        let uint64: Set<UInt64> = try! data.value(for: "uint64Transform", with: { (rawValue: String) -> UInt64 in
            guard let value = UInt64(rawValue) else {
                throw OutlawError.typeMismatchWithKey(key: "uint64Transform", expected: UInt64.self, actual: rawValue)
            }
            return value
        })
        XCTAssertEqual(uint64.count, 1)
        XCTAssertEqual(uint64.first, 12345)
        
        let url: Set<URL> = try! data.value(for: "urlTransform", with: { (rawValue: String) -> URL in
            let urlValue = rawValue == "HOMEPAGE" ? "http://molbie.co" : rawValue
            guard let value = URL(string: urlValue) else {
                throw OutlawError.typeMismatchWithKey(key: "urlTransform", expected: URL.self, actual: rawValue)
            }
            
            return value
        })
        XCTAssertEqual(url.count, 1)
        XCTAssertEqual(url.first?.absoluteString, "http://molbie.co")
        
        let formatter = shortDateformatter()
        let date: Set<Date> = try! data.value(for: "dateTransform", with: { (rawValue: String) -> Date in
            return formatter.date(from: rawValue)!
        })
        XCTAssertEqual(date.count, 1)
        XCTAssertEqual(formatShortDate(date.first!), formatShortDate(shortDateForAssert()))
    }
    
    func testOptionalTransformValue() {
        let bool: Set<Bool> = try! data.value(for: "boolTransform", with: { (rawValue: String?) -> Bool in
            return rawValue == "TRUE"
        })
        XCTAssertEqual(bool.count, 1)
        XCTAssertEqual(bool.first, true)
        
        let string: Set<String> = try! data.value(for: "stringTransform", with: { (rawValue: Bool?) -> String in
            guard let rawValue = rawValue else { return "FALSE" }
            return rawValue ? "TRUE" : "FALSE"
        })
        XCTAssertEqual(string.count, 1)
        XCTAssertEqual(string.first, "TRUE")
        
        let character: Set<Character> = try! data.value(for: "characterTransform", with: { (rawValue: Bool?) -> Character in
            guard let rawValue = rawValue else { return "0" }
            return rawValue ? "1" : "0"
        })
        XCTAssertEqual(character.count, 1)
        XCTAssertEqual(character.first, "1")
        
        let float: Set<Float> = try! data.value(for: "floatTransform", with: { (rawValue: String?) -> Float in
            guard let rawValue = rawValue else { return 0 }
            return rawValue == "PI" ? 3.14 : 0
        })
        XCTAssertEqual(float.count, 1)
        XCTAssertEqual(float.first, 3.14)
        
        let double: Set<Double> = try! data.value(for: "doubleTransform", with: { (rawValue: String?) -> Double in
            guard let rawValue = rawValue else { return 0 }
            return rawValue == "PI" ? 3.14 : 0
        })
        XCTAssertEqual(double.count, 1)
        XCTAssertEqual(double.first, 3.14)
        
        let int: Set<Int> = try! data.value(for: "intTransform", with: { (rawValue: String?) -> Int in
            guard let value = Int(rawValue ?? "0") else {
                throw OutlawError.typeMismatchWithKey(key: "intTransform", expected: Int.self, actual: rawValue ?? "nil")
            }
            return value
        })
        XCTAssertEqual(int.count, 1)
        XCTAssertEqual(int.first, 12345)
        
        let int8: Set<Int8> = try! data.value(for: "int8Transform", with: { (rawValue: String?) -> Int8 in
            guard let value = Int8(rawValue ?? "0") else {
                throw OutlawError.typeMismatchWithKey(key: "int8Transform", expected: Int8.self, actual: rawValue ?? "nil")
            }
            return value
        })
        XCTAssertEqual(int8.count, 1)
        XCTAssertEqual(int8.first, 123)
        
        let int16: Set<Int16> = try! data.value(for: "int16Transform", with: { (rawValue: String?) -> Int16 in
            guard let value = Int16(rawValue ?? "0") else {
                throw OutlawError.typeMismatchWithKey(key: "int16Transform", expected: Int16.self, actual: rawValue ?? "nil")
            }
            return value
        })
        XCTAssertEqual(int16.count, 1)
        XCTAssertEqual(int16.first, 12345)
        
        let int32: Set<Int32> = try! data.value(for: "int32Transform", with: { (rawValue: String?) -> Int32 in
            guard let value = Int32(rawValue ?? "0") else {
                throw OutlawError.typeMismatchWithKey(key: "int32Transform", expected: Int32.self, actual: rawValue ?? "nil")
            }
            return value
        })
        XCTAssertEqual(int32.count, 1)
        XCTAssertEqual(int32.first, 12345)
        
        let int64: Set<Int64> = try! data.value(for: "intTransform", with: { (rawValue: String?) -> Int64 in
            guard let value = Int64(rawValue ?? "0") else {
                throw OutlawError.typeMismatchWithKey(key: "intTransform", expected: Int64.self, actual: rawValue ?? "nil")
            }
            return value
        })
        XCTAssertEqual(int64.count, 1)
        XCTAssertEqual(int64.first, 12345)
        
        let uint: Set<UInt> = try! data.value(for: "uintTransform", with: { (rawValue: String?) -> UInt in
            guard let value = UInt(rawValue ?? "0") else {
                throw OutlawError.typeMismatchWithKey(key: "uintTransform", expected: UInt.self, actual: rawValue ?? "nil")
            }
            return value
        })
        XCTAssertEqual(uint.count, 1)
        XCTAssertEqual(uint.first, 12345)
        
        let uint8: Set<UInt8> = try! data.value(for: "uint8Transform", with: { (rawValue: String?) -> UInt8 in
            guard let value = UInt8(rawValue ?? "0") else {
                throw OutlawError.typeMismatchWithKey(key: "uint8Transform", expected: UInt8.self, actual: rawValue ?? "nil")
            }
            return value
        })
        XCTAssertEqual(uint8.count, 1)
        XCTAssertEqual(uint8.first, 123)
        
        let uint16: Set<UInt16> = try! data.value(for: "uint16Transform", with: { (rawValue: String?) -> UInt16 in
            guard let value = UInt16(rawValue ?? "0") else {
                throw OutlawError.typeMismatchWithKey(key: "uint16Transform", expected: UInt16.self, actual: rawValue ?? "nil")
            }
            return value
        })
        XCTAssertEqual(uint16.count, 1)
        XCTAssertEqual(uint16.first, 12345)
        
        let uint32: Set<UInt32> = try! data.value(for: "uint32Transform", with: { (rawValue: String?) -> UInt32 in
            guard let value = UInt32(rawValue ?? "0") else {
                throw OutlawError.typeMismatchWithKey(key: "uint32Transform", expected: UInt32.self, actual: rawValue ?? "nil")
            }
            return value
        })
        XCTAssertEqual(uint32.count, 1)
        XCTAssertEqual(uint32.first, 12345)
        
        let uint64: Set<UInt64> = try! data.value(for: "uintTransform", with: { (rawValue: String?) -> UInt64 in
            guard let value = UInt64(rawValue ?? "0") else {
                throw OutlawError.typeMismatchWithKey(key: "uintTransform", expected: UInt64.self, actual: rawValue ?? "nil")
            }
            return value
        })
        XCTAssertEqual(uint64.count, 1)
        XCTAssertEqual(uint64.first, 12345)
        
        let url: Set<URL> = try! data.value(for: "urlTransform", with: { (rawValue: String?) -> URL in
            let urlValue = rawValue == "HOMEPAGE" ? "http://molbie.co" : (rawValue ?? "")
            guard let value = URL(string: urlValue) else {
                throw OutlawError.typeMismatchWithKey(key: "urlTransform", expected: URL.self, actual: rawValue ?? "")
            }
            
            return value
        })
        XCTAssertEqual(url.count, 1)
        XCTAssertEqual(url.first?.absoluteString, "http://molbie.co")
        
        let formatter = shortDateformatter()
        let date: Set<Date> = try! data.value(for: "dateTransform", with: { (rawValue: String?) -> Date in
            guard let dateValue = rawValue else {
                throw OutlawError.typeMismatchWithKey(key: "transform", expected: Date.self, actual: rawValue ?? "")
            }
            
            return formatter.date(from: dateValue)!
        })
        XCTAssertEqual(date.count, 1)
        XCTAssertEqual(formatShortDate(date.first!), formatShortDate(shortDateForAssert()))
    }

    func testTransformOptionalValue() {
        let bool: Set<Bool>? = data.value(for: "boolTransform", with: { (rawValue: String) -> Bool in
            return rawValue == "TRUE"
        })
        XCTAssertEqual(bool?.count, 1)
        XCTAssertEqual(bool?.first, true)
        
        let string: Set<String>? = data.value(for: "stringTransform", with: { (rawValue: Bool) -> String in
            return rawValue ? "TRUE" : "FALSE"
        })
        XCTAssertEqual(string?.count, 1)
        XCTAssertEqual(string?.first, "TRUE")
        
        let character: Set<Character>? = data.value(for: "characterTransform", with: { (rawValue: Bool) -> Character in
            return rawValue ? "1" : "0"
        })
        XCTAssertEqual(character?.count, 1)
        XCTAssertEqual(character?.first, "1")
        
        let float: Set<Float>? = data.value(for: "floatTransform", with: { (rawValue: String) -> Float in
            return rawValue == "PI" ? 3.14 : 0
        })
        XCTAssertEqual(float?.count, 1)
        XCTAssertEqual(float?.first, 3.14)
        
        let double: Set<Double>? = data.value(for: "doubleTransform", with: { (rawValue: String) -> Double in
            return rawValue == "PI" ? 3.14 : 0
        })
        XCTAssertEqual(double?.count, 1)
        XCTAssertEqual(double?.first, 3.14)
        
        let int: Set<Int>? = data.value(for: "intTransform", with: { (rawValue: String) -> Int in
            guard let value = Int(rawValue) else {
                throw OutlawError.typeMismatchWithKey(key: "intTransform", expected: Int.self, actual: rawValue)
            }
            return value
        })
        XCTAssertEqual(int?.count, 1)
        XCTAssertEqual(int?.first, 12345)
        
        let int8: Set<Int8>? = data.value(for: "int8Transform", with: { (rawValue: String) -> Int8 in
            guard let value = Int8(rawValue) else {
                throw OutlawError.typeMismatchWithKey(key: "int8Transform", expected: Int8.self, actual: rawValue)
            }
            return value
        })
        XCTAssertEqual(int8?.count, 1)
        XCTAssertEqual(int8?.first, 123)
        
        let int16: Set<Int16>? = data.value(for: "int16Transform", with: { (rawValue: String) -> Int16 in
            guard let value = Int16(rawValue) else {
                throw OutlawError.typeMismatchWithKey(key: "int16Transform", expected: Int16.self, actual: rawValue)
            }
            return value
        })
        XCTAssertEqual(int16?.count, 1)
        XCTAssertEqual(int16?.first, 12345)
        
        let int32: Set<Int32>? = data.value(for: "int32Transform", with: { (rawValue: String) -> Int32 in
            guard let value = Int32(rawValue) else {
                throw OutlawError.typeMismatchWithKey(key: "int32Transform", expected: Int32.self, actual: rawValue)
            }
            return value
        })
        XCTAssertEqual(int32?.count, 1)
        XCTAssertEqual(int32?.first, 12345)
        
        let int64: Set<Int64>? = data.value(for: "int64Transform", with: { (rawValue: String) -> Int64 in
            guard let value = Int64(rawValue) else {
                throw OutlawError.typeMismatchWithKey(key: "int64Transform", expected: Int64.self, actual: rawValue)
            }
            return value
        })
        XCTAssertEqual(int64?.count, 1)
        XCTAssertEqual(int64?.first, 12345)
        
        let uint: Set<UInt>? = data.value(for: "uintTransform", with: { (rawValue: String) -> UInt in
            guard let value = UInt(rawValue) else {
                throw OutlawError.typeMismatchWithKey(key: "uintTransform", expected: UInt.self, actual: rawValue)
            }
            return value
        })
        XCTAssertEqual(uint?.count, 1)
        XCTAssertEqual(uint?.first, 12345)
        
        let uint8: Set<UInt8>? = data.value(for: "uint8Transform", with: { (rawValue: String) -> UInt8 in
            guard let value = UInt8(rawValue) else {
                throw OutlawError.typeMismatchWithKey(key: "uint8Transform", expected: UInt8.self, actual: rawValue)
            }
            return value
        })
        XCTAssertEqual(uint8?.count, 1)
        XCTAssertEqual(uint8?.first, 123)
        
        let uint16: Set<UInt16>? = data.value(for: "uint16Transform", with: { (rawValue: String) -> UInt16 in
            guard let value = UInt16(rawValue) else {
                throw OutlawError.typeMismatchWithKey(key: "uint16Transform", expected: UInt16.self, actual: rawValue)
            }
            return value
        })
        XCTAssertEqual(uint16?.count, 1)
        XCTAssertEqual(uint16?.first, 12345)
        
        let uint32: Set<UInt32>? = data.value(for: "uint32Transform", with: { (rawValue: String) -> UInt32 in
            guard let value = UInt32(rawValue) else {
                throw OutlawError.typeMismatchWithKey(key: "uint32Transform", expected: UInt32.self, actual: rawValue)
            }
            return value
        })
        XCTAssertEqual(uint32?.count, 1)
        XCTAssertEqual(uint32?.first, 12345)
        
        let uint64: Set<UInt64>? = data.value(for: "uint64Transform", with: { (rawValue: String) -> UInt64 in
            guard let value = UInt64(rawValue) else {
                throw OutlawError.typeMismatchWithKey(key: "uint64Transform", expected: UInt64.self, actual: rawValue)
            }
            return value
        })
        XCTAssertEqual(uint64?.count, 1)
        XCTAssertEqual(uint64?.first, 12345)
        
        let url: Set<URL>? = data.value(for: "urlTransform", with: { (rawValue: String) -> URL in
            let urlValue = rawValue == "HOMEPAGE" ? "http://molbie.co" : rawValue
            guard let value = URL(string: urlValue) else {
                throw OutlawError.typeMismatchWithKey(key: "urlTransform", expected: URL.self, actual: rawValue)
            }
            
            return value
        })
        XCTAssertEqual(url?.count, 1)
        XCTAssertEqual(url?.first?.absoluteString, "http://molbie.co")
        
        let formatter = shortDateformatter()
        let date: Set<Date>? = data.value(for: "dateTransform", with: { (rawValue: String) -> Date in
            return formatter.date(from: rawValue)!
        })
        XCTAssertEqual(date?.count, 1)
        XCTAssertEqual(formatShortDate(date!.first!), formatShortDate(shortDateForAssert()))
    }
    
    func testOptionalTransformOptionalValue() {
        let bool: Set<Bool>? = data.value(for: "boolTransform", with: { (rawValue: String?) -> Bool in
            return rawValue == "TRUE"
        })
        XCTAssertEqual(bool?.count, 1)
        XCTAssertEqual(bool?.first, true)
        
        let string: Set<String>? = data.value(for: "stringTransform", with: { (rawValue: Bool?) -> String in
            let value = rawValue ?? false
            return value ? "TRUE" : "FALSE"
        })
        XCTAssertEqual(string?.count, 1)
        XCTAssertEqual(string?.first, "TRUE")
        
        let character: Set<Character>? = data.value(for: "characterTransform", with: { (rawValue: Bool?) -> Character in
            let value = rawValue ?? false
            return value ? "1" : "0"
        })
        XCTAssertEqual(character?.count, 1)
        XCTAssertEqual(character?.first, "1")
        
        let float: Set<Float>? = data.value(for: "floatTransform", with: { (rawValue: String?) -> Float in
            let value = rawValue ?? ""
            return value == "PI" ? 3.14 : 0
        })
        XCTAssertEqual(float?.count, 1)
        XCTAssertEqual(float?.first, 3.14)
        
        let double: Set<Double>? = data.value(for: "doubleTransform", with: { (rawValue: String?) -> Double in
            let value = rawValue ?? ""
            return value == "PI" ? 3.14 : 0
        })
        XCTAssertEqual(double?.count, 1)
        XCTAssertEqual(double?.first, 3.14)
        
        let int: Set<Int>? = data.value(for: "intTransform", with: { (rawValue: String?) -> Int in
            guard let value = Int(rawValue ?? "") else {
                throw OutlawError.typeMismatchWithKey(key: "intTransform", expected: Int.self, actual: rawValue ?? "")
            }
            return value
        })
        XCTAssertEqual(int?.count, 1)
        XCTAssertEqual(int?.first, 12345)
        
        let int8: Set<Int8>? = data.value(for: "int8Transform", with: { (rawValue: String?) -> Int8 in
            guard let value = Int8(rawValue ?? "") else {
                throw OutlawError.typeMismatchWithKey(key: "int8Transform", expected: Int8.self, actual: rawValue ?? "")
            }
            return value
        })
        XCTAssertEqual(int8?.count, 1)
        XCTAssertEqual(int8?.first, 123)
        
        let int16: Set<Int16>? = data.value(for: "int16Transform", with: { (rawValue: String?) -> Int16 in
            guard let value = Int16(rawValue ?? "") else {
                throw OutlawError.typeMismatchWithKey(key: "int16Transform", expected: Int16.self, actual: rawValue ?? "")
            }
            return value
        })
        XCTAssertEqual(int16?.count, 1)
        XCTAssertEqual(int16?.first, 12345)
        
        let int32: Set<Int32>? = data.value(for: "int32Transform", with: { (rawValue: String?) -> Int32 in
            guard let value = Int32(rawValue ?? "") else {
                throw OutlawError.typeMismatchWithKey(key: "int32Transform", expected: Int32.self, actual: rawValue ?? "")
            }
            return value
        })
        XCTAssertEqual(int32?.count, 1)
        XCTAssertEqual(int32?.first, 12345)
        
        let int64: Set<Int64>? = data.value(for: "int64Transform", with: { (rawValue: String?) -> Int64 in
            guard let value = Int64(rawValue ?? "") else {
                throw OutlawError.typeMismatchWithKey(key: "int64Transform", expected: Int64.self, actual: rawValue ?? "")
            }
            return value
        })
        XCTAssertEqual(int64?.count, 1)
        XCTAssertEqual(int64?.first, 12345)
        
        let uint: Set<UInt>? = data.value(for: "uintTransform", with: { (rawValue: String?) -> UInt in
            guard let value = UInt(rawValue ?? "") else {
                throw OutlawError.typeMismatchWithKey(key: "uintTransform", expected: UInt.self, actual: rawValue ?? "")
            }
            return value
        })
        XCTAssertEqual(uint?.count, 1)
        XCTAssertEqual(uint?.first, 12345)
        
        let uint8: Set<UInt8>? = data.value(for: "uint8Transform", with: { (rawValue: String?) -> UInt8 in
            guard let value = UInt8(rawValue ?? "") else {
                throw OutlawError.typeMismatchWithKey(key: "uint8Transform", expected: UInt8.self, actual: rawValue ?? "")
            }
            return value
        })
        XCTAssertEqual(uint8?.count, 1)
        XCTAssertEqual(uint8?.first, 123)
        
        let uint16: Set<UInt16>? = data.value(for: "uint16Transform", with: { (rawValue: String?) -> UInt16 in
            guard let value = UInt16(rawValue ?? "") else {
                throw OutlawError.typeMismatchWithKey(key: "uint16Transform", expected: UInt16.self, actual: rawValue ?? "")
            }
            return value
        })
        XCTAssertEqual(uint16?.count, 1)
        XCTAssertEqual(uint16?.first, 12345)
        
        let uint32: Set<UInt32>? = data.value(for: "uint32Transform", with: { (rawValue: String?) -> UInt32 in
            guard let value = UInt32(rawValue ?? "") else {
                throw OutlawError.typeMismatchWithKey(key: "uint32Transform", expected: UInt32.self, actual: rawValue ?? "")
            }
            return value
        })
        XCTAssertEqual(uint32?.count, 1)
        XCTAssertEqual(uint32?.first, 12345)
        
        let uint64: Set<UInt64>? = data.value(for: "uint64Transform", with: { (rawValue: String?) -> UInt64 in
            guard let value = UInt64(rawValue ?? "") else {
                throw OutlawError.typeMismatchWithKey(key: "uint64Transform", expected: UInt64.self, actual: rawValue ?? "")
            }
            return value
        })
        XCTAssertEqual(uint64?.count, 1)
        XCTAssertEqual(uint64?.first, 12345)
        
        let url: Set<URL>? = data.value(for: "urlTransform", with: { (rawValue: String?) -> URL in
            let urlValue = rawValue == "HOMEPAGE" ? "http://molbie.co" : (rawValue ?? "")
            guard let value = URL(string: urlValue) else {
                throw OutlawError.typeMismatchWithKey(key: "urlTransform", expected: URL.self, actual: rawValue ?? "")
            }
            
            return value
        })
        XCTAssertEqual(url?.count, 1)
        XCTAssertEqual(url?.first?.absoluteString, "http://molbie.co")
        
        let formatter = shortDateformatter()
        let date: Set<Date>? = data.value(for: "dateTransform", with: { (rawValue: String?) -> Date in
            let value = rawValue ?? "11/18/2016"
            return formatter.date(from: value)!
        })
        XCTAssertEqual(date?.count, 1)
        XCTAssertEqual(formatShortDate(date!.first!), formatShortDate(shortDateForAssert()))
    }
    
// MARK: -
// MARK: Transforms of Optionals
    
    func testTransformValueOfOptionals() {
        let bool: Set<Bool> = try! data.value(for: "boolTransform", with: { (rawValue: String) -> Bool? in
            return rawValue == "TRUE"
        })
        XCTAssertEqual(bool.count, 1)
        XCTAssertEqual(bool.first, true)
        
        let string: Set<String> = try! data.value(for: "stringTransform", with: { (rawValue: Bool) -> String? in
            return rawValue ? "TRUE" : "FALSE"
        })
        XCTAssertEqual(string.count, 1)
        XCTAssertEqual(string.first, "TRUE")
        
        let character: Set<Character> = try! data.value(for: "characterTransform", with: { (rawValue: Bool) -> Character? in
            return rawValue ? "1" : "0"
        })
        XCTAssertEqual(character.count, 1)
        XCTAssertEqual(character.first, "1")
        
        let float: Set<Float> = try! data.value(for: "floatTransform", with: { (rawValue: String) -> Float? in
            return rawValue == "PI" ? 3.14 : 0
        })
        XCTAssertEqual(float.count, 1)
        XCTAssertEqual(float.first, 3.14)
        
        let double: Set<Double> = try! data.value(for: "doubleTransform", with: { (rawValue: String) -> Double? in
            return rawValue == "PI" ? 3.14 : 0
        })
        XCTAssertEqual(double.count, 1)
        XCTAssertEqual(double.first, 3.14)
        
        let int: Set<Int> = try! data.value(for: "intTransform", with: { (rawValue: String) -> Int? in
            return Int(rawValue)
        })
        XCTAssertEqual(int.count, 1)
        XCTAssertEqual(int.first, 12345)
        
        let int8: Set<Int8> = try! data.value(for: "int8Transform", with: { (rawValue: String) -> Int8? in
            return Int8(rawValue)
        })
        XCTAssertEqual(int8.count, 1)
        XCTAssertEqual(int8.first, 123)
        
        let int16: Set<Int16> = try! data.value(for: "int16Transform", with: { (rawValue: String) -> Int16? in
            return Int16(rawValue)
        })
        XCTAssertEqual(int16.count, 1)
        XCTAssertEqual(int16.first, 12345)
        
        let int32: Set<Int32> = try! data.value(for: "int32Transform", with: { (rawValue: String) -> Int32? in
            return Int32(rawValue)
        })
        XCTAssertEqual(int32.count, 1)
        XCTAssertEqual(int32.first, 12345)
        
        let int64: Set<Int64> = try! data.value(for: "int64Transform", with: { (rawValue: String) -> Int64? in
            return Int64(rawValue)
        })
        XCTAssertEqual(int64.count, 1)
        XCTAssertEqual(int64.first, 12345)
        
        let uint: Set<UInt> = try! data.value(for: "uintTransform", with: { (rawValue: String) -> UInt? in
            return UInt(rawValue)
        })
        XCTAssertEqual(uint.count, 1)
        XCTAssertEqual(uint.first, 12345)
        
        let uint8: Set<UInt8> = try! data.value(for: "uint8Transform", with: { (rawValue: String) -> UInt8? in
            return UInt8(rawValue)
        })
        XCTAssertEqual(uint8.count, 1)
        XCTAssertEqual(uint8.first, 123)
        
        let uint16: Set<UInt16> = try! data.value(for: "uint16Transform", with: { (rawValue: String) -> UInt16? in
            return UInt16(rawValue)
        })
        XCTAssertEqual(uint16.count, 1)
        XCTAssertEqual(uint16.first, 12345)
        
        let uint32: Set<UInt32> = try! data.value(for: "uint32Transform", with: { (rawValue: String) -> UInt32? in
            return UInt32(rawValue)
        })
        XCTAssertEqual(uint32.count, 1)
        XCTAssertEqual(uint32.first, 12345)
        
        let uint64: Set<UInt64> = try! data.value(for: "uint64Transform", with: { (rawValue: String) -> UInt64? in
            return UInt64(rawValue)
        })
        XCTAssertEqual(uint64.count, 1)
        XCTAssertEqual(uint64.first, 12345)
        
        let url: Set<URL> = try! data.value(for: "urlTransform", with: { (rawValue: String) -> URL? in
            let urlValue = rawValue == "HOMEPAGE" ? "http://molbie.co" : rawValue
            return URL(string: urlValue)
        })
        XCTAssertEqual(url.count, 1)
        XCTAssertEqual(url.first?.absoluteString, "http://molbie.co")
        
        let formatter = shortDateformatter()
        let date: Set<Date> = try! data.value(for: "dateTransform", with: { (rawValue: String) -> Date? in
            return formatter.date(from: rawValue)!
        })
        XCTAssertEqual(date.count, 1)
        XCTAssertEqual(formatShortDate(date.first!), formatShortDate(shortDateForAssert()))
    }
    
    func testOptionalTransformValueOfOptionals() {
        let bool: Set<Bool> = try! data.value(for: "boolTransform", with: { (rawValue: String?) -> Bool? in
            return rawValue == "TRUE"
        })
        XCTAssertEqual(bool.count, 1)
        XCTAssertEqual(bool.first, true)
        
        let string: Set<String> = try! data.value(for: "stringTransform", with: { (rawValue: Bool?) -> String? in
            guard let rawValue = rawValue else { return "FALSE" }
            return rawValue ? "TRUE" : "FALSE"
        })
        XCTAssertEqual(string.count, 1)
        XCTAssertEqual(string.first, "TRUE")
        
        let character: Set<Character> = try! data.value(for: "characterTransform", with: { (rawValue: Bool?) -> Character? in
            guard let rawValue = rawValue else { return "0" }
            return rawValue ? "1" : "0"
        })
        XCTAssertEqual(character.count, 1)
        XCTAssertEqual(character.first, "1")
        
        let float: Set<Float> = try! data.value(for: "floatTransform", with: { (rawValue: String?) -> Float? in
            guard let rawValue = rawValue else { return 0 }
            return rawValue == "PI" ? 3.14 : 0
        })
        XCTAssertEqual(float.count, 1)
        XCTAssertEqual(float.first, 3.14)
        
        let double: Set<Double> = try! data.value(for: "doubleTransform", with: { (rawValue: String?) -> Double? in
            guard let rawValue = rawValue else { return 0 }
            return rawValue == "PI" ? 3.14 : 0
        })
        XCTAssertEqual(double.count, 1)
        XCTAssertEqual(double.first, 3.14)
        
        let int: Set<Int> = try! data.value(for: "intTransform", with: { (rawValue: String?) -> Int? in
            return Int(rawValue ?? "0")
        })
        XCTAssertEqual(int.count, 1)
        XCTAssertEqual(int.first, 12345)
        
        let int8: Set<Int8> = try! data.value(for: "int8Transform", with: { (rawValue: String?) -> Int8? in
            return Int8(rawValue ?? "0")
        })
        XCTAssertEqual(int8.count, 1)
        XCTAssertEqual(int8.first, 123)
        
        let int16: Set<Int16> = try! data.value(for: "int16Transform", with: { (rawValue: String?) -> Int16? in
            return Int16(rawValue ?? "0")
        })
        XCTAssertEqual(int16.count, 1)
        XCTAssertEqual(int16.first, 12345)
        
        let int32: Set<Int32> = try! data.value(for: "int32Transform", with: { (rawValue: String?) -> Int32? in
            return Int32(rawValue ?? "0")
        })
        XCTAssertEqual(int32.count, 1)
        XCTAssertEqual(int32.first, 12345)
        
        let int64: Set<Int64> = try! data.value(for: "intTransform", with: { (rawValue: String?) -> Int64? in
            return Int64(rawValue ?? "0")
        })
        XCTAssertEqual(int64.count, 1)
        XCTAssertEqual(int64.first, 12345)
        
        let uint: Set<UInt> = try! data.value(for: "uintTransform", with: { (rawValue: String?) -> UInt? in
            return UInt(rawValue ?? "0")
        })
        XCTAssertEqual(uint.count, 1)
        XCTAssertEqual(uint.first, 12345)
        
        let uint8: Set<UInt8> = try! data.value(for: "uint8Transform", with: { (rawValue: String?) -> UInt8? in
            return UInt8(rawValue ?? "0")
        })
        XCTAssertEqual(uint8.count, 1)
        XCTAssertEqual(uint8.first, 123)
        
        let uint16: Set<UInt16> = try! data.value(for: "uint16Transform", with: { (rawValue: String?) -> UInt16? in
            return UInt16(rawValue ?? "0")
        })
        XCTAssertEqual(uint16.count, 1)
        XCTAssertEqual(uint16.first, 12345)
        
        let uint32: Set<UInt32> = try! data.value(for: "uint32Transform", with: { (rawValue: String?) -> UInt32? in
            return UInt32(rawValue ?? "0")
        })
        XCTAssertEqual(uint32.count, 1)
        XCTAssertEqual(uint32.first, 12345)
        
        let uint64: Set<UInt64> = try! data.value(for: "uintTransform", with: { (rawValue: String?) -> UInt64? in
            return UInt64(rawValue ?? "0")
        })
        XCTAssertEqual(uint64.count, 1)
        XCTAssertEqual(uint64.first, 12345)
        
        let url: Set<URL> = try! data.value(for: "urlTransform", with: { (rawValue: String?) -> URL? in
            let urlValue = rawValue == "HOMEPAGE" ? "http://molbie.co" : (rawValue ?? "")
            return URL(string: urlValue)
        })
        XCTAssertEqual(url.count, 1)
        XCTAssertEqual(url.first?.absoluteString, "http://molbie.co")
        
        let formatter = shortDateformatter()
        let date: Set<Date> = try! data.value(for: "dateTransform", with: { (rawValue: String?) -> Date? in
            guard let dateValue = rawValue else { return nil }
            return formatter.date(from: dateValue)!
        })
        XCTAssertEqual(date.count, 1)
        XCTAssertEqual(formatShortDate(date.first!), formatShortDate(shortDateForAssert()))
    }
    
    func testTransformOptionalValueOfOptionals() {
        let bool: Set<Bool>? = data.value(for: "boolTransform", with: { (rawValue: String) -> Bool? in
            return rawValue == "TRUE"
        })
        XCTAssertEqual(bool?.count, 1)
        XCTAssertEqual(bool?.first, true)
        
        let string: Set<String>? = data.value(for: "stringTransform", with: { (rawValue: Bool) -> String? in
            return rawValue ? "TRUE" : "FALSE"
        })
        XCTAssertEqual(string?.count, 1)
        XCTAssertEqual(string?.first, "TRUE")
        
        let character: Set<Character>? = data.value(for: "characterTransform", with: { (rawValue: Bool) -> Character? in
            return rawValue ? "1" : "0"
        })
        XCTAssertEqual(character?.count, 1)
        XCTAssertEqual(character?.first, "1")
        
        let float: Set<Float>? = data.value(for: "floatTransform", with: { (rawValue: String) -> Float? in
            return rawValue == "PI" ? 3.14 : 0
        })
        XCTAssertEqual(float?.count, 1)
        XCTAssertEqual(float?.first, 3.14)
        
        let double: Set<Double>? = data.value(for: "doubleTransform", with: { (rawValue: String) -> Double? in
            return rawValue == "PI" ? 3.14 : 0
        })
        XCTAssertEqual(double?.count, 1)
        XCTAssertEqual(double?.first, 3.14)
        
        let int: Set<Int>? = data.value(for: "intTransform", with: { (rawValue: String) -> Int? in
            return Int(rawValue)
        })
        XCTAssertEqual(int?.count, 1)
        XCTAssertEqual(int?.first, 12345)
        
        let int8: Set<Int8>? = data.value(for: "int8Transform", with: { (rawValue: String) -> Int8? in
            return Int8(rawValue)
        })
        XCTAssertEqual(int8?.count, 1)
        XCTAssertEqual(int8?.first, 123)
        
        let int16: Set<Int16>? = data.value(for: "int16Transform", with: { (rawValue: String) -> Int16? in
            return Int16(rawValue)
        })
        XCTAssertEqual(int16?.count, 1)
        XCTAssertEqual(int16?.first, 12345)
        
        let int32: Set<Int32>? = data.value(for: "int32Transform", with: { (rawValue: String) -> Int32? in
            return Int32(rawValue)
        })
        XCTAssertEqual(int32?.count, 1)
        XCTAssertEqual(int32?.first, 12345)
        
        let int64: Set<Int64>? = data.value(for: "int64Transform", with: { (rawValue: String) -> Int64? in
            return Int64(rawValue)
        })
        XCTAssertEqual(int64?.count, 1)
        XCTAssertEqual(int64?.first, 12345)
        
        let uint: Set<UInt>? = data.value(for: "uintTransform", with: { (rawValue: String) -> UInt? in
            return UInt(rawValue)
        })
        XCTAssertEqual(uint?.count, 1)
        XCTAssertEqual(uint?.first, 12345)
        
        let uint8: Set<UInt8>? = data.value(for: "uint8Transform", with: { (rawValue: String) -> UInt8? in
            return UInt8(rawValue)
        })
        XCTAssertEqual(uint8?.count, 1)
        XCTAssertEqual(uint8?.first, 123)
        
        let uint16: Set<UInt16>? = data.value(for: "uint16Transform", with: { (rawValue: String) -> UInt16? in
            return UInt16(rawValue)
        })
        XCTAssertEqual(uint16?.count, 1)
        XCTAssertEqual(uint16?.first, 12345)
        
        let uint32: Set<UInt32>? = data.value(for: "uint32Transform", with: { (rawValue: String) -> UInt32? in
            return UInt32(rawValue)
        })
        XCTAssertEqual(uint32?.count, 1)
        XCTAssertEqual(uint32?.first, 12345)
        
        let uint64: Set<UInt64>? = data.value(for: "uint64Transform", with: { (rawValue: String) -> UInt64? in
            return UInt64(rawValue)
        })
        XCTAssertEqual(uint64?.count, 1)
        XCTAssertEqual(uint64?.first, 12345)
        
        let url: Set<URL>? = data.value(for: "urlTransform", with: { (rawValue: String) -> URL? in
            let urlValue = rawValue == "HOMEPAGE" ? "http://molbie.co" : rawValue
            return URL(string: urlValue)
        })
        XCTAssertEqual(url?.count, 1)
        XCTAssertEqual(url?.first?.absoluteString, "http://molbie.co")
        
        let formatter = shortDateformatter()
        let date: Set<Date>? = data.value(for: "dateTransform", with: { (rawValue: String) -> Date? in
            return formatter.date(from: rawValue)!
        })
        XCTAssertEqual(date?.count, 1)
        XCTAssertEqual(formatShortDate(date!.first!), formatShortDate(shortDateForAssert()))
    }
    
    func testOptionalTransformOptionalValueOfOptionals() {
        let bool: Set<Bool>? = data.value(for: "boolTransform", with: { (rawValue: String?) -> Bool? in
            return rawValue == "TRUE"
        })
        XCTAssertEqual(bool?.count, 1)
        XCTAssertEqual(bool?.first, true)
        
        let string: Set<String>? = data.value(for: "stringTransform", with: { (rawValue: Bool?) -> String? in
            let value = rawValue ?? false
            return value ? "TRUE" : "FALSE"
        })
        XCTAssertEqual(string?.count, 1)
        XCTAssertEqual(string?.first, "TRUE")
        
        let character: Set<Character>? = data.value(for: "characterTransform", with: { (rawValue: Bool?) -> Character? in
            let value = rawValue ?? false
            return value ? "1" : "0"
        })
        XCTAssertEqual(character?.count, 1)
        XCTAssertEqual(character?.first, "1")
        
        let float: Set<Float>? = data.value(for: "floatTransform", with: { (rawValue: String?) -> Float? in
            let value = rawValue ?? ""
            return value == "PI" ? 3.14 : 0
        })
        XCTAssertEqual(float?.count, 1)
        XCTAssertEqual(float?.first, 3.14)
        
        let double: Set<Double>? = data.value(for: "doubleTransform", with: { (rawValue: String?) -> Double? in
            let value = rawValue ?? ""
            return value == "PI" ? 3.14 : 0
        })
        XCTAssertEqual(double?.count, 1)
        XCTAssertEqual(double?.first, 3.14)
        
        let int: Set<Int>? = data.value(for: "intTransform", with: { (rawValue: String?) -> Int? in
            return Int(rawValue ?? "")
        })
        XCTAssertEqual(int?.count, 1)
        XCTAssertEqual(int?.first, 12345)
        
        let int8: Set<Int8>? = data.value(for: "int8Transform", with: { (rawValue: String?) -> Int8? in
            return Int8(rawValue ?? "")
        })
        XCTAssertEqual(int8?.count, 1)
        XCTAssertEqual(int8?.first, 123)
        
        let int16: Set<Int16>? = data.value(for: "int16Transform", with: { (rawValue: String?) -> Int16? in
            return Int16(rawValue ?? "")
        })
        XCTAssertEqual(int16?.count, 1)
        XCTAssertEqual(int16?.first, 12345)
        
        let int32: Set<Int32>? = data.value(for: "int32Transform", with: { (rawValue: String?) -> Int32? in
            return Int32(rawValue ?? "")
        })
        XCTAssertEqual(int32?.count, 1)
        XCTAssertEqual(int32?.first, 12345)
        
        let int64: Set<Int64>? = data.value(for: "int64Transform", with: { (rawValue: String?) -> Int64? in
            return Int64(rawValue ?? "")
        })
        XCTAssertEqual(int64?.count, 1)
        XCTAssertEqual(int64?.first, 12345)
        
        let uint: Set<UInt>? = data.value(for: "uintTransform", with: { (rawValue: String?) -> UInt? in
            return UInt(rawValue ?? "")
        })
        XCTAssertEqual(uint?.count, 1)
        XCTAssertEqual(uint?.first, 12345)
        
        let uint8: Set<UInt8>? = data.value(for: "uint8Transform", with: { (rawValue: String?) -> UInt8? in
            return UInt8(rawValue ?? "")
        })
        XCTAssertEqual(uint8?.count, 1)
        XCTAssertEqual(uint8?.first, 123)
        
        let uint16: Set<UInt16>? = data.value(for: "uint16Transform", with: { (rawValue: String?) -> UInt16? in
            return UInt16(rawValue ?? "")
        })
        XCTAssertEqual(uint16?.count, 1)
        XCTAssertEqual(uint16?.first, 12345)
        
        let uint32: Set<UInt32>? = data.value(for: "uint32Transform", with: { (rawValue: String?) -> UInt32? in
            return UInt32(rawValue ?? "")
        })
        XCTAssertEqual(uint32?.count, 1)
        XCTAssertEqual(uint32?.first, 12345)
        
        let uint64: Set<UInt64>? = data.value(for: "uint64Transform", with: { (rawValue: String?) -> UInt64? in
            return UInt64(rawValue ?? "")
        })
        XCTAssertEqual(uint64?.count, 1)
        XCTAssertEqual(uint64?.first, 12345)
        
        let url: Set<URL>? = data.value(for: "urlTransform", with: { (rawValue: String?) -> URL? in
            let urlValue = rawValue == "HOMEPAGE" ? "http://molbie.co" : (rawValue ?? "")
            return URL(string: urlValue)
        })
        XCTAssertEqual(url?.count, 1)
        XCTAssertEqual(url?.first?.absoluteString, "http://molbie.co")
        
        let formatter = shortDateformatter()
        let date: Set<Date>? = data.value(for: "dateTransform", with: { (rawValue: String?) -> Date? in
            let value = rawValue ?? "11/18/2016"
            return formatter.date(from: value)!
        })
        XCTAssertEqual(date?.count, 1)
        XCTAssertEqual(formatShortDate(date!.first!), formatShortDate(shortDateForAssert()))
    }
}
