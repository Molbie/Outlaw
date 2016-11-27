//
//  DictionaryTests.swift
//  Outlaw
//
//  Created by Brian Mullen on 11/6/16.
//  Copyright © 2016 Molbie LLC. All rights reserved.
//

import XCTest
@testable import Outlaw


class DictionaryTests: OutlawTestCase {
    func testDictionary() {
        let bool: [String: Bool] = try! data.value(for: "bool")
        XCTAssertEqual(bool["O"], true)
        
        let string: [String: String] = try! data.value(for: "string")
        XCTAssertEqual(string["O"], "Hello, Outlaw!")
        
        let character: [String: Character] = try! data.value(for: "character")
        XCTAssertEqual(character["O"], "O")
        
        let float: [String: Float] = try! data.value(for: "float")
        XCTAssertEqual(float["O"], 3.14)
        
        let double: [String: Double] = try! data.value(for: "double")
        XCTAssertEqual(double["O"], 3.14159265359)
        
        let int: [String: Int] = try! data.value(for: "int")
        XCTAssertEqual(int["O"], -3)
        
        let int8: [String: Int8] = try! data.value(for: "int8")
        XCTAssertEqual(int8["O"], -8)
        
        let int16: [String: Int16] = try! data.value(for: "int16")
        XCTAssertEqual(int16["O"], -16)
        
        let int32: [String: Int32] = try! data.value(for: "int32")
        XCTAssertEqual(int32["O"], -32)
        
        let int64: [String: Int64] = try! data.value(for: "int64")
        XCTAssertEqual(int64["O"], -64)
        
        let uint: [String: UInt] = try! data.value(for: "uint")
        XCTAssertEqual(uint["O"], 3)
        
        let uint8: [String: UInt8] = try! data.value(for: "uint8")
        XCTAssertEqual(uint8["O"], 8)
        
        let uint16: [String: UInt16] = try! data.value(for: "uint16")
        XCTAssertEqual(uint16["O"], 16)
        
        let uint32: [String: UInt32] = try! data.value(for: "uint32")
        XCTAssertEqual(uint32["O"], 32)
        
        let uint64: [String: UInt64] = try! data.value(for: "uint64")
        XCTAssertEqual(uint64["O"], 64)
        
        let array: [String: [String]] = try! data.value(for: "array")
        XCTAssertEqual(array["O"]![0], "O")
        
        let dictionary: [String: [String: String]] = try! data.value(for: "dictionary")
        XCTAssertEqual(dictionary["O"]!["O"]!, "Hello, Outlaw!")
        
        let url: [String: URL] = try! data.value(for: "url")
        XCTAssertEqual(url["O"]?.absoluteString, "https://developer.apple.com/")
    }
    
    func testDictionaryOptionalValue() {
        let bool: [String: Bool?] = try! data.value(for: "bool")
        XCTAssertEqual(bool["O"]!, true)
        
        let string: [String: String?] = try! data.value(for: "string")
        XCTAssertEqual(string["O"]!, "Hello, Outlaw!")
        
        let character: [String: Character?] = try! data.value(for: "character")
        XCTAssertEqual(character["O"]!, "O")
        
        let float: [String: Float?] = try! data.value(for: "float")
        XCTAssertEqual(float["O"]!, 3.14)
        
        let double: [String: Double?] = try! data.value(for: "double")
        XCTAssertEqual(double["O"]!, 3.14159265359)
        
        let int: [String: Int?] = try! data.value(for: "int")
        XCTAssertEqual(int["O"]!, -3)
        
        let int8: [String: Int8?] = try! data.value(for: "int8")
        XCTAssertEqual(int8["O"]!, -8)
        
        let int16: [String: Int16?] = try! data.value(for: "int16")
        XCTAssertEqual(int16["O"]!, -16)
        
        let int32: [String: Int32?] = try! data.value(for: "int32")
        XCTAssertEqual(int32["O"]!, -32)
        
        let int64: [String: Int64?] = try! data.value(for: "int64")
        XCTAssertEqual(int64["O"]!, -64)
        
        let uint: [String: UInt?] = try! data.value(for: "uint")
        XCTAssertEqual(uint["O"]!, 3)
        
        let uint8: [String: UInt8?] = try! data.value(for: "uint8")
        XCTAssertEqual(uint8["O"]!, 8)
        
        let uint16: [String: UInt16?] = try! data.value(for: "uint16")
        XCTAssertEqual(uint16["O"]!, 16)
        
        let uint32: [String: UInt32?] = try! data.value(for: "uint32")
        XCTAssertEqual(uint32["O"]!, 32)
        
        let uint64: [String: UInt64?] = try! data.value(for: "uint64")
        XCTAssertEqual(uint64["O"]!, 64)
        
        let array: [String: [String]?] = try! data.value(for: "array")
        XCTAssertEqual(array["O"]!![0], "O")
        
        let dictionary: [String: [String: String]] = try! data.value(for: "dictionary")
        XCTAssertEqual(dictionary["O"]!["O"]!, "Hello, Outlaw!")
        
        let url: [String: URL?] = try! data.value(for: "url")
        XCTAssertEqual(url["O"]!!.absoluteString, "https://developer.apple.com/")
    }
    
