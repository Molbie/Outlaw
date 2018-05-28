//
//  ArrayTests.swift
//  Outlaw
//
//  Created by Brian Mullen on 11/6/16.
//  Copyright © 2016 Molbie LLC. All rights reserved.
//

import XCTest
@testable import Outlaw


class ArrayTests: OutlawTestCase, DateTesting {
    static var allTests = [("testArray", testArray),
                           ("testArrayOptionalValue", testArrayOptionalValue),
                           ("testNestedArray", testNestedArray),
                           ("testNestedArrayOptionalValue", testNestedArrayOptionalValue),
                           ("testKeyNotFound", testKeyNotFound),
                           ("testTypeMismatch", testTypeMismatch),
                           ("testOptionalArray", testOptionalArray),
                           ("testOptionalArrayOptionalValue", testOptionalArrayOptionalValue),
                           ("testNestedOptionalArray", testNestedOptionalArray),
                           ("testNestedOptionalArrayOptionalValue", testNestedOptionalArrayOptionalValue),
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
    
    func testArray() {
        let bool: [Bool] = try! data.value(for: "bool")
        XCTAssertEqual(bool.count, 10)
        XCTAssertEqual(bool[0], true)
        
        let string: [String] = try! data.value(for: "string")
        XCTAssertEqual(string.count, 10)
        XCTAssertEqual(string[0], "Hello, Outlaw!")
        
        let character: [Character] = try! data.value(for: "character")
        XCTAssertEqual(character.count, 10)
        XCTAssertEqual(character[0], "O")
        
        let float: [Float] = try! data.value(for: "float")
        XCTAssertEqual(float.count, 10)
        XCTAssertEqual(float[0], 3.14)
        
        let double: [Double] = try! data.value(for: "double")
        XCTAssertEqual(double.count, 10)
        XCTAssertEqual(double[0], 3.14159265359)
        
        let int: [Int] = try! data.value(for: "int")
        XCTAssertEqual(int.count, 10)
        XCTAssertEqual(int[0], -3)
        
        let int8: [Int8] = try! data.value(for: "int8")
        XCTAssertEqual(int8.count, 10)
        XCTAssertEqual(int8[0], -8)
        
        let int16: [Int16] = try! data.value(for: "int16")
        XCTAssertEqual(int16.count, 10)
        XCTAssertEqual(int16[0], -16)
        
        let int32: [Int32] = try! data.value(for: "int32")
        XCTAssertEqual(int32.count, 10)
        XCTAssertEqual(int32[0], -32)
        
        let int64: [Int64] = try! data.value(for: "int64")
        XCTAssertEqual(int64.count, 10)
        XCTAssertEqual(int64[0], -64)
        
        let uint: [UInt] = try! data.value(for: "uint")
        XCTAssertEqual(uint.count, 10)
        XCTAssertEqual(uint[0], 3)
        
        let uint8: [UInt8] = try! data.value(for: "uint8")
        XCTAssertEqual(uint8.count, 10)
        XCTAssertEqual(uint8[0], 8)
        
        let uint16: [UInt16] = try! data.value(for: "uint16")
        XCTAssertEqual(uint16.count, 10)
        XCTAssertEqual(uint16[0], 16)
        
        let uint32: [UInt32] = try! data.value(for: "uint32")
        XCTAssertEqual(uint32.count, 10)
        XCTAssertEqual(uint32[0], 32)
        
        let uint64: [UInt64] = try! data.value(for: "uint64")
        XCTAssertEqual(uint64.count, 10)
        XCTAssertEqual(uint64[0], 64)
        
        let array: [[String]] = try! data.value(for: "array")
        XCTAssertEqual(array.count, 10)
        XCTAssertEqual(array[0][0], "O")
        
        let dictionary: [[String: String]] = try! data.value(for: "dictionary")
        XCTAssertEqual(dictionary.count, 10)
        XCTAssertEqual(dictionary[0]["O"]!, "Hello, Outlaw!")
        
        let url: [URL] = try! data.value(for: "url")
        XCTAssertEqual(url.count, 10)
        XCTAssertEqual(url[0].absoluteString, "https://developer.apple.com/")
        
        let date: [Date] = try! data.value(for: "date")
        XCTAssertEqual(date.count, 10)
        XCTAssertEqual(formatDate(date[0]), formatDate(dateForAssert()))
    }
    
    func testArrayOptionalValue() {
        let bool: [Bool?] = try! data.value(for: "bool")
        XCTAssertEqual(bool.count, 10)
        XCTAssertEqual(bool[0], true)
        
        let string: [String?] = try! data.value(for: "string")
        XCTAssertEqual(string.count, 10)
        XCTAssertEqual(string[0], "Hello, Outlaw!")
        
        let character: [Character?] = try! data.value(for: "character")
        XCTAssertEqual(character.count, 10)
        XCTAssertEqual(character[0], "O")
        
        let float: [Float?] = try! data.value(for: "float")
        XCTAssertEqual(float.count, 10)
        XCTAssertEqual(float[0], 3.14)
        
        let double: [Double?] = try! data.value(for: "double")
        XCTAssertEqual(double.count, 10)
        XCTAssertEqual(double[0], 3.14159265359)
        
        let int: [Int?] = try! data.value(for: "int")
        XCTAssertEqual(int.count, 10)
        XCTAssertEqual(int[0], -3)
        
        let int8: [Int8?] = try! data.value(for: "int8")
        XCTAssertEqual(int8.count, 10)
        XCTAssertEqual(int8[0], -8)
        
        let int16: [Int16?] = try! data.value(for: "int16")
        XCTAssertEqual(int16.count, 10)
        XCTAssertEqual(int16[0], -16)
        
        let int32: [Int32?] = try! data.value(for: "int32")
        XCTAssertEqual(int32.count, 10)
        XCTAssertEqual(int32[0], -32)
        
        let int64: [Int64?] = try! data.value(for: "int64")
        XCTAssertEqual(int64.count, 10)
        XCTAssertEqual(int64[0], -64)
        
        let uint: [UInt?] = try! data.value(for: "uint")
        XCTAssertEqual(uint.count, 10)
        XCTAssertEqual(uint[0], 3)
        
        let uint8: [UInt8?] = try! data.value(for: "uint8")
        XCTAssertEqual(uint8.count, 10)
        XCTAssertEqual(uint8[0], 8)
        
        let uint16: [UInt16?] = try! data.value(for: "uint16")
        XCTAssertEqual(uint16.count, 10)
        XCTAssertEqual(uint16[0], 16)
        
        let uint32: [UInt32?] = try! data.value(for: "uint32")
        XCTAssertEqual(uint32.count, 10)
        XCTAssertEqual(uint32[0], 32)
        
        let uint64: [UInt64?] = try! data.value(for: "uint64")
        XCTAssertEqual(uint64.count, 10)
        XCTAssertEqual(uint64[0], 64)
        
        let array: [[String]?] = try! data.value(for: "array")
        XCTAssertEqual(array.count, 10)
        XCTAssertEqual(array[0]?[0], "O")
        
        let dictionary: [[String: String]?] = try! data.value(for: "dictionary")
        XCTAssertEqual(dictionary.count, 10)
        XCTAssertEqual(dictionary[0]?["O"]!, "Hello, Outlaw!")
        
        let url: [URL?] = try! data.value(for: "url")
        XCTAssertEqual(url.count, 10)
        XCTAssertEqual(url[0]?.absoluteString, "https://developer.apple.com/")
        
        let date: [Date?] = try! data.value(for: "date")
        XCTAssertEqual(date.count, 10)
        XCTAssertEqual(formatDate(date[0]!), formatDate(dateForAssert()))
    }
    
    func testNestedArray() {
        let bool: [Bool] = try! data.value(for: "object.bool")
        XCTAssertEqual(bool.count, 10)
        XCTAssertEqual(bool[0], true)
        
        let string: [String] = try! data.value(for: "object.string")
        XCTAssertEqual(string.count, 10)
        XCTAssertEqual(string[0], "Hello, Outlaw!")
        
        let character: [Character] = try! data.value(for: "object.character")
        XCTAssertEqual(character.count, 10)
        XCTAssertEqual(character[0], "O")
        
        let float: [Float] = try! data.value(for: "object.float")
        XCTAssertEqual(float.count, 10)
        XCTAssertEqual(float[0], 3.14)
        
        let double: [Double] = try! data.value(for: "object.double")
        XCTAssertEqual(double.count, 10)
        XCTAssertEqual(double[0], 3.14159265359)
        
        let int: [Int] = try! data.value(for: "object.int")
        XCTAssertEqual(int.count, 10)
        XCTAssertEqual(int[0], -3)
        
        let int8: [Int8] = try! data.value(for: "object.int8")
        XCTAssertEqual(int8.count, 10)
        XCTAssertEqual(int8[0], -8)
        
        let int16: [Int16] = try! data.value(for: "object.int16")
        XCTAssertEqual(int16.count, 10)
        XCTAssertEqual(int16[0], -16)
        
        let int32: [Int32] = try! data.value(for: "object.int32")
        XCTAssertEqual(int32.count, 10)
        XCTAssertEqual(int32[0], -32)
        
        let int64: [Int64] = try! data.value(for: "object.int64")
        XCTAssertEqual(int64.count, 10)
        XCTAssertEqual(int64[0], -64)
        
        let uint: [UInt] = try! data.value(for: "object.uint")
        XCTAssertEqual(uint.count, 10)
        XCTAssertEqual(uint[0], 3)
        
        let uint8: [UInt8] = try! data.value(for: "object.uint8")
        XCTAssertEqual(uint8.count, 10)
        XCTAssertEqual(uint8[0], 8)
        
        let uint16: [UInt16] = try! data.value(for: "object.uint16")
        XCTAssertEqual(uint16.count, 10)
        XCTAssertEqual(uint16[0], 16)
        
        let uint32: [UInt32] = try! data.value(for: "object.uint32")
        XCTAssertEqual(uint32.count, 10)
        XCTAssertEqual(uint32[0], 32)
        
        let uint64: [UInt64] = try! data.value(for: "object.uint64")
        XCTAssertEqual(uint64.count, 10)
        XCTAssertEqual(uint64[0], 64)
        
        let array: [[String]] = try! data.value(for: "object.array")
        XCTAssertEqual(array.count, 10)
        XCTAssertEqual(array[0][0], "O")
        
        let dictionary: [[String: String]] = try! data.value(for: "object.dictionary")
        XCTAssertEqual(dictionary.count, 10)
        XCTAssertEqual(dictionary[0]["O"]!, "Hello, Outlaw!")
        
        let url: [URL] = try! data.value(for: "object.url")
        XCTAssertEqual(url.count, 10)
        XCTAssertEqual(url[0].absoluteString, "https://developer.apple.com/")
        
        let date: [Date] = try! data.value(for: "object.date")
        XCTAssertEqual(date.count, 10)
        XCTAssertEqual(formatDate(date[0]), formatDate(dateForAssert()))
    }
    
    func testNestedArrayOptionalValue() {
        let bool: [Bool?] = try! data.value(for: "object.bool")
        XCTAssertEqual(bool.count, 10)
        XCTAssertEqual(bool[0], true)
        
        let string: [String?] = try! data.value(for: "object.string")
        XCTAssertEqual(string.count, 10)
        XCTAssertEqual(string[0], "Hello, Outlaw!")
        
        let character: [Character?] = try! data.value(for: "object.character")
        XCTAssertEqual(character.count, 10)
        XCTAssertEqual(character[0], "O")
        
        let float: [Float?] = try! data.value(for: "object.float")
        XCTAssertEqual(float.count, 10)
        XCTAssertEqual(float[0], 3.14)
        
        let double: [Double?] = try! data.value(for: "object.double")
        XCTAssertEqual(double.count, 10)
        XCTAssertEqual(double[0], 3.14159265359)
        
        let int: [Int?] = try! data.value(for: "object.int")
        XCTAssertEqual(int.count, 10)
        XCTAssertEqual(int[0], -3)
        
        let int8: [Int8?] = try! data.value(for: "object.int8")
        XCTAssertEqual(int8.count, 10)
        XCTAssertEqual(int8[0], -8)
        
        let int16: [Int16?] = try! data.value(for: "object.int16")
        XCTAssertEqual(int16.count, 10)
        XCTAssertEqual(int16[0], -16)
        
        let int32: [Int32?] = try! data.value(for: "object.int32")
        XCTAssertEqual(int32.count, 10)
        XCTAssertEqual(int32[0], -32)
        
        let int64: [Int64?] = try! data.value(for: "object.int64")
        XCTAssertEqual(int64.count, 10)
        XCTAssertEqual(int64[0], -64)
        
        let uint: [UInt?] = try! data.value(for: "object.uint")
        XCTAssertEqual(uint.count, 10)
        XCTAssertEqual(uint[0], 3)
        
        let uint8: [UInt8?] = try! data.value(for: "object.uint8")
        XCTAssertEqual(uint8.count, 10)
        XCTAssertEqual(uint8[0], 8)
        
        let uint16: [UInt16?] = try! data.value(for: "object.uint16")
        XCTAssertEqual(uint16.count, 10)
        XCTAssertEqual(uint16[0], 16)
        
        let uint32: [UInt32?] = try! data.value(for: "object.uint32")
        XCTAssertEqual(uint32.count, 10)
        XCTAssertEqual(uint32[0], 32)
        
        let uint64: [UInt64?] = try! data.value(for: "object.uint64")
        XCTAssertEqual(uint64.count, 10)
        XCTAssertEqual(uint64[0], 64)
        
        let array: [[String]?] = try! data.value(for: "object.array")
        XCTAssertEqual(array.count, 10)
        XCTAssertEqual(array[0]?[0], "O")
        
        let dictionary: [[String: String]?] = try! data.value(for: "object.dictionary")
        XCTAssertEqual(dictionary.count, 10)
        XCTAssertEqual(dictionary[0]?["O"]!, "Hello, Outlaw!")
        
        let url: [URL?] = try! data.value(for: "object.url")
        XCTAssertEqual(url.count, 10)
        XCTAssertEqual(url[0]?.absoluteString, "https://developer.apple.com/")
        
        let date: [Date?] = try! data.value(for: "object.date")
        XCTAssertEqual(date.count, 10)
        XCTAssertEqual(formatDate(date[0]!), formatDate(dateForAssert()))
    }
    
    func testKeyNotFound() {
        var value: [Int] = []
        
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
        var value: [Int] = []
        
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
    
    func testOptionalArray() {
        let bool: [Bool]? = data.value(for: "bool")
        XCTAssertEqual(bool?.count, 10)
        XCTAssertEqual(bool?[0], true)
        
        let string: [String]? = data.value(for: "string")
        XCTAssertEqual(string?.count, 10)
        XCTAssertEqual(string?[0], "Hello, Outlaw!")
        
        let character: [Character]? = data.value(for: "character")
        XCTAssertEqual(character?.count, 10)
        XCTAssertEqual(character?[0], "O")
        
        let float: [Float]? = data.value(for: "float")
        XCTAssertEqual(float?.count, 10)
        XCTAssertEqual(float?[0], 3.14)
        
        let double: [Double]? = data.value(for: "double")
        XCTAssertEqual(double?.count, 10)
        XCTAssertEqual(double?[0], 3.14159265359)
        
        let int: [Int]? = data.value(for: "int")
        XCTAssertEqual(int?.count, 10)
        XCTAssertEqual(int?[0], -3)
        
        let int8: [Int8]? = data.value(for: "int8")
        XCTAssertEqual(int8?.count, 10)
        XCTAssertEqual(int8?[0], -8)
        
        let int16: [Int16]? = data.value(for: "int16")
        XCTAssertEqual(int16?.count, 10)
        XCTAssertEqual(int16?[0], -16)
        
        let int32: [Int32]? = data.value(for: "int32")
        XCTAssertEqual(int32?.count, 10)
        XCTAssertEqual(int32?[0], -32)
        
        let int64: [Int64]? = data.value(for: "int64")
        XCTAssertEqual(int64?.count, 10)
        XCTAssertEqual(int64?[0], -64)
        
        let uint: [UInt]? = data.value(for: "uint")
        XCTAssertEqual(uint?.count, 10)
        XCTAssertEqual(uint?[0], 3)
        
        let uint8: [UInt8]? = data.value(for: "uint8")
        XCTAssertEqual(uint8?.count, 10)
        XCTAssertEqual(uint8?[0], 8)
        
        let uint16: [UInt16]? = data.value(for: "uint16")
        XCTAssertEqual(uint16?.count, 10)
        XCTAssertEqual(uint16?[0], 16)
        
        let uint32: [UInt32]? = data.value(for: "uint32")
        XCTAssertEqual(uint32?.count, 10)
        XCTAssertEqual(uint32?[0], 32)
        
        let uint64: [UInt64]? = data.value(for: "uint64")
        XCTAssertEqual(uint64?.count, 10)
        XCTAssertEqual(uint64?[0], 64)
        
        let array: [[String]]? = data.value(for: "array")
        XCTAssertEqual(array?.count, 10)
        XCTAssertEqual(array?[0][0], "O")
        
        let dictionary: [[String: String]]? = data.value(for: "dictionary")
        XCTAssertEqual(dictionary?.count, 10)
        XCTAssertEqual(dictionary?[0]["O"], "Hello, Outlaw!")
        
        let url: [URL]? = data.value(for: "url")
        XCTAssertEqual(url?.count, 10)
        XCTAssertEqual(url?[0].absoluteString, "https://developer.apple.com/")
        
        let date: [Date]? = data.value(for: "date")
        XCTAssertEqual(date?.count, 10)
        XCTAssertEqual(formatDate(date![0]), formatDate(dateForAssert()))
    }
    
    func testOptionalArrayOptionalValue() {
        let bool: [Bool?]? = data.value(for: "bool")
        XCTAssertEqual(bool?.count, 10)
        XCTAssertEqual(bool?[0], true)
        
        let string: [String?]? = data.value(for: "string")
        XCTAssertEqual(string?.count, 10)
        XCTAssertEqual(string?[0], "Hello, Outlaw!")
        
        let character: [Character?]? = data.value(for: "character")
        XCTAssertEqual(character?.count, 10)
        XCTAssertEqual(character?[0], "O")
        
        let float: [Float?]? = data.value(for: "float")
        XCTAssertEqual(float?.count, 10)
        XCTAssertEqual(float?[0], 3.14)
        
        let double: [Double?]? = data.value(for: "double")
        XCTAssertEqual(double?.count, 10)
        XCTAssertEqual(double?[0], 3.14159265359)
        
        let int: [Int?]? = data.value(for: "int")
        XCTAssertEqual(int?.count, 10)
        XCTAssertEqual(int?[0], -3)
        
        let int8: [Int8?]? = data.value(for: "int8")
        XCTAssertEqual(int8?.count, 10)
        XCTAssertEqual(int8?[0], -8)
        
        let int16: [Int16?]? = data.value(for: "int16")
        XCTAssertEqual(int16?.count, 10)
        XCTAssertEqual(int16?[0], -16)
        
        let int32: [Int32?]? = data.value(for: "int32")
        XCTAssertEqual(int32?.count, 10)
        XCTAssertEqual(int32?[0], -32)
        
        let int64: [Int64?]? = data.value(for: "int64")
        XCTAssertEqual(int64?.count, 10)
        XCTAssertEqual(int64?[0], -64)
        
        let uint: [UInt?]? = data.value(for: "uint")
        XCTAssertEqual(uint?.count, 10)
        XCTAssertEqual(uint?[0], 3)
        
        let uint8: [UInt8?]? = data.value(for: "uint8")
        XCTAssertEqual(uint8?.count, 10)
        XCTAssertEqual(uint8?[0], 8)
        
        let uint16: [UInt16?]? = data.value(for: "uint16")
        XCTAssertEqual(uint16?.count, 10)
        XCTAssertEqual(uint16?[0], 16)
        
        let uint32: [UInt32?]? = data.value(for: "uint32")
        XCTAssertEqual(uint32?.count, 10)
        XCTAssertEqual(uint32?[0], 32)
        
        let uint64: [UInt64?]? = data.value(for: "uint64")
        XCTAssertEqual(uint64?.count, 10)
        XCTAssertEqual(uint64?[0], 64)
        
        let array: [[String]?]? = data.value(for: "array")
        XCTAssertEqual(array?.count, 10)
        XCTAssertEqual(array?[0]?[0], "O")
        
        let dictionary: [[String: String]?]? = data.value(for: "dictionary")
        XCTAssertEqual(dictionary?.count, 10)
        XCTAssertEqual(dictionary?[0]?["O"], "Hello, Outlaw!")
        
        let url: [URL?]? = data.value(for: "url")
        XCTAssertEqual(url?.count, 10)
        XCTAssertEqual(url?[0]?.absoluteString, "https://developer.apple.com/")
        
        let date: [Date?]? = data.value(for: "date")
        XCTAssertEqual(date?.count, 10)
        XCTAssertEqual(formatDate(date![0]!), formatDate(dateForAssert()))
    }
    
    func testNestedOptionalArray() {
        let bool: [Bool]? = data.value(for: "object.bool")
        XCTAssertEqual(bool?.count, 10)
        XCTAssertEqual(bool?[0], true)
        
        let string: [String]? = data.value(for: "object.string")
        XCTAssertEqual(string?.count, 10)
        XCTAssertEqual(string?[0], "Hello, Outlaw!")
        
        let character: [Character]? = data.value(for: "object.character")
        XCTAssertEqual(character?.count, 10)
        XCTAssertEqual(character?[0], "O")
        
        let float: [Float]? = data.value(for: "object.float")
        XCTAssertEqual(float?.count, 10)
        XCTAssertEqual(float?[0], 3.14)
        
        let double: [Double]? = data.value(for: "object.double")
        XCTAssertEqual(double?.count, 10)
        XCTAssertEqual(double?[0], 3.14159265359)
        
        let int: [Int]? = data.value(for: "object.int")
        XCTAssertEqual(int?.count, 10)
        XCTAssertEqual(int?[0], -3)
        
        let int8: [Int8]? = data.value(for: "object.int8")
        XCTAssertEqual(int8?.count, 10)
        XCTAssertEqual(int8?[0], -8)
        
        let int16: [Int16]? = data.value(for: "object.int16")
        XCTAssertEqual(int16?.count, 10)
        XCTAssertEqual(int16?[0], -16)
        
        let int32: [Int32]? = data.value(for: "object.int32")
        XCTAssertEqual(int32?.count, 10)
        XCTAssertEqual(int32?[0], -32)
        
        let int64: [Int64]? = data.value(for: "object.int64")
        XCTAssertEqual(int64?.count, 10)
        XCTAssertEqual(int64?[0], -64)
        
        let uint: [UInt]? = data.value(for: "object.uint")
        XCTAssertEqual(uint?.count, 10)
        XCTAssertEqual(uint?[0], 3)
        
        let uint8: [UInt8]? = data.value(for: "object.uint8")
        XCTAssertEqual(uint8?.count, 10)
        XCTAssertEqual(uint8?[0], 8)
        
        let uint16: [UInt16]? = data.value(for: "object.uint16")
        XCTAssertEqual(uint16?.count, 10)
        XCTAssertEqual(uint16?[0], 16)
        
        let uint32: [UInt32]? = data.value(for: "object.uint32")
        XCTAssertEqual(uint32?.count, 10)
        XCTAssertEqual(uint32?[0], 32)
        
        let uint64: [UInt64]? = data.value(for: "object.uint64")
        XCTAssertEqual(uint64?.count, 10)
        XCTAssertEqual(uint64?[0], 64)
        
        let array: [[String]]? = data.value(for: "object.array")
        XCTAssertEqual(array?.count, 10)
        XCTAssertEqual(array?[0][0], "O")
        
        let dictionary: [[String: String]]? = data.value(for: "object.dictionary")
        XCTAssertEqual(dictionary?.count, 10)
        XCTAssertEqual(dictionary?[0]["O"]!, "Hello, Outlaw!")
        
        let url: [URL]? = data.value(for: "object.url")
        XCTAssertEqual(url?.count, 10)
        XCTAssertEqual(url?[0].absoluteString, "https://developer.apple.com/")
        
        let date: [Date]? = data.value(for: "object.date")
        XCTAssertEqual(date?.count, 10)
        XCTAssertEqual(formatDate(date![0]), formatDate(dateForAssert()))
    }
    
    func testNestedOptionalArrayOptionalValue() {
        let bool: [Bool?]? = data.value(for: "object.bool")
        XCTAssertEqual(bool?.count, 10)
        XCTAssertEqual(bool?[0], true)
        
        let string: [String?]? = data.value(for: "object.string")
        XCTAssertEqual(string?.count, 10)
        XCTAssertEqual(string?[0], "Hello, Outlaw!")
        
        let character: [Character?]? = data.value(for: "object.character")
        XCTAssertEqual(character?.count, 10)
        XCTAssertEqual(character?[0], "O")
        
        let float: [Float?]? = data.value(for: "object.float")
        XCTAssertEqual(float?.count, 10)
        XCTAssertEqual(float?[0], 3.14)
        
        let double: [Double?]? = data.value(for: "object.double")
        XCTAssertEqual(double?.count, 10)
        XCTAssertEqual(double?[0], 3.14159265359)
        
        let int: [Int?]? = data.value(for: "object.int")
        XCTAssertEqual(int?.count, 10)
        XCTAssertEqual(int?[0], -3)
        
        let int8: [Int8?]? = data.value(for: "object.int8")
        XCTAssertEqual(int8?.count, 10)
        XCTAssertEqual(int8?[0], -8)
        
        let int16: [Int16?]? = data.value(for: "object.int16")
        XCTAssertEqual(int16?.count, 10)
        XCTAssertEqual(int16?[0], -16)
        
        let int32: [Int32?]? = data.value(for: "object.int32")
        XCTAssertEqual(int32?.count, 10)
        XCTAssertEqual(int32?[0], -32)
        
        let int64: [Int64?]? = data.value(for: "object.int64")
        XCTAssertEqual(int64?.count, 10)
        XCTAssertEqual(int64?[0], -64)
        
        let uint: [UInt?]? = data.value(for: "object.uint")
        XCTAssertEqual(uint?.count, 10)
        XCTAssertEqual(uint?[0], 3)
        
        let uint8: [UInt8?]? = data.value(for: "object.uint8")
        XCTAssertEqual(uint8?.count, 10)
        XCTAssertEqual(uint8?[0], 8)
        
        let uint16: [UInt16?]? = data.value(for: "object.uint16")
        XCTAssertEqual(uint16?.count, 10)
        XCTAssertEqual(uint16?[0], 16)
        
        let uint32: [UInt32?]? = data.value(for: "object.uint32")
        XCTAssertEqual(uint32?.count, 10)
        XCTAssertEqual(uint32?[0], 32)
        
        let uint64: [UInt64?]? = data.value(for: "object.uint64")
        XCTAssertEqual(uint64?.count, 10)
        XCTAssertEqual(uint64?[0], 64)
        
        let array: [[String]?]? = data.value(for: "object.array")
        XCTAssertEqual(array?.count, 10)
        XCTAssertEqual(array?[0]?[0], "O")
        
        let dictionary: [[String: String]?]? = data.value(for: "object.dictionary")
        XCTAssertEqual(dictionary?.count, 10)
        XCTAssertEqual(dictionary?[0]?["O"]!, "Hello, Outlaw!")
        
        let url: [URL?]? = data.value(for: "object.url")
        XCTAssertEqual(url?.count, 10)
        XCTAssertEqual(url?[0]?.absoluteString, "https://developer.apple.com/")
        
        let date: [Date?]? = data.value(for: "object.date")
        XCTAssertEqual(date?.count, 10)
        XCTAssertEqual(formatDate(date![0]!), formatDate(dateForAssert()))
    }
    
    func testOptionalKeyNotFound() {
        let value: [Int]? = data.value(for: "keyNotFound")
        XCTAssertNil(value)
    }
    
    func testOptionalTypeMismatch() {
        let value: [Int]? = data.value(for: "object")
        XCTAssertNil(value)
    }
    
// MARK: -
// MARK: Transforms
    
    func testTransformValue() {
        let bool: [Bool] = try! data.value(for: "boolTransform", with: { (rawValue: String) -> Bool in
            return rawValue == "TRUE"
        })
        XCTAssertEqual(bool.count, 10)
        XCTAssertEqual(bool[0], true)
        
        let string: [String] = try! data.value(for: "stringTransform", with: { (rawValue: Bool) -> String in
            return rawValue ? "TRUE" : "FALSE"
        })
        XCTAssertEqual(string.count, 10)
        XCTAssertEqual(string[0], "TRUE")
        
        let character: [Character] = try! data.value(for: "characterTransform", with: { (rawValue: Bool) -> Character in
            return rawValue ? "1" : "0"
        })
        XCTAssertEqual(character.count, 10)
        XCTAssertEqual(character[0], "1")
        
        let float: [Float] = try! data.value(for: "floatTransform", with: { (rawValue: String) -> Float in
            return rawValue == "PI" ? 3.14 : 0
        })
        XCTAssertEqual(float.count, 10)
        XCTAssertEqual(float[0], 3.14)
        
        let double: [Double] = try! data.value(for: "doubleTransform", with: { (rawValue: String) -> Double in
            return rawValue == "PI" ? 3.14 : 0
        })
        XCTAssertEqual(double.count, 10)
        XCTAssertEqual(double[0], 3.14)
        
        let int: [Int] = try! data.value(for: "intTransform", with: { (rawValue: String) -> Int in
            guard let value = Int(rawValue) else {
                throw OutlawError.typeMismatchWithKey(key: "intTransform", expected: Int.self, actual: rawValue)
            }
            return value
        })
        XCTAssertEqual(int.count, 10)
        XCTAssertEqual(int[0], 12345)
        
        let int8: [Int8] = try! data.value(for: "int8Transform", with: { (rawValue: String) -> Int8 in
            guard let value = Int8(rawValue) else {
                throw OutlawError.typeMismatchWithKey(key: "intTransform", expected: Int8.self, actual: rawValue)
            }
            return value
        })
        XCTAssertEqual(int8.count, 10)
        XCTAssertEqual(int8[0], 123)
        
        let int16: [Int16] = try! data.value(for: "int16Transform", with: { (rawValue: String) -> Int16 in
            guard let value = Int16(rawValue) else {
                throw OutlawError.typeMismatchWithKey(key: "int16Transform", expected: Int16.self, actual: rawValue)
            }
            return value
        })
        XCTAssertEqual(int16.count, 10)
        XCTAssertEqual(int16[0], 12345)
        
        let int32: [Int32] = try! data.value(for: "int32Transform", with: { (rawValue: String) -> Int32 in
            guard let value = Int32(rawValue) else {
                throw OutlawError.typeMismatchWithKey(key: "int32Transform", expected: Int32.self, actual: rawValue)
            }
            return value
        })
        XCTAssertEqual(int32.count, 10)
        XCTAssertEqual(int32[0], 12345)
        
        let int64: [Int64] = try! data.value(for: "int64Transform", with: { (rawValue: String) -> Int64 in
            guard let value = Int64(rawValue) else {
                throw OutlawError.typeMismatchWithKey(key: "int64Transform", expected: Int64.self, actual: rawValue)
            }
            return value
        })
        XCTAssertEqual(int64.count, 10)
        XCTAssertEqual(int64[0], 12345)
        
        let uint: [UInt] = try! data.value(for: "uintTransform", with: { (rawValue: String) -> UInt in
            guard let value = UInt(rawValue) else {
                throw OutlawError.typeMismatchWithKey(key: "uintTransform", expected: UInt.self, actual: rawValue)
            }
            return value
        })
        XCTAssertEqual(uint.count, 10)
        XCTAssertEqual(uint[0], 12345)
        
        let uint8: [UInt8] = try! data.value(for: "uint8Transform", with: { (rawValue: String) -> UInt8 in
            guard let value = UInt8(rawValue) else {
                throw OutlawError.typeMismatchWithKey(key: "uintTransform", expected: UInt8.self, actual: rawValue)
            }
            return value
        })
        XCTAssertEqual(uint8.count, 10)
        XCTAssertEqual(uint8[0], 123)
        
        let uint16: [UInt16] = try! data.value(for: "uint16Transform", with: { (rawValue: String) -> UInt16 in
            guard let value = UInt16(rawValue) else {
                throw OutlawError.typeMismatchWithKey(key: "uint16Transform", expected: UInt16.self, actual: rawValue)
            }
            return value
        })
        XCTAssertEqual(uint16.count, 10)
        XCTAssertEqual(uint16[0], 12345)
        
        let uint32: [UInt32] = try! data.value(for: "uint32Transform", with: { (rawValue: String) -> UInt32 in
            guard let value = UInt32(rawValue) else {
                throw OutlawError.typeMismatchWithKey(key: "uint32Transform", expected: UInt32.self, actual: rawValue)
            }
            return value
        })
        XCTAssertEqual(uint32.count, 10)
        XCTAssertEqual(uint32[0], 12345)
        
        let uint64: [UInt64] = try! data.value(for: "uint64Transform", with: { (rawValue: String) -> UInt64 in
            guard let value = UInt64(rawValue) else {
                throw OutlawError.typeMismatchWithKey(key: "uint64Transform", expected: UInt64.self, actual: rawValue)
            }
            return value
        })
        XCTAssertEqual(uint64.count, 10)
        XCTAssertEqual(uint64[0], 12345)
        
        let url: [URL] = try! data.value(for: "urlTransform", with: { (rawValue: String) -> URL in
            let urlValue = rawValue == "HOMEPAGE" ? "http://molbie.co" : rawValue
            guard let value = URL(string: urlValue) else {
                throw OutlawError.typeMismatchWithKey(key: "urlTransform", expected: URL.self, actual: rawValue)
            }
            
            return value
        })
        XCTAssertEqual(url.count, 10)
        XCTAssertEqual(url[0].absoluteString, "http://molbie.co")
        
        let formatter = shortDateformatter()
        let date: [Date] = try! data.value(for: "dateTransform", with: { (rawValue: String) -> Date in
            return formatter.date(from: rawValue)!
        })
        XCTAssertEqual(date.count, 10)
        XCTAssertEqual(formatShortDate(date[0]), formatShortDate(shortDateForAssert()))
    }
    
    func testOptionalTransformValue() {
        let bool: [Bool] = try! data.value(for: "boolTransform", with: { (rawValue: String?) -> Bool in
            return rawValue == "TRUE"
        })
        XCTAssertEqual(bool.count, 10)
        XCTAssertEqual(bool[0], true)
        
        let string: [String] = try! data.value(for: "stringTransform", with: { (rawValue: Bool?) -> String in
            guard let rawValue = rawValue else { return "FALSE" }
            return rawValue ? "TRUE" : "FALSE"
        })
        XCTAssertEqual(string.count, 10)
        XCTAssertEqual(string[0], "TRUE")
        
        let character: [Character] = try! data.value(for: "characterTransform", with: { (rawValue: Bool?) -> Character in
            guard let rawValue = rawValue else { return "0" }
            return rawValue ? "1" : "0"
        })
        XCTAssertEqual(character.count, 10)
        XCTAssertEqual(character[0], "1")
        
        let float: [Float] = try! data.value(for: "floatTransform", with: { (rawValue: String?) -> Float in
            guard let rawValue = rawValue else { return 0 }
            return rawValue == "PI" ? 3.14 : 0
        })
        XCTAssertEqual(float.count, 10)
        XCTAssertEqual(float[0], 3.14)
        
        let double: [Double] = try! data.value(for: "doubleTransform", with: { (rawValue: String?) -> Double in
            guard let rawValue = rawValue else { return 0 }
            return rawValue == "PI" ? 3.14 : 0
        })
        XCTAssertEqual(double.count, 10)
        XCTAssertEqual(double[0], 3.14)
        
        let int: [Int] = try! data.value(for: "intTransform", with: { (rawValue: String?) -> Int in
            guard let value = Int(rawValue ?? "0") else {
                throw OutlawError.typeMismatchWithKey(key: "intTransform", expected: Int.self, actual: rawValue ?? "nil")
            }
            return value
        })
        XCTAssertEqual(int.count, 10)
        XCTAssertEqual(int[0], 12345)
        
        let int8: [Int8] = try! data.value(for: "int8Transform", with: { (rawValue: String?) -> Int8 in
            guard let value = Int8(rawValue ?? "0") else {
                throw OutlawError.typeMismatchWithKey(key: "int8Transform", expected: Int8.self, actual: rawValue ?? "nil")
            }
            return value
        })
        XCTAssertEqual(int8.count, 10)
        XCTAssertEqual(int8[0], 123)
        
        let int16: [Int16] = try! data.value(for: "int16Transform", with: { (rawValue: String?) -> Int16 in
            guard let value = Int16(rawValue ?? "0") else {
                throw OutlawError.typeMismatchWithKey(key: "int16Transform", expected: Int16.self, actual: rawValue ?? "nil")
            }
            return value
        })
        XCTAssertEqual(int16.count, 10)
        XCTAssertEqual(int16[0], 12345)
        
        let int32: [Int32] = try! data.value(for: "int32Transform", with: { (rawValue: String?) -> Int32 in
            guard let value = Int32(rawValue ?? "0") else {
                throw OutlawError.typeMismatchWithKey(key: "int32Transform", expected: Int32.self, actual: rawValue ?? "nil")
            }
            return value
        })
        XCTAssertEqual(int32.count, 10)
        XCTAssertEqual(int32[0], 12345)
        
        let int64: [Int64] = try! data.value(for: "intTransform", with: { (rawValue: String?) -> Int64 in
            guard let value = Int64(rawValue ?? "0") else {
                throw OutlawError.typeMismatchWithKey(key: "intTransform", expected: Int64.self, actual: rawValue ?? "nil")
            }
            return value
        })
        XCTAssertEqual(int64.count, 10)
        XCTAssertEqual(int64[0], 12345)
        
        let uint: [UInt] = try! data.value(for: "uintTransform", with: { (rawValue: String?) -> UInt in
            guard let value = UInt(rawValue ?? "0") else {
                throw OutlawError.typeMismatchWithKey(key: "uintTransform", expected: UInt.self, actual: rawValue ?? "nil")
            }
            return value
        })
        XCTAssertEqual(uint.count, 10)
        XCTAssertEqual(uint[0], 12345)
        
        let uint8: [UInt8] = try! data.value(for: "uint8Transform", with: { (rawValue: String?) -> UInt8 in
            guard let value = UInt8(rawValue ?? "0") else {
                throw OutlawError.typeMismatchWithKey(key: "uint8Transform", expected: UInt8.self, actual: rawValue ?? "nil")
            }
            return value
        })
        XCTAssertEqual(uint8.count, 10)
        XCTAssertEqual(uint8[0], 123)
        
        let uint16: [UInt16] = try! data.value(for: "uint16Transform", with: { (rawValue: String?) -> UInt16 in
            guard let value = UInt16(rawValue ?? "0") else {
                throw OutlawError.typeMismatchWithKey(key: "uint16Transform", expected: UInt16.self, actual: rawValue ?? "nil")
            }
            return value
        })
        XCTAssertEqual(uint16.count, 10)
        XCTAssertEqual(uint16[0], 12345)
        
        let uint32: [UInt32] = try! data.value(for: "uint32Transform", with: { (rawValue: String?) -> UInt32 in
            guard let value = UInt32(rawValue ?? "0") else {
                throw OutlawError.typeMismatchWithKey(key: "uint32Transform", expected: UInt32.self, actual: rawValue ?? "nil")
            }
            return value
        })
        XCTAssertEqual(uint32.count, 10)
        XCTAssertEqual(uint32[0], 12345)
        
        let uint64: [UInt64] = try! data.value(for: "uintTransform", with: { (rawValue: String?) -> UInt64 in
            guard let value = UInt64(rawValue ?? "0") else {
                throw OutlawError.typeMismatchWithKey(key: "uintTransform", expected: UInt64.self, actual: rawValue ?? "nil")
            }
            return value
        })
        XCTAssertEqual(uint64.count, 10)
        XCTAssertEqual(uint64[0], 12345)
        
        let url: [URL] = try! data.value(for: "urlTransform", with: { (rawValue: String?) -> URL in
            let urlValue = rawValue == "HOMEPAGE" ? "http://molbie.co" : (rawValue ?? "")
            guard let value = URL(string: urlValue) else {
                throw OutlawError.typeMismatchWithKey(key: "urlTransform", expected: URL.self, actual: rawValue ?? "")
            }
            
            return value
        })
        XCTAssertEqual(url.count, 10)
        XCTAssertEqual(url[0].absoluteString, "http://molbie.co")
        
        let formatter = shortDateformatter()
        let date: [Date] = try! data.value(for: "dateTransform", with: { (rawValue: String?) -> Date in
            guard let dateValue = rawValue else {
                throw OutlawError.typeMismatchWithKey(key: "transform", expected: Date.self, actual: rawValue ?? "")
            }
            
            return formatter.date(from: dateValue)!
        })
        XCTAssertEqual(date.count, 10)
        XCTAssertEqual(formatShortDate(date[0]), formatShortDate(shortDateForAssert()))
    }
    
    func testTransformOptionalValue() {
        let bool: [Bool]? = data.value(for: "boolTransform", with: { (rawValue: String) -> Bool in
            return rawValue == "TRUE"
        })
        XCTAssertEqual(bool?.count, 10)
        XCTAssertEqual(bool?[0], true)
        
        let string: [String]? = data.value(for: "stringTransform", with: { (rawValue: Bool) -> String in
            return rawValue ? "TRUE" : "FALSE"
        })
        XCTAssertEqual(string?.count, 10)
        XCTAssertEqual(string?[0], "TRUE")
        
        let character: [Character]? = data.value(for: "characterTransform", with: { (rawValue: Bool) -> Character in
            return rawValue ? "1" : "0"
        })
        XCTAssertEqual(character?.count, 10)
        XCTAssertEqual(character?[0], "1")
        
        let float: [Float]? = data.value(for: "floatTransform", with: { (rawValue: String) -> Float in
            return rawValue == "PI" ? 3.14 : 0
        })
        XCTAssertEqual(float?.count, 10)
        XCTAssertEqual(float?[0], 3.14)
        
        let double: [Double]? = data.value(for: "doubleTransform", with: { (rawValue: String) -> Double in
            return rawValue == "PI" ? 3.14 : 0
        })
        XCTAssertEqual(double?.count, 10)
        XCTAssertEqual(double?[0], 3.14)
        
        let int: [Int]? = data.value(for: "intTransform", with: { (rawValue: String) -> Int in
            guard let value = Int(rawValue) else {
                throw OutlawError.typeMismatchWithKey(key: "intTransform", expected: Int.self, actual: rawValue)
            }
            return value
        })
        XCTAssertEqual(int?.count, 10)
        XCTAssertEqual(int?[0], 12345)
        
        let int8: [Int8]? = data.value(for: "int8Transform", with: { (rawValue: String) -> Int8 in
            guard let value = Int8(rawValue) else {
                throw OutlawError.typeMismatchWithKey(key: "int8Transform", expected: Int8.self, actual: rawValue)
            }
            return value
        })
        XCTAssertEqual(int8?.count, 10)
        XCTAssertEqual(int8?[0], 123)
        
        let int16: [Int16]? = data.value(for: "int16Transform", with: { (rawValue: String) -> Int16 in
            guard let value = Int16(rawValue) else {
                throw OutlawError.typeMismatchWithKey(key: "int16Transform", expected: Int16.self, actual: rawValue)
            }
            return value
        })
        XCTAssertEqual(int16?.count, 10)
        XCTAssertEqual(int16?[0], 12345)
        
        let int32: [Int32]? = data.value(for: "int32Transform", with: { (rawValue: String) -> Int32 in
            guard let value = Int32(rawValue) else {
                throw OutlawError.typeMismatchWithKey(key: "int32Transform", expected: Int32.self, actual: rawValue)
            }
            return value
        })
        XCTAssertEqual(int32?.count, 10)
        XCTAssertEqual(int32?[0], 12345)
        
        let int64: [Int64]? = data.value(for: "int64Transform", with: { (rawValue: String) -> Int64 in
            guard let value = Int64(rawValue) else {
                throw OutlawError.typeMismatchWithKey(key: "int64Transform", expected: Int64.self, actual: rawValue)
            }
            return value
        })
        XCTAssertEqual(int64?.count, 10)
        XCTAssertEqual(int64?[0], 12345)
        
        let uint: [UInt]? = data.value(for: "uintTransform", with: { (rawValue: String) -> UInt in
            guard let value = UInt(rawValue) else {
                throw OutlawError.typeMismatchWithKey(key: "uintTransform", expected: UInt.self, actual: rawValue)
            }
            return value
        })
        XCTAssertEqual(uint?.count, 10)
        XCTAssertEqual(uint?[0], 12345)
        
        let uint8: [UInt8]? = data.value(for: "uint8Transform", with: { (rawValue: String) -> UInt8 in
            guard let value = UInt8(rawValue) else {
                throw OutlawError.typeMismatchWithKey(key: "uint8Transform", expected: UInt8.self, actual: rawValue)
            }
            return value
        })
        XCTAssertEqual(uint8?.count, 10)
        XCTAssertEqual(uint8?[0], 123)
        
        let uint16: [UInt16]? = data.value(for: "uint16Transform", with: { (rawValue: String) -> UInt16 in
            guard let value = UInt16(rawValue) else {
                throw OutlawError.typeMismatchWithKey(key: "uint16Transform", expected: UInt16.self, actual: rawValue)
            }
            return value
        })
        XCTAssertEqual(uint16?.count, 10)
        XCTAssertEqual(uint16?[0], 12345)
        
        let uint32: [UInt32]? = data.value(for: "uint32Transform", with: { (rawValue: String) -> UInt32 in
            guard let value = UInt32(rawValue) else {
                throw OutlawError.typeMismatchWithKey(key: "uint32Transform", expected: UInt32.self, actual: rawValue)
            }
            return value
        })
        XCTAssertEqual(uint32?.count, 10)
        XCTAssertEqual(uint32?[0], 12345)
        
        let uint64: [UInt64]? = data.value(for: "uint64Transform", with: { (rawValue: String) -> UInt64 in
            guard let value = UInt64(rawValue) else {
                throw OutlawError.typeMismatchWithKey(key: "uint64Transform", expected: UInt64.self, actual: rawValue)
            }
            return value
        })
        XCTAssertEqual(uint64?.count, 10)
        XCTAssertEqual(uint64?[0], 12345)
        
        let url: [URL]? = data.value(for: "urlTransform", with: { (rawValue: String) -> URL in
            let urlValue = rawValue == "HOMEPAGE" ? "http://molbie.co" : rawValue
            guard let value = URL(string: urlValue) else {
                throw OutlawError.typeMismatchWithKey(key: "urlTransform", expected: URL.self, actual: rawValue)
            }
            
            return value
        })
        XCTAssertEqual(url?.count, 10)
        XCTAssertEqual(url?[0].absoluteString, "http://molbie.co")
        
        let formatter = shortDateformatter()
        let date: [Date]? = data.value(for: "dateTransform", with: { (rawValue: String) -> Date in
            return formatter.date(from: rawValue)!
        })
        XCTAssertEqual(date?.count, 10)
        XCTAssertEqual(formatShortDate(date![0]), formatShortDate(shortDateForAssert()))
    }
    
    func testOptionalTransformOptionalValue() {
        let bool: [Bool]? = data.value(for: "boolTransform", with: { (rawValue: String?) -> Bool in
            return rawValue == "TRUE"
        })
        XCTAssertEqual(bool?.count, 10)
        XCTAssertEqual(bool?[0], true)
        
        let string: [String]? = data.value(for: "stringTransform", with: { (rawValue: Bool?) -> String in
            let value = rawValue ?? false
            return value ? "TRUE" : "FALSE"
        })
        XCTAssertEqual(string?.count, 10)
        XCTAssertEqual(string?[0], "TRUE")
        
        let character: [Character]? = data.value(for: "characterTransform", with: { (rawValue: Bool?) -> Character in
            let value = rawValue ?? false
            return value ? "1" : "0"
        })
        XCTAssertEqual(character?.count, 10)
        XCTAssertEqual(character?[0], "1")
        
        let float: [Float]? = data.value(for: "floatTransform", with: { (rawValue: String?) -> Float in
            let value = rawValue ?? ""
            return value == "PI" ? 3.14 : 0
        })
        XCTAssertEqual(float?.count, 10)
        XCTAssertEqual(float?[0], 3.14)
        
        let double: [Double]? = data.value(for: "doubleTransform", with: { (rawValue: String?) -> Double in
            let value = rawValue ?? ""
            return value == "PI" ? 3.14 : 0
        })
        XCTAssertEqual(double?.count, 10)
        XCTAssertEqual(double?[0], 3.14)
        
        let int: [Int]? = data.value(for: "intTransform", with: { (rawValue: String?) -> Int in
            guard let value = Int(rawValue ?? "") else {
                throw OutlawError.typeMismatchWithKey(key: "intTransform", expected: Int.self, actual: rawValue ?? "")
            }
            return value
        })
        XCTAssertEqual(int?.count, 10)
        XCTAssertEqual(int?[0], 12345)
        
        let int8: [Int8]? = data.value(for: "int8Transform", with: { (rawValue: String?) -> Int8 in
            guard let value = Int8(rawValue ?? "") else {
                throw OutlawError.typeMismatchWithKey(key: "int8Transform", expected: Int8.self, actual: rawValue ?? "")
            }
            return value
        })
        XCTAssertEqual(int8?.count, 10)
        XCTAssertEqual(int8?[0], 123)
        
        let int16: [Int16]? = data.value(for: "int16Transform", with: { (rawValue: String?) -> Int16 in
            guard let value = Int16(rawValue ?? "") else {
                throw OutlawError.typeMismatchWithKey(key: "int16Transform", expected: Int16.self, actual: rawValue ?? "")
            }
            return value
        })
        XCTAssertEqual(int16?.count, 10)
        XCTAssertEqual(int16?[0], 12345)
        
        let int32: [Int32]? = data.value(for: "int32Transform", with: { (rawValue: String?) -> Int32 in
            guard let value = Int32(rawValue ?? "") else {
                throw OutlawError.typeMismatchWithKey(key: "int32Transform", expected: Int32.self, actual: rawValue ?? "")
            }
            return value
        })
        XCTAssertEqual(int32?.count, 10)
        XCTAssertEqual(int32?[0], 12345)
        
        let int64: [Int64]? = data.value(for: "int64Transform", with: { (rawValue: String?) -> Int64 in
            guard let value = Int64(rawValue ?? "") else {
                throw OutlawError.typeMismatchWithKey(key: "int64Transform", expected: Int64.self, actual: rawValue ?? "")
            }
            return value
        })
        XCTAssertEqual(int64?.count, 10)
        XCTAssertEqual(int64?[0], 12345)
        
        let uint: [UInt]? = data.value(for: "uintTransform", with: { (rawValue: String?) -> UInt in
            guard let value = UInt(rawValue ?? "") else {
                throw OutlawError.typeMismatchWithKey(key: "uintTransform", expected: UInt.self, actual: rawValue ?? "")
            }
            return value
        })
        XCTAssertEqual(uint?.count, 10)
        XCTAssertEqual(uint?[0], 12345)
        
        let uint8: [UInt8]? = data.value(for: "uint8Transform", with: { (rawValue: String?) -> UInt8 in
            guard let value = UInt8(rawValue ?? "") else {
                throw OutlawError.typeMismatchWithKey(key: "uint8Transform", expected: UInt8.self, actual: rawValue ?? "")
            }
            return value
        })
        XCTAssertEqual(uint8?.count, 10)
        XCTAssertEqual(uint8?[0], 123)
        
        let uint16: [UInt16]? = data.value(for: "uint16Transform", with: { (rawValue: String?) -> UInt16 in
            guard let value = UInt16(rawValue ?? "") else {
                throw OutlawError.typeMismatchWithKey(key: "uint16Transform", expected: UInt16.self, actual: rawValue ?? "")
            }
            return value
        })
        XCTAssertEqual(uint16?.count, 10)
        XCTAssertEqual(uint16?[0], 12345)
        
        let uint32: [UInt32]? = data.value(for: "uint32Transform", with: { (rawValue: String?) -> UInt32 in
            guard let value = UInt32(rawValue ?? "") else {
                throw OutlawError.typeMismatchWithKey(key: "uint32Transform", expected: UInt32.self, actual: rawValue ?? "")
            }
            return value
        })
        XCTAssertEqual(uint32?.count, 10)
        XCTAssertEqual(uint32?[0], 12345)
        
        let uint64: [UInt64]? = data.value(for: "uint64Transform", with: { (rawValue: String?) -> UInt64 in
            guard let value = UInt64(rawValue ?? "") else {
                throw OutlawError.typeMismatchWithKey(key: "uint64Transform", expected: UInt64.self, actual: rawValue ?? "")
            }
            return value
        })
        XCTAssertEqual(uint64?.count, 10)
        XCTAssertEqual(uint64?[0], 12345)
        
        let url: [URL]? = data.value(for: "urlTransform", with: { (rawValue: String?) -> URL in
            let urlValue = rawValue == "HOMEPAGE" ? "http://molbie.co" : (rawValue ?? "")
            guard let value = URL(string: urlValue) else {
                throw OutlawError.typeMismatchWithKey(key: "urlTransform", expected: URL.self, actual: rawValue ?? "")
            }
            
            return value
        })
        XCTAssertEqual(url?.count, 10)
        XCTAssertEqual(url?[0].absoluteString, "http://molbie.co")
        
        let formatter = shortDateformatter()
        let date: [Date]? = data.value(for: "dateTransform", with: { (rawValue: String?) -> Date in
            let value = rawValue ?? "11/18/2016"
            return formatter.date(from: value)!
        })
        XCTAssertEqual(date?.count, 10)
        XCTAssertEqual(formatShortDate(date![0]), formatShortDate(shortDateForAssert()))
    }
    
// MARK: -
// MARK: Transforms of Optionals
    
    func testTransformValueOfOptionals() {
        let bool: [Bool?] = try! data.value(for: "boolTransform", with: { (rawValue: String) -> Bool? in
            return rawValue == "TRUE"
        })
        XCTAssertEqual(bool.count, 10)
        XCTAssertEqual(bool[0], true)
        
        let string: [String?] = try! data.value(for: "stringTransform", with: { (rawValue: Bool) -> String? in
            return rawValue ? "TRUE" : "FALSE"
        })
        XCTAssertEqual(string.count, 10)
        XCTAssertEqual(string[0], "TRUE")
        
        let character: [Character?] = try! data.value(for: "characterTransform", with: { (rawValue: Bool) -> Character? in
            return rawValue ? "1" : "0"
        })
        XCTAssertEqual(character.count, 10)
        XCTAssertEqual(character[0], "1")
        
        let float: [Float?] = try! data.value(for: "floatTransform", with: { (rawValue: String) -> Float? in
            return rawValue == "PI" ? 3.14 : 0
        })
        XCTAssertEqual(float.count, 10)
        XCTAssertEqual(float[0], 3.14)
        
        let double: [Double?] = try! data.value(for: "doubleTransform", with: { (rawValue: String) -> Double? in
            return rawValue == "PI" ? 3.14 : 0
        })
        XCTAssertEqual(double.count, 10)
        XCTAssertEqual(double[0], 3.14)
        
        let int: [Int?] = try! data.value(for: "intTransform", with: { (rawValue: String) -> Int? in
            guard let value = Int(rawValue) else {
                throw OutlawError.typeMismatchWithKey(key: "intTransform", expected: Int.self, actual: rawValue)
            }
            return value
        })
        XCTAssertEqual(int.count, 10)
        XCTAssertEqual(int[0], 12345)
        
        let int8: [Int8?] = try! data.value(for: "int8Transform", with: { (rawValue: String) -> Int8? in
            guard let value = Int8(rawValue) else {
                throw OutlawError.typeMismatchWithKey(key: "intTransform", expected: Int8.self, actual: rawValue)
            }
            return value
        })
        XCTAssertEqual(int8.count, 10)
        XCTAssertEqual(int8[0], 123)
        
        let int16: [Int16?] = try! data.value(for: "int16Transform", with: { (rawValue: String) -> Int16? in
            guard let value = Int16(rawValue) else {
                throw OutlawError.typeMismatchWithKey(key: "int16Transform", expected: Int16.self, actual: rawValue)
            }
            return value
        })
        XCTAssertEqual(int16.count, 10)
        XCTAssertEqual(int16[0], 12345)
        
        let int32: [Int32?] = try! data.value(for: "int32Transform", with: { (rawValue: String) -> Int32? in
            guard let value = Int32(rawValue) else {
                throw OutlawError.typeMismatchWithKey(key: "int32Transform", expected: Int32.self, actual: rawValue)
            }
            return value
        })
        XCTAssertEqual(int32.count, 10)
        XCTAssertEqual(int32[0], 12345)
        
        let int64: [Int64?] = try! data.value(for: "int64Transform", with: { (rawValue: String) -> Int64? in
            guard let value = Int64(rawValue) else {
                throw OutlawError.typeMismatchWithKey(key: "int64Transform", expected: Int64.self, actual: rawValue)
            }
            return value
        })
        XCTAssertEqual(int64.count, 10)
        XCTAssertEqual(int64[0], 12345)
        
        let uint: [UInt?] = try! data.value(for: "uintTransform", with: { (rawValue: String) -> UInt? in
            guard let value = UInt(rawValue) else {
                throw OutlawError.typeMismatchWithKey(key: "uintTransform", expected: UInt.self, actual: rawValue)
            }
            return value
        })
        XCTAssertEqual(uint.count, 10)
        XCTAssertEqual(uint[0], 12345)
        
        let uint8: [UInt8?] = try! data.value(for: "uint8Transform", with: { (rawValue: String) -> UInt8? in
            guard let value = UInt8(rawValue) else {
                throw OutlawError.typeMismatchWithKey(key: "uintTransform", expected: UInt8.self, actual: rawValue)
            }
            return value
        })
        XCTAssertEqual(uint8.count, 10)
        XCTAssertEqual(uint8[0], 123)
        
        let uint16: [UInt16?] = try! data.value(for: "uint16Transform", with: { (rawValue: String) -> UInt16? in
            guard let value = UInt16(rawValue) else {
                throw OutlawError.typeMismatchWithKey(key: "uint16Transform", expected: UInt16.self, actual: rawValue)
            }
            return value
        })
        XCTAssertEqual(uint16.count, 10)
        XCTAssertEqual(uint16[0], 12345)
        
        let uint32: [UInt32?] = try! data.value(for: "uint32Transform", with: { (rawValue: String) -> UInt32? in
            guard let value = UInt32(rawValue) else {
                throw OutlawError.typeMismatchWithKey(key: "uint32Transform", expected: UInt32.self, actual: rawValue)
            }
            return value
        })
        XCTAssertEqual(uint32.count, 10)
        XCTAssertEqual(uint32[0], 12345)
        
        let uint64: [UInt64?] = try! data.value(for: "uint64Transform", with: { (rawValue: String) -> UInt64? in
            guard let value = UInt64(rawValue) else {
                throw OutlawError.typeMismatchWithKey(key: "uint64Transform", expected: UInt64.self, actual: rawValue)
            }
            return value
        })
        XCTAssertEqual(uint64.count, 10)
        XCTAssertEqual(uint64[0], 12345)
        
        let url: [URL?] = try! data.value(for: "urlTransform", with: { (rawValue: String) -> URL? in
            let urlValue = rawValue == "HOMEPAGE" ? "http://molbie.co" : rawValue
            guard let value = URL(string: urlValue) else {
                throw OutlawError.typeMismatchWithKey(key: "urlTransform", expected: URL.self, actual: rawValue)
            }
            
            return value
        })
        XCTAssertEqual(url.count, 10)
        XCTAssertEqual(url[0]?.absoluteString, "http://molbie.co")
        
        let formatter = shortDateformatter()
        let date: [Date?] = try! data.value(for: "dateTransform", with: { (rawValue: String) -> Date? in
            return formatter.date(from: rawValue)!
        })
        XCTAssertEqual(date.count, 10)
        XCTAssertEqual(formatShortDate(date[0]!), formatShortDate(shortDateForAssert()))
    }
    
    func testOptionalTransformValueOfOptionals() {
        let bool: [Bool?] = try! data.value(for: "boolTransform", with: { (rawValue: String?) -> Bool? in
            return rawValue == "TRUE"
        })
        XCTAssertEqual(bool.count, 10)
        XCTAssertEqual(bool[0], true)
        
        let string: [String?] = try! data.value(for: "stringTransform", with: { (rawValue: Bool?) -> String? in
            guard let rawValue = rawValue else { return "FALSE" }
            return rawValue ? "TRUE" : "FALSE"
        })
        XCTAssertEqual(string.count, 10)
        XCTAssertEqual(string[0], "TRUE")
        
        let character: [Character?] = try! data.value(for: "characterTransform", with: { (rawValue: Bool?) -> Character? in
            guard let rawValue = rawValue else { return "0" }
            return rawValue ? "1" : "0"
        })
        XCTAssertEqual(character.count, 10)
        XCTAssertEqual(character[0], "1")
        
        let float: [Float?] = try! data.value(for: "floatTransform", with: { (rawValue: String?) -> Float? in
            guard let rawValue = rawValue else { return 0 }
            return rawValue == "PI" ? 3.14 : 0
        })
        XCTAssertEqual(float.count, 10)
        XCTAssertEqual(float[0], 3.14)
        
        let double: [Double?] = try! data.value(for: "doubleTransform", with: { (rawValue: String?) -> Double? in
            guard let rawValue = rawValue else { return 0 }
            return rawValue == "PI" ? 3.14 : 0
        })
        XCTAssertEqual(double.count, 10)
        XCTAssertEqual(double[0], 3.14)
        
        let int: [Int?] = try! data.value(for: "intTransform", with: { (rawValue: String?) -> Int? in
            guard let value = Int(rawValue ?? "0") else {
                throw OutlawError.typeMismatchWithKey(key: "intTransform", expected: Int.self, actual: rawValue ?? "nil")
            }
            return value
        })
        XCTAssertEqual(int.count, 10)
        XCTAssertEqual(int[0], 12345)
        
        let int8: [Int8?] = try! data.value(for: "int8Transform", with: { (rawValue: String?) -> Int8? in
            guard let value = Int8(rawValue ?? "0") else {
                throw OutlawError.typeMismatchWithKey(key: "int8Transform", expected: Int8.self, actual: rawValue ?? "nil")
            }
            return value
        })
        XCTAssertEqual(int8.count, 10)
        XCTAssertEqual(int8[0], 123)
        
        let int16: [Int16?] = try! data.value(for: "int16Transform", with: { (rawValue: String?) -> Int16? in
            guard let value = Int16(rawValue ?? "0") else {
                throw OutlawError.typeMismatchWithKey(key: "int16Transform", expected: Int16.self, actual: rawValue ?? "nil")
            }
            return value
        })
        XCTAssertEqual(int16.count, 10)
        XCTAssertEqual(int16[0], 12345)
        
        let int32: [Int32?] = try! data.value(for: "int32Transform", with: { (rawValue: String?) -> Int32? in
            guard let value = Int32(rawValue ?? "0") else {
                throw OutlawError.typeMismatchWithKey(key: "int32Transform", expected: Int32.self, actual: rawValue ?? "nil")
            }
            return value
        })
        XCTAssertEqual(int32.count, 10)
        XCTAssertEqual(int32[0], 12345)
        
        let int64: [Int64?] = try! data.value(for: "intTransform", with: { (rawValue: String?) -> Int64? in
            guard let value = Int64(rawValue ?? "0") else {
                throw OutlawError.typeMismatchWithKey(key: "intTransform", expected: Int64.self, actual: rawValue ?? "nil")
            }
            return value
        })
        XCTAssertEqual(int64.count, 10)
        XCTAssertEqual(int64[0], 12345)
        
        let uint: [UInt?] = try! data.value(for: "uintTransform", with: { (rawValue: String?) -> UInt? in
            guard let value = UInt(rawValue ?? "0") else {
                throw OutlawError.typeMismatchWithKey(key: "uintTransform", expected: UInt.self, actual: rawValue ?? "nil")
            }
            return value
        })
        XCTAssertEqual(uint.count, 10)
        XCTAssertEqual(uint[0], 12345)
        
        let uint8: [UInt8?] = try! data.value(for: "uint8Transform", with: { (rawValue: String?) -> UInt8? in
            guard let value = UInt8(rawValue ?? "0") else {
                throw OutlawError.typeMismatchWithKey(key: "uint8Transform", expected: UInt8.self, actual: rawValue ?? "nil")
            }
            return value
        })
        XCTAssertEqual(uint8.count, 10)
        XCTAssertEqual(uint8[0], 123)
        
        let uint16: [UInt16?] = try! data.value(for: "uint16Transform", with: { (rawValue: String?) -> UInt16? in
            guard let value = UInt16(rawValue ?? "0") else {
                throw OutlawError.typeMismatchWithKey(key: "uint16Transform", expected: UInt16.self, actual: rawValue ?? "nil")
            }
            return value
        })
        XCTAssertEqual(uint16.count, 10)
        XCTAssertEqual(uint16[0], 12345)
        
        let uint32: [UInt32?] = try! data.value(for: "uint32Transform", with: { (rawValue: String?) -> UInt32? in
            guard let value = UInt32(rawValue ?? "0") else {
                throw OutlawError.typeMismatchWithKey(key: "uint32Transform", expected: UInt32.self, actual: rawValue ?? "nil")
            }
            return value
        })
        XCTAssertEqual(uint32.count, 10)
        XCTAssertEqual(uint32[0], 12345)
        
        let uint64: [UInt64?] = try! data.value(for: "uintTransform", with: { (rawValue: String?) -> UInt64? in
            guard let value = UInt64(rawValue ?? "0") else {
                throw OutlawError.typeMismatchWithKey(key: "uintTransform", expected: UInt64.self, actual: rawValue ?? "nil")
            }
            return value
        })
        XCTAssertEqual(uint64.count, 10)
        XCTAssertEqual(uint64[0], 12345)
        
        let url: [URL?] = try! data.value(for: "urlTransform", with: { (rawValue: String?) -> URL? in
            let urlValue = rawValue == "HOMEPAGE" ? "http://molbie.co" : (rawValue ?? "")
            guard let value = URL(string: urlValue) else {
                throw OutlawError.typeMismatchWithKey(key: "urlTransform", expected: URL.self, actual: rawValue ?? "")
            }
            
            return value
        })
        XCTAssertEqual(url.count, 10)
        XCTAssertEqual(url[0]?.absoluteString, "http://molbie.co")
        
        let formatter = shortDateformatter()
        let date: [Date?] = try! data.value(for: "dateTransform", with: { (rawValue: String?) -> Date? in
            guard let dateValue = rawValue else {
                throw OutlawError.typeMismatchWithKey(key: "transform", expected: Date.self, actual: rawValue ?? "")
            }
            
            return formatter.date(from: dateValue)!
        })
        XCTAssertEqual(date.count, 10)
        XCTAssertEqual(formatShortDate(date[0]!), formatShortDate(shortDateForAssert()))
    }
    
    func testTransformOptionalValueOfOptionals() {
        let bool: [Bool?]? = data.value(for: "boolTransform", with: { (rawValue: String) -> Bool? in
            return rawValue == "TRUE"
        })
        XCTAssertEqual(bool?.count, 10)
        XCTAssertEqual(bool?[0], true)
        
        let string: [String?]? = data.value(for: "stringTransform", with: { (rawValue: Bool) -> String? in
            return rawValue ? "TRUE" : "FALSE"
        })
        XCTAssertEqual(string?.count, 10)
        XCTAssertEqual(string?[0], "TRUE")
        
        let character: [Character?]? = data.value(for: "characterTransform", with: { (rawValue: Bool) -> Character? in
            return rawValue ? "1" : "0"
        })
        XCTAssertEqual(character?.count, 10)
        XCTAssertEqual(character?[0], "1")
        
        let float: [Float?]? = data.value(for: "floatTransform", with: { (rawValue: String) -> Float? in
            return rawValue == "PI" ? 3.14 : 0
        })
        XCTAssertEqual(float?.count, 10)
        XCTAssertEqual(float?[0], 3.14)
        
        let double: [Double?]? = data.value(for: "doubleTransform", with: { (rawValue: String) -> Double? in
            return rawValue == "PI" ? 3.14 : 0
        })
        XCTAssertEqual(double?.count, 10)
        XCTAssertEqual(double?[0], 3.14)
        
        let int: [Int?]? = data.value(for: "intTransform", with: { (rawValue: String) -> Int? in
            guard let value = Int(rawValue) else {
                throw OutlawError.typeMismatchWithKey(key: "intTransform", expected: Int.self, actual: rawValue)
            }
            return value
        })
        XCTAssertEqual(int?.count, 10)
        XCTAssertEqual(int?[0], 12345)
        
        let int8: [Int8?]? = data.value(for: "int8Transform", with: { (rawValue: String) -> Int8? in
            guard let value = Int8(rawValue) else {
                throw OutlawError.typeMismatchWithKey(key: "int8Transform", expected: Int8.self, actual: rawValue)
            }
            return value
        })
        XCTAssertEqual(int8?.count, 10)
        XCTAssertEqual(int8?[0], 123)
        
        let int16: [Int16?]? = data.value(for: "int16Transform", with: { (rawValue: String) -> Int16? in
            guard let value = Int16(rawValue) else {
                throw OutlawError.typeMismatchWithKey(key: "int16Transform", expected: Int16.self, actual: rawValue)
            }
            return value
        })
        XCTAssertEqual(int16?.count, 10)
        XCTAssertEqual(int16?[0], 12345)
        
        let int32: [Int32?]? = data.value(for: "int32Transform", with: { (rawValue: String) -> Int32? in
            guard let value = Int32(rawValue) else {
                throw OutlawError.typeMismatchWithKey(key: "int32Transform", expected: Int32.self, actual: rawValue)
            }
            return value
        })
        XCTAssertEqual(int32?.count, 10)
        XCTAssertEqual(int32?[0], 12345)
        
        let int64: [Int64?]? = data.value(for: "int64Transform", with: { (rawValue: String) -> Int64? in
            guard let value = Int64(rawValue) else {
                throw OutlawError.typeMismatchWithKey(key: "int64Transform", expected: Int64.self, actual: rawValue)
            }
            return value
        })
        XCTAssertEqual(int64?.count, 10)
        XCTAssertEqual(int64?[0], 12345)
        
        let uint: [UInt?]? = data.value(for: "uintTransform", with: { (rawValue: String) -> UInt? in
            guard let value = UInt(rawValue) else {
                throw OutlawError.typeMismatchWithKey(key: "uintTransform", expected: UInt.self, actual: rawValue)
            }
            return value
        })
        XCTAssertEqual(uint?.count, 10)
        XCTAssertEqual(uint?[0], 12345)
        
        let uint8: [UInt8?]? = data.value(for: "uint8Transform", with: { (rawValue: String) -> UInt8? in
            guard let value = UInt8(rawValue) else {
                throw OutlawError.typeMismatchWithKey(key: "uint8Transform", expected: UInt8.self, actual: rawValue)
            }
            return value
        })
        XCTAssertEqual(uint8?.count, 10)
        XCTAssertEqual(uint8?[0], 123)
        
        let uint16: [UInt16?]? = data.value(for: "uint16Transform", with: { (rawValue: String) -> UInt16? in
            guard let value = UInt16(rawValue) else {
                throw OutlawError.typeMismatchWithKey(key: "uint16Transform", expected: UInt16.self, actual: rawValue)
            }
            return value
        })
        XCTAssertEqual(uint16?.count, 10)
        XCTAssertEqual(uint16?[0], 12345)
        
        let uint32: [UInt32?]? = data.value(for: "uint32Transform", with: { (rawValue: String) -> UInt32? in
            guard let value = UInt32(rawValue) else {
                throw OutlawError.typeMismatchWithKey(key: "uint32Transform", expected: UInt32.self, actual: rawValue)
            }
            return value
        })
        XCTAssertEqual(uint32?.count, 10)
        XCTAssertEqual(uint32?[0], 12345)
        
        let uint64: [UInt64?]? = data.value(for: "uint64Transform", with: { (rawValue: String) -> UInt64? in
            guard let value = UInt64(rawValue) else {
                throw OutlawError.typeMismatchWithKey(key: "uint64Transform", expected: UInt64.self, actual: rawValue)
            }
            return value
        })
        XCTAssertEqual(uint64?.count, 10)
        XCTAssertEqual(uint64?[0], 12345)
        
        let url: [URL?]? = data.value(for: "urlTransform", with: { (rawValue: String) -> URL? in
            let urlValue = rawValue == "HOMEPAGE" ? "http://molbie.co" : rawValue
            guard let value = URL(string: urlValue) else {
                throw OutlawError.typeMismatchWithKey(key: "urlTransform", expected: URL.self, actual: rawValue)
            }
            
            return value
        })
        XCTAssertEqual(url?.count, 10)
        XCTAssertEqual(url?[0]?.absoluteString, "http://molbie.co")
        
        let formatter = shortDateformatter()
        let date: [Date?]? = data.value(for: "dateTransform", with: { (rawValue: String) -> Date? in
            return formatter.date(from: rawValue)!
        })
        XCTAssertEqual(date?.count, 10)
        XCTAssertEqual(formatShortDate(date![0]!), formatShortDate(shortDateForAssert()))
    }
    
    func testOptionalTransformOptionalValueOfOptionals() {
        let bool: [Bool?]? = data.value(for: "boolTransform", with: { (rawValue: String?) -> Bool? in
            return rawValue == "TRUE"
        })
        XCTAssertEqual(bool?.count, 10)
        XCTAssertEqual(bool?[0], true)
        
        let string: [String?]? = data.value(for: "stringTransform", with: { (rawValue: Bool?) -> String? in
            let value = rawValue ?? false
            return value ? "TRUE" : "FALSE"
        })
        XCTAssertEqual(string?.count, 10)
        XCTAssertEqual(string?[0], "TRUE")
        
        let character: [Character?]? = data.value(for: "characterTransform", with: { (rawValue: Bool?) -> Character? in
            let value = rawValue ?? false
            return value ? "1" : "0"
        })
        XCTAssertEqual(character?.count, 10)
        XCTAssertEqual(character?[0], "1")
        
        let float: [Float?]? = data.value(for: "floatTransform", with: { (rawValue: String?) -> Float? in
            let value = rawValue ?? ""
            return value == "PI" ? 3.14 : 0
        })
        XCTAssertEqual(float?.count, 10)
        XCTAssertEqual(float?[0], 3.14)
        
        let double: [Double?]? = data.value(for: "doubleTransform", with: { (rawValue: String?) -> Double? in
            let value = rawValue ?? ""
            return value == "PI" ? 3.14 : 0
        })
        XCTAssertEqual(double?.count, 10)
        XCTAssertEqual(double?[0], 3.14)
        
        let int: [Int?]? = data.value(for: "intTransform", with: { (rawValue: String?) -> Int? in
            guard let value = Int(rawValue ?? "") else {
                throw OutlawError.typeMismatchWithKey(key: "intTransform", expected: Int.self, actual: rawValue ?? "")
            }
            return value
        })
        XCTAssertEqual(int?.count, 10)
        XCTAssertEqual(int?[0], 12345)
        
        let int8: [Int8?]? = data.value(for: "int8Transform", with: { (rawValue: String?) -> Int8? in
            guard let value = Int8(rawValue ?? "") else {
                throw OutlawError.typeMismatchWithKey(key: "int8Transform", expected: Int8.self, actual: rawValue ?? "")
            }
            return value
        })
        XCTAssertEqual(int8?.count, 10)
        XCTAssertEqual(int8?[0], 123)
        
        let int16: [Int16?]? = data.value(for: "int16Transform", with: { (rawValue: String?) -> Int16? in
            guard let value = Int16(rawValue ?? "") else {
                throw OutlawError.typeMismatchWithKey(key: "int16Transform", expected: Int16.self, actual: rawValue ?? "")
            }
            return value
        })
        XCTAssertEqual(int16?.count, 10)
        XCTAssertEqual(int16?[0], 12345)
        
        let int32: [Int32?]? = data.value(for: "int32Transform", with: { (rawValue: String?) -> Int32? in
            guard let value = Int32(rawValue ?? "") else {
                throw OutlawError.typeMismatchWithKey(key: "int32Transform", expected: Int32.self, actual: rawValue ?? "")
            }
            return value
        })
        XCTAssertEqual(int32?.count, 10)
        XCTAssertEqual(int32?[0], 12345)
        
        let int64: [Int64?]? = data.value(for: "int64Transform", with: { (rawValue: String?) -> Int64? in
            guard let value = Int64(rawValue ?? "") else {
                throw OutlawError.typeMismatchWithKey(key: "int64Transform", expected: Int64.self, actual: rawValue ?? "")
            }
            return value
        })
        XCTAssertEqual(int64?.count, 10)
        XCTAssertEqual(int64?[0], 12345)
        
        let uint: [UInt?]? = data.value(for: "uintTransform", with: { (rawValue: String?) -> UInt? in
            guard let value = UInt(rawValue ?? "") else {
                throw OutlawError.typeMismatchWithKey(key: "uintTransform", expected: UInt.self, actual: rawValue ?? "")
            }
            return value
        })
        XCTAssertEqual(uint?.count, 10)
        XCTAssertEqual(uint?[0], 12345)
        
        let uint8: [UInt8?]? = data.value(for: "uint8Transform", with: { (rawValue: String?) -> UInt8? in
            guard let value = UInt8(rawValue ?? "") else {
                throw OutlawError.typeMismatchWithKey(key: "uint8Transform", expected: UInt8.self, actual: rawValue ?? "")
            }
            return value
        })
        XCTAssertEqual(uint8?.count, 10)
        XCTAssertEqual(uint8?[0], 123)
        
        let uint16: [UInt16?]? = data.value(for: "uint16Transform", with: { (rawValue: String?) -> UInt16? in
            guard let value = UInt16(rawValue ?? "") else {
                throw OutlawError.typeMismatchWithKey(key: "uint16Transform", expected: UInt16.self, actual: rawValue ?? "")
            }
            return value
        })
        XCTAssertEqual(uint16?.count, 10)
        XCTAssertEqual(uint16?[0], 12345)
        
        let uint32: [UInt32?]? = data.value(for: "uint32Transform", with: { (rawValue: String?) -> UInt32? in
            guard let value = UInt32(rawValue ?? "") else {
                throw OutlawError.typeMismatchWithKey(key: "uint32Transform", expected: UInt32.self, actual: rawValue ?? "")
            }
            return value
        })
        XCTAssertEqual(uint32?.count, 10)
        XCTAssertEqual(uint32?[0], 12345)
        
        let uint64: [UInt64?]? = data.value(for: "uint64Transform", with: { (rawValue: String?) -> UInt64? in
            guard let value = UInt64(rawValue ?? "") else {
                throw OutlawError.typeMismatchWithKey(key: "uint64Transform", expected: UInt64.self, actual: rawValue ?? "")
            }
            return value
        })
        XCTAssertEqual(uint64?.count, 10)
        XCTAssertEqual(uint64?[0], 12345)
        
        let url: [URL?]? = data.value(for: "urlTransform", with: { (rawValue: String?) -> URL? in
            let urlValue = rawValue == "HOMEPAGE" ? "http://molbie.co" : (rawValue ?? "")
            guard let value = URL(string: urlValue) else {
                throw OutlawError.typeMismatchWithKey(key: "urlTransform", expected: URL.self, actual: rawValue ?? "")
            }
            
            return value
        })
        XCTAssertEqual(url?.count, 10)
        XCTAssertEqual(url?[0]?.absoluteString, "http://molbie.co")
        
        let formatter = shortDateformatter()
        let date: [Date?]? = data.value(for: "dateTransform", with: { (rawValue: String?) -> Date? in
            let value = rawValue ?? "11/18/2016"
            return formatter.date(from: value)!
        })
        XCTAssertEqual(date?.count, 10)
        XCTAssertEqual(formatShortDate(date![0]!), formatShortDate(shortDateForAssert()))
    }
}
