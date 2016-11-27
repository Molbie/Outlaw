//
//  ArrayTests.swift
//  Outlaw
//
//  Created by Brian Mullen on 11/6/16.
//  Copyright © 2016 Molbie LLC. All rights reserved.
//

import XCTest
@testable import Outlaw


class ArrayTests: OutlawTestCase {
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
    }
    
    func testOptionalKeyNotFound() {
        let value: [Int]? = data.value(for: "keyNotFound")
        XCTAssertNil(value)
    }
    
    func testOptionalTypeMismatch() {
        let value: [Int]? = data.value(for: "object")
        XCTAssertNil(value)
    }
}