    func testNestedDictionary() {
        let bool: [String: Bool] = try! data.value(for: "object.bool")
        XCTAssertEqual(bool["O"], true)
        
        let string: [String: String] = try! data.value(for: "object.string")
        XCTAssertEqual(string["O"], "Hello, Outlaw!")
        
        let character: [String: Character] = try! data.value(for: "object.character")
        XCTAssertEqual(character["O"], "O")
        
        let float: [String: Float] = try! data.value(for: "object.float")
        XCTAssertEqual(float["O"], 3.14)
        
        let double: [String: Double] = try! data.value(for: "object.double")
        XCTAssertEqual(double["O"], 3.14159265359)
        
        let int: [String: Int] = try! data.value(for: "object.int")
        XCTAssertEqual(int["O"], -3)
        
        let int8: [String: Int8] = try! data.value(for: "object.int8")
        XCTAssertEqual(int8["O"], -8)
        
        let int16: [String: Int16] = try! data.value(for: "object.int16")
        XCTAssertEqual(int16["O"], -16)
        
        let int32: [String: Int32] = try! data.value(for: "object.int32")
        XCTAssertEqual(int32["O"], -32)
        
        let int64: [String: Int64] = try! data.value(for: "object.int64")
        XCTAssertEqual(int64["O"], -64)
        
        let uint: [String: UInt] = try! data.value(for: "object.uint")
        XCTAssertEqual(uint["O"], 3)
        
        let uint8: [String: UInt8] = try! data.value(for: "object.uint8")
        XCTAssertEqual(uint8["O"], 8)
        
        let uint16: [String: UInt16] = try! data.value(for: "object.uint16")
        XCTAssertEqual(uint16["O"], 16)
        
        let uint32: [String: UInt32] = try! data.value(for: "object.uint32")
        XCTAssertEqual(uint32["O"], 32)
        
        let uint64: [String: UInt64] = try! data.value(for: "object.uint64")
        XCTAssertEqual(uint64["O"], 64)
        
        let array: [String: [String]] = try! data.value(for: "object.array")
        XCTAssertEqual(array["O"]![0], "O")
        
        let dictionary: [String: [String: String]] = try! data.value(for: "object.dictionary")
        XCTAssertEqual(dictionary["O"]!["O"]!, "Hello, Outlaw!")
        
        let url: [String: URL] = try! data.value(for: "object.url")
        XCTAssertEqual(url["O"]?.absoluteString, "https://developer.apple.com/")
    }
    
    func testNestedDictionaryOptionalValue() {
        let bool: [String: Bool?] = try! data.value(for: "object.bool")
        XCTAssertEqual(bool["O"]!, true)
        
        let string: [String: String?] = try! data.value(for: "object.string")
        XCTAssertEqual(string["O"]!, "Hello, Outlaw!")
        
        let character: [String: Character?] = try! data.value(for: "object.character")
        XCTAssertEqual(character["O"]!, "O")
        
        let float: [String: Float?] = try! data.value(for: "object.float")
        XCTAssertEqual(float["O"]!, 3.14)
        
        let double: [String: Double?] = try! data.value(for: "object.double")
        XCTAssertEqual(double["O"]!, 3.14159265359)
        
        let int: [String: Int?] = try! data.value(for: "object.int")
        XCTAssertEqual(int["O"]!, -3)
        
        let int8: [String: Int8?] = try! data.value(for: "object.int8")
        XCTAssertEqual(int8["O"]!, -8)
        
        let int16: [String: Int16?] = try! data.value(for: "object.int16")
        XCTAssertEqual(int16["O"]!, -16)
        
        let int32: [String: Int32?] = try! data.value(for: "object.int32")
        XCTAssertEqual(int32["O"]!, -32)
        
        let int64: [String: Int64?] = try! data.value(for: "object.int64")
        XCTAssertEqual(int64["O"]!, -64)
        
        let uint: [String: UInt?] = try! data.value(for: "object.uint")
        XCTAssertEqual(uint["O"]!, 3)
        
        let uint8: [String: UInt8?] = try! data.value(for: "object.uint8")
        XCTAssertEqual(uint8["O"]!, 8)
        
        let uint16: [String: UInt16?] = try! data.value(for: "object.uint16")
        XCTAssertEqual(uint16["O"]!, 16)
        
        let uint32: [String: UInt32?] = try! data.value(for: "object.uint32")
        XCTAssertEqual(uint32["O"]!, 32)
        
        let uint64: [String: UInt64?] = try! data.value(for: "object.uint64")
        XCTAssertEqual(uint64["O"]!, 64)
        
        let array: [String: [String]?] = try! data.value(for: "object.array")
        XCTAssertEqual(array["O"]!![0], "O")
        
        let dictionary: [String: [String: String]?] = try! data.value(for: "object.dictionary")
        XCTAssertEqual(dictionary["O"]!!["O"]!, "Hello, Outlaw!")
        
        let url: [String: URL?] = try! data.value(for: "object.url")
        XCTAssertEqual(url["O"]!!.absoluteString, "https://developer.apple.com/")
    }
    
    func testKeyNotFound() {
        var value: [String: Int] = [:]
        
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
        var value: [String: Int] = [:]
        
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
    
    func testOptionalDictionary() {
        let bool: [String: Bool]? = data.value(for: "bool")
        XCTAssertEqual(bool?["O"], true)
        
        let string: [String: String]? = data.value(for: "string")
        XCTAssertEqual(string?["O"], "Hello, Outlaw!")
        
        let character: [String: Character]? = data.value(for: "character")
        XCTAssertEqual(character?["O"], "O")
        
        let float: [String: Float]? = data.value(for: "float")
        XCTAssertEqual(float?["O"], 3.14)
        
        let double: [String: Double]? = data.value(for: "double")
        XCTAssertEqual(double?["O"], 3.14159265359)
        
        let int: [String: Int]? = data.value(for: "int")
        XCTAssertEqual(int?["O"], -3)
        
        let int8: [String: Int8]? = data.value(for: "int8")
        XCTAssertEqual(int8?["O"], -8)
        
        let int16: [String: Int16]? = data.value(for: "int16")
        XCTAssertEqual(int16?["O"], -16)
        
        let int32: [String: Int32]? = data.value(for: "int32")
        XCTAssertEqual(int32?["O"], -32)
        
        let int64: [String: Int64]? = data.value(for: "int64")
        XCTAssertEqual(int64?["O"], -64)
        
        let uint: [String: UInt]? = data.value(for: "uint")
        XCTAssertEqual(uint?["O"], 3)
        
        let uint8: [String: UInt8]? = data.value(for: "uint8")
        XCTAssertEqual(uint8?["O"], 8)
        
        let uint16: [String: UInt16]? = data.value(for: "uint16")
        XCTAssertEqual(uint16?["O"], 16)
        
        let uint32: [String: UInt32]? = data.value(for: "uint32")
        XCTAssertEqual(uint32?["O"], 32)
        
        let uint64: [String: UInt64]? = data.value(for: "uint64")
        XCTAssertEqual(uint64?["O"], 64)
        
        let array: [String: [String]]? = data.value(for: "array")
        XCTAssertEqual(array?["O"]![0], "O")
        
        let dictionary: [String: [String: String]]? = data.value(for: "dictionary")
        XCTAssertEqual(dictionary?["O"]!["O"]!, "Hello, Outlaw!")
        
        let url: [String: URL]? = data.value(for: "url")
        XCTAssertEqual(url?["O"]?.absoluteString, "https://developer.apple.com/")
    }
    
    func testOptionalDictionaryOptionalValue() {
        let bool: [String: Bool?]? = data.value(for: "bool")
        XCTAssertEqual(bool?["O"]!, true)
        
        let string: [String: String?]? = data.value(for: "string")
        XCTAssertEqual(string?["O"]!, "Hello, Outlaw!")
        
        let character: [String: Character?]? = data.value(for: "character")
        XCTAssertEqual(character?["O"]!, "O")
        
        let float: [String: Float?]? = data.value(for: "float")
        XCTAssertEqual(float?["O"]!, 3.14)
        
        let double: [String: Double?]? = data.value(for: "double")
        XCTAssertEqual(double?["O"]!, 3.14159265359)
        
        let int: [String: Int?]? = data.value(for: "int")
        XCTAssertEqual(int?["O"]!, -3)
        
        let int8: [String: Int8?]? = data.value(for: "int8")
        XCTAssertEqual(int8?["O"]!, -8)
        
        let int16: [String: Int16?]? = data.value(for: "int16")
        XCTAssertEqual(int16?["O"]!, -16)
        
        let int32: [String: Int32?]? = data.value(for: "int32")
        XCTAssertEqual(int32?["O"]!, -32)
        
        let int64: [String: Int64?]? = data.value(for: "int64")
        XCTAssertEqual(int64?["O"]!, -64)
        
        let uint: [String: UInt?]? = data.value(for: "uint")
        XCTAssertEqual(uint?["O"]!, 3)
        
        let uint8: [String: UInt8?]? = data.value(for: "uint8")
        XCTAssertEqual(uint8?["O"]!, 8)
        
        let uint16: [String: UInt16?]? = data.value(for: "uint16")
        XCTAssertEqual(uint16?["O"]!, 16)
        
        let uint32: [String: UInt32?]? = data.value(for: "uint32")
        XCTAssertEqual(uint32?["O"]!, 32)
        
        let uint64: [String: UInt64?]? = data.value(for: "uint64")
        XCTAssertEqual(uint64?["O"]!, 64)
        
        let array: [String: [String]?]? = data.value(for: "array")
        XCTAssertEqual(array?["O"]!![0], "O")
        
        let dictionary: [String: [String: String]?]? = data.value(for: "dictionary")
        XCTAssertEqual(dictionary?["O"]!!["O"]!, "Hello, Outlaw!")
        
        let url: [String: URL?]? = data.value(for: "url")
        XCTAssertEqual(url?["O"]!!.absoluteString, "https://developer.apple.com/")
    }
    
    func testNestedOptionalDictionary() {
        let bool: [String: Bool]? = data.value(for: "object.bool")
        XCTAssertEqual(bool?["O"], true)
        
        let string: [String: String]? = data.value(for: "object.string")
        XCTAssertEqual(string?["O"], "Hello, Outlaw!")
        
        let character: [String: Character]? = data.value(for: "object.character")
        XCTAssertEqual(character?["O"], "O")
        
        let float: [String: Float]? = data.value(for: "object.float")
        XCTAssertEqual(float?["O"], 3.14)
        
        let double: [String: Double]? = data.value(for: "object.double")
        XCTAssertEqual(double?["O"], 3.14159265359)
        
        let int: [String: Int]? = data.value(for: "object.int")
        XCTAssertEqual(int?["O"], -3)
        
        let int8: [String: Int8]? = data.value(for: "object.int8")
        XCTAssertEqual(int8?["O"], -8)
        
        let int16: [String: Int16]? = data.value(for: "object.int16")
        XCTAssertEqual(int16?["O"], -16)
        
        let int32: [String: Int32]? = data.value(for: "object.int32")
        XCTAssertEqual(int32?["O"], -32)
        
        let int64: [String: Int64]? = data.value(for: "object.int64")
        XCTAssertEqual(int64?["O"], -64)
        
        let uint: [String: UInt]? = data.value(for: "object.uint")
        XCTAssertEqual(uint?["O"], 3)
        
        let uint8: [String: UInt8]? = data.value(for: "object.uint8")
        XCTAssertEqual(uint8?["O"], 8)
        
        let uint16: [String: UInt16]? = data.value(for: "object.uint16")
        XCTAssertEqual(uint16?["O"], 16)
        
        let uint32: [String: UInt32]? = data.value(for: "object.uint32")
        XCTAssertEqual(uint32?["O"], 32)
        
        let uint64: [String: UInt64]? = data.value(for: "object.uint64")
        XCTAssertEqual(uint64?["O"], 64)
        
        let array: [String: [String]]? = data.value(for: "object.array")
        XCTAssertEqual(array?["O"]![0], "O")
        
        let dictionary: [String: [String: String]]? = data.value(for: "object.dictionary")
        XCTAssertEqual(dictionary?["O"]!["O"]!, "Hello, Outlaw!")
        
        let url: [String: URL]? = data.value(for: "object.url")
        XCTAssertEqual(url?["O"]?.absoluteString, "https://developer.apple.com/")
    }
    
    func testNestedOptionalDictionaryOptionalValue() {
        let bool: [String: Bool?]? = data.value(for: "object.bool")
        XCTAssertEqual(bool?["O"]!, true)
        
        let string: [String: String?]? = data.value(for: "object.string")
        XCTAssertEqual(string?["O"]!, "Hello, Outlaw!")
        
        let character: [String: Character?]? = data.value(for: "object.character")
        XCTAssertEqual(character?["O"]!, "O")
        
        let float: [String: Float?]? = data.value(for: "object.float")
        XCTAssertEqual(float?["O"]!, 3.14)
        
        let double: [String: Double?]? = data.value(for: "object.double")
        XCTAssertEqual(double?["O"]!, 3.14159265359)
        
        let int: [String: Int?]? = data.value(for: "object.int")
        XCTAssertEqual(int?["O"]!, -3)
        
        let int8: [String: Int8?]? = data.value(for: "object.int8")
        XCTAssertEqual(int8?["O"]!, -8)
        
        let int16: [String: Int16?]? = data.value(for: "object.int16")
        XCTAssertEqual(int16?["O"]!, -16)
        
        let int32: [String: Int32?]? = data.value(for: "object.int32")
        XCTAssertEqual(int32?["O"]!, -32)
        
        let int64: [String: Int64?]? = data.value(for: "object.int64")
        XCTAssertEqual(int64?["O"]!, -64)
        
        let uint: [String: UInt?]? = data.value(for: "object.uint")
        XCTAssertEqual(uint?["O"]!, 3)
        
        let uint8: [String: UInt8?]? = data.value(for: "object.uint8")
        XCTAssertEqual(uint8?["O"]!, 8)
        
        let uint16: [String: UInt16?]? = data.value(for: "object.uint16")
        XCTAssertEqual(uint16?["O"]!, 16)
        
        let uint32: [String: UInt32?]? = data.value(for: "object.uint32")
        XCTAssertEqual(uint32?["O"]!, 32)
        
        let uint64: [String: UInt64?]? = data.value(for: "object.uint64")
        XCTAssertEqual(uint64?["O"]!, 64)
        
        let array: [String: [String]?]? = data.value(for: "object.array")
        XCTAssertEqual(array?["O"]!![0], "O")
        
        let dictionary: [String: [String: String]?]? = data.value(for: "object.dictionary")
        XCTAssertEqual(dictionary?["O"]!!["O"]!, "Hello, Outlaw!")
        
        let url: [String: URL?]? = data.value(for: "object.url")
        XCTAssertEqual(url?["O"]!!.absoluteString, "https://developer.apple.com/")
    }
    
    func testOptionalKeyNotFound() {
        let value: [String: Int]? = data.value(for: "keyNotFound")
        XCTAssertNil(value)
    }
    
    func testOptionalTypeMismatch() {
        let value: [String: Int]? = data.value(for: "object")
        XCTAssertNil(value)
    }
}
