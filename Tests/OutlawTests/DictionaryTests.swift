//
//  DictionaryTests.swift
//  Outlaw
//
//  Created by Brian Mullen on 11/6/16.
//  Copyright © 2016 Molbie LLC. All rights reserved.
//

import XCTest
@testable import Outlaw


class DictionaryTests: OutlawTestCase, DateTesting {
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
        
        let date: [String: Date] = try! data.value(for: "date")
        XCTAssertEqual(formatDate(date["O"]!), formatDate(dateForAssert()))
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
        
        let date: [String: Date?] = try! data.value(for: "date")
        XCTAssertEqual(formatDate(date["O"]!!), formatDate(dateForAssert()))
    }
    
    func testNestedKeysOnDifferentOuterInnerTypes() {
        let data: [String: [String: Any]] = ["property1": ["name": "property1", "value": "value1"], "property2": ["name": "property2", "value": "value2"]]
        let value: String = try! data.value(for: "property1.value")
        
        XCTAssertEqual(value, "value1")
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
        
        let date: [String: Date] = try! data.value(for: "object.date")
        XCTAssertEqual(formatDate(date["O"]!), formatDate(dateForAssert()))
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
        
        let date: [String: Date?] = try! data.value(for: "object.date")
        XCTAssertEqual(formatDate(date["O"]!!), formatDate(dateForAssert()))
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
        
        let date: [String: Date]? = data.value(for: "date")
        XCTAssertEqual(formatDate(date!["O"]!), formatDate(dateForAssert()))
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
        
        let date: [String: Date?]? = data.value(for: "date")
        XCTAssertEqual(formatDate(date!["O"]!!), formatDate(dateForAssert()))
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
        
        let date: [String: Date]? = data.value(for: "object.date")
        XCTAssertEqual(formatDate(date!["O"]!), formatDate(dateForAssert()))
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
        
        let date: [String: Date?]? = data.value(for: "object.date")
        XCTAssertEqual(formatDate(date!["O"]!!), formatDate(dateForAssert()))
    }
    
    func testOptionalKeyNotFound() {
        let value: [String: Int]? = data.value(for: "keyNotFound")
        XCTAssertNil(value)
    }
    
    func testOptionalTypeMismatch() {
        let value: [String: Int]? = data.value(for: "object")
        XCTAssertNil(value)
    }
    
// MARK: -
// MARK: Transforms
    
    func testTransformValue() {
        let bool: [String: Bool] = try! data.value(for: "boolTransform", with: { (rawValue: String) -> Bool in
            return rawValue == "TRUE"
        })
        XCTAssertEqual(bool["O"], true)
        
        let string: [String: String] = try! data.value(for: "stringTransform", with: { (rawValue: Bool) -> String in
            return rawValue ? "TRUE" : "FALSE"
        })
        XCTAssertEqual(string["O"], "TRUE")
        
        let character: [String: Character] = try! data.value(for: "characterTransform", with: { (rawValue: Bool) -> Character in
            return rawValue ? "1" : "0"
        })
        XCTAssertEqual(character["O"], "1")
        
        let float: [String: Float] = try! data.value(for: "floatTransform", with: { (rawValue: String) -> Float in
            return rawValue == "PI" ? 3.14 : 0
        })
        XCTAssertEqual(float["O"], 3.14)
        
        let double: [String: Double] = try! data.value(for: "doubleTransform", with: { (rawValue: String) -> Double in
            return rawValue == "PI" ? 3.14 : 0
        })
        XCTAssertEqual(double["O"], 3.14)
        
        let int: [String: Int] = try! data.value(for: "intTransform", with: { (rawValue: String) -> Int in
            guard let value = Int(rawValue) else {
                throw OutlawError.typeMismatchWithKey(key: "intTransform", expected: Int.self, actual: rawValue)
            }
            return value
        })
        XCTAssertEqual(int["O"], 12345)
        
        let int8: [String: Int8] = try! data.value(for: "int8Transform", with: { (rawValue: String) -> Int8 in
            guard let value = Int8(rawValue) else {
                throw OutlawError.typeMismatchWithKey(key: "intTransform", expected: Int8.self, actual: rawValue)
            }
            return value
        })
        XCTAssertEqual(int8["O"], 123)
        
        let int16: [String: Int16] = try! data.value(for: "int16Transform", with: { (rawValue: String) -> Int16 in
            guard let value = Int16(rawValue) else {
                throw OutlawError.typeMismatchWithKey(key: "int16Transform", expected: Int16.self, actual: rawValue)
            }
            return value
        })
        XCTAssertEqual(int16["O"], 12345)
        
        let int32: [String: Int32] = try! data.value(for: "int32Transform", with: { (rawValue: String) -> Int32 in
            guard let value = Int32(rawValue) else {
                throw OutlawError.typeMismatchWithKey(key: "int32Transform", expected: Int32.self, actual: rawValue)
            }
            return value
        })
        XCTAssertEqual(int32["O"], 12345)
        
        let int64: [String: Int64] = try! data.value(for: "int64Transform", with: { (rawValue: String) -> Int64 in
            guard let value = Int64(rawValue) else {
                throw OutlawError.typeMismatchWithKey(key: "int64Transform", expected: Int64.self, actual: rawValue)
            }
            return value
        })
        XCTAssertEqual(int64["O"], 12345)
        
        let uint: [String: UInt] = try! data.value(for: "uintTransform", with: { (rawValue: String) -> UInt in
            guard let value = UInt(rawValue) else {
                throw OutlawError.typeMismatchWithKey(key: "uintTransform", expected: UInt.self, actual: rawValue)
            }
            return value
        })
        XCTAssertEqual(uint["O"], 12345)
        
        let uint8: [String: UInt8] = try! data.value(for: "uint8Transform", with: { (rawValue: String) -> UInt8 in
            guard let value = UInt8(rawValue) else {
                throw OutlawError.typeMismatchWithKey(key: "uintTransform", expected: UInt8.self, actual: rawValue)
            }
            return value
        })
        XCTAssertEqual(uint8["O"], 123)
        
        let uint16: [String: UInt16] = try! data.value(for: "uint16Transform", with: { (rawValue: String) -> UInt16 in
            guard let value = UInt16(rawValue) else {
                throw OutlawError.typeMismatchWithKey(key: "uint16Transform", expected: UInt16.self, actual: rawValue)
            }
            return value
        })
        XCTAssertEqual(uint16["O"], 12345)
        
        let uint32: [String: UInt32] = try! data.value(for: "uint32Transform", with: { (rawValue: String) -> UInt32 in
            guard let value = UInt32(rawValue) else {
                throw OutlawError.typeMismatchWithKey(key: "uint32Transform", expected: UInt32.self, actual: rawValue)
            }
            return value
        })
        XCTAssertEqual(uint32["O"], 12345)
        
        let uint64: [String: UInt64] = try! data.value(for: "uint64Transform", with: { (rawValue: String) -> UInt64 in
            guard let value = UInt64(rawValue) else {
                throw OutlawError.typeMismatchWithKey(key: "uint64Transform", expected: UInt64.self, actual: rawValue)
            }
            return value
        })
        XCTAssertEqual(uint64["O"], 12345)
        
        let url: [String: URL] = try! data.value(for: "urlTransform", with: { (rawValue: String) -> URL in
            let urlValue = rawValue == "HOMEPAGE" ? "http://molbie.co" : rawValue
            guard let value = URL(string: urlValue) else {
                throw OutlawError.typeMismatchWithKey(key: "urlTransform", expected: URL.self, actual: rawValue)
            }
            
            return value
        })
        XCTAssertEqual(url["O"]?.absoluteString, "http://molbie.co")
        
        let formatter = shortDateformatter()
        let date: [String: Date] = try! data.value(for: "dateTransform", with: { (rawValue: String) -> Date in
            return formatter.date(from: rawValue)!
        })
        XCTAssertEqual(formatShortDate(date["O"]!), formatShortDate(shortDateForAssert()))
    }
    
    func testOptionalTransformValue() {
        let bool: [String: Bool] = try! data.value(for: "boolTransform", with: { (rawValue: String?) -> Bool in
            return rawValue == "TRUE"
        })
        XCTAssertEqual(bool["O"], true)
        
        let string: [String: String] = try! data.value(for: "stringTransform", with: { (rawValue: Bool?) -> String in
            guard let rawValue = rawValue else { return "FALSE" }
            return rawValue ? "TRUE" : "FALSE"
        })
        XCTAssertEqual(string["O"], "TRUE")
        
        let character: [String: Character] = try! data.value(for: "characterTransform", with: { (rawValue: Bool?) -> Character in
            guard let rawValue = rawValue else { return "0" }
            return rawValue ? "1" : "0"
        })
        XCTAssertEqual(character["O"], "1")
        
        let float: [String: Float] = try! data.value(for: "floatTransform", with: { (rawValue: String?) -> Float in
            guard let rawValue = rawValue else { return 0 }
            return rawValue == "PI" ? 3.14 : 0
        })
        XCTAssertEqual(float["O"], 3.14)
        
        let double: [String: Double] = try! data.value(for: "doubleTransform", with: { (rawValue: String?) -> Double in
            guard let rawValue = rawValue else { return 0 }
            return rawValue == "PI" ? 3.14 : 0
        })
        XCTAssertEqual(double["O"], 3.14)
        
        let int: [String: Int] = try! data.value(for: "intTransform", with: { (rawValue: String?) -> Int in
            guard let value = Int(rawValue ?? "0") else {
                throw OutlawError.typeMismatchWithKey(key: "intTransform", expected: Int.self, actual: rawValue ?? "nil")
            }
            return value
        })
        XCTAssertEqual(int["O"], 12345)
        
        let int8: [String: Int8] = try! data.value(for: "int8Transform", with: { (rawValue: String?) -> Int8 in
            guard let value = Int8(rawValue ?? "0") else {
                throw OutlawError.typeMismatchWithKey(key: "int8Transform", expected: Int8.self, actual: rawValue ?? "nil")
            }
            return value
        })
        XCTAssertEqual(int8["O"], 123)
        
        let int16: [String: Int16] = try! data.value(for: "int16Transform", with: { (rawValue: String?) -> Int16 in
            guard let value = Int16(rawValue ?? "0") else {
                throw OutlawError.typeMismatchWithKey(key: "int16Transform", expected: Int16.self, actual: rawValue ?? "nil")
            }
            return value
        })
        XCTAssertEqual(int16["O"], 12345)
        
        let int32: [String: Int32] = try! data.value(for: "int32Transform", with: { (rawValue: String?) -> Int32 in
            guard let value = Int32(rawValue ?? "0") else {
                throw OutlawError.typeMismatchWithKey(key: "int32Transform", expected: Int32.self, actual: rawValue ?? "nil")
            }
            return value
        })
        XCTAssertEqual(int32["O"], 12345)
        
        let int64: [String: Int64] = try! data.value(for: "intTransform", with: { (rawValue: String?) -> Int64 in
            guard let value = Int64(rawValue ?? "0") else {
                throw OutlawError.typeMismatchWithKey(key: "intTransform", expected: Int64.self, actual: rawValue ?? "nil")
            }
            return value
        })
        XCTAssertEqual(int64["O"], 12345)
        
        let uint: [String: UInt] = try! data.value(for: "uintTransform", with: { (rawValue: String?) -> UInt in
            guard let value = UInt(rawValue ?? "0") else {
                throw OutlawError.typeMismatchWithKey(key: "uintTransform", expected: UInt.self, actual: rawValue ?? "nil")
            }
            return value
        })
        XCTAssertEqual(uint["O"], 12345)
        
        let uint8: [String: UInt8] = try! data.value(for: "uint8Transform", with: { (rawValue: String?) -> UInt8 in
            guard let value = UInt8(rawValue ?? "0") else {
                throw OutlawError.typeMismatchWithKey(key: "uint8Transform", expected: UInt8.self, actual: rawValue ?? "nil")
            }
            return value
        })
        XCTAssertEqual(uint8["O"], 123)
        
        let uint16: [String: UInt16] = try! data.value(for: "uint16Transform", with: { (rawValue: String?) -> UInt16 in
            guard let value = UInt16(rawValue ?? "0") else {
                throw OutlawError.typeMismatchWithKey(key: "uint16Transform", expected: UInt16.self, actual: rawValue ?? "nil")
            }
            return value
        })
        XCTAssertEqual(uint16["O"], 12345)
        
        let uint32: [String: UInt32] = try! data.value(for: "uint32Transform", with: { (rawValue: String?) -> UInt32 in
            guard let value = UInt32(rawValue ?? "0") else {
                throw OutlawError.typeMismatchWithKey(key: "uint32Transform", expected: UInt32.self, actual: rawValue ?? "nil")
            }
            return value
        })
        XCTAssertEqual(uint32["O"], 12345)
        
        let uint64: [String: UInt64] = try! data.value(for: "uintTransform", with: { (rawValue: String?) -> UInt64 in
            guard let value = UInt64(rawValue ?? "0") else {
                throw OutlawError.typeMismatchWithKey(key: "uintTransform", expected: UInt64.self, actual: rawValue ?? "nil")
            }
            return value
        })
        XCTAssertEqual(uint64["O"], 12345)
        
        let url: [String: URL] = try! data.value(for: "urlTransform", with: { (rawValue: String?) -> URL in
            let urlValue = rawValue == "HOMEPAGE" ? "http://molbie.co" : (rawValue ?? "")
            guard let value = URL(string: urlValue) else {
                throw OutlawError.typeMismatchWithKey(key: "urlTransform", expected: URL.self, actual: rawValue ?? "")
            }
            
            return value
        })
        XCTAssertEqual(url["O"]?.absoluteString, "http://molbie.co")
        
        let formatter = shortDateformatter()
        let date: [String: Date] = try! data.value(for: "dateTransform", with: { (rawValue: String?) -> Date in
            guard let dateValue = rawValue else {
                throw OutlawError.typeMismatchWithKey(key: "transform", expected: Date.self, actual: rawValue ?? "")
            }
            
            return formatter.date(from: dateValue)!
        })
        XCTAssertEqual(formatShortDate(date["O"]!), formatShortDate(shortDateForAssert()))
    }
    
    func testTransformOptionalValue() {
        let bool: [String: Bool]? = data.value(for: "boolTransform", with: { (rawValue: String) -> Bool in
            return rawValue == "TRUE"
        })
        XCTAssertEqual(bool?["O"], true)
        
        let string: [String: String]? = data.value(for: "stringTransform", with: { (rawValue: Bool) -> String in
            return rawValue ? "TRUE" : "FALSE"
        })
        XCTAssertEqual(string?["O"], "TRUE")
        
        let character: [String: Character]? = data.value(for: "characterTransform", with: { (rawValue: Bool) -> Character in
            return rawValue ? "1" : "0"
        })
        XCTAssertEqual(character?["O"], "1")
        
        let float: [String: Float]? = data.value(for: "floatTransform", with: { (rawValue: String) -> Float in
            return rawValue == "PI" ? 3.14 : 0
        })
        XCTAssertEqual(float?["O"], 3.14)
        
        let double: [String: Double]? = data.value(for: "doubleTransform", with: { (rawValue: String) -> Double in
            return rawValue == "PI" ? 3.14 : 0
        })
        XCTAssertEqual(double?["O"], 3.14)
        
        let int: [String: Int]? = data.value(for: "intTransform", with: { (rawValue: String) -> Int in
            guard let value = Int(rawValue) else {
                throw OutlawError.typeMismatchWithKey(key: "intTransform", expected: Int.self, actual: rawValue)
            }
            return value
        })
        XCTAssertEqual(int?["O"], 12345)
        
        let int8: [String: Int8]? = data.value(for: "int8Transform", with: { (rawValue: String) -> Int8 in
            guard let value = Int8(rawValue) else {
                throw OutlawError.typeMismatchWithKey(key: "int8Transform", expected: Int8.self, actual: rawValue)
            }
            return value
        })
        XCTAssertEqual(int8?["O"], 123)
        
        let int16: [String: Int16]? = data.value(for: "int16Transform", with: { (rawValue: String) -> Int16 in
            guard let value = Int16(rawValue) else {
                throw OutlawError.typeMismatchWithKey(key: "int16Transform", expected: Int16.self, actual: rawValue)
            }
            return value
        })
        XCTAssertEqual(int16?["O"], 12345)
        
        let int32: [String: Int32]? = data.value(for: "int32Transform", with: { (rawValue: String) -> Int32 in
            guard let value = Int32(rawValue) else {
                throw OutlawError.typeMismatchWithKey(key: "int32Transform", expected: Int32.self, actual: rawValue)
            }
            return value
        })
        XCTAssertEqual(int32?["O"], 12345)
        
        let int64: [String: Int64]? = data.value(for: "int64Transform", with: { (rawValue: String) -> Int64 in
            guard let value = Int64(rawValue) else {
                throw OutlawError.typeMismatchWithKey(key: "int64Transform", expected: Int64.self, actual: rawValue)
            }
            return value
        })
        XCTAssertEqual(int64?["O"], 12345)
        
        let uint: [String: UInt]? = data.value(for: "uintTransform", with: { (rawValue: String) -> UInt in
            guard let value = UInt(rawValue) else {
                throw OutlawError.typeMismatchWithKey(key: "uintTransform", expected: UInt.self, actual: rawValue)
            }
            return value
        })
        XCTAssertEqual(uint?["O"], 12345)
        
        let uint8: [String: UInt8]? = data.value(for: "uint8Transform", with: { (rawValue: String) -> UInt8 in
            guard let value = UInt8(rawValue) else {
                throw OutlawError.typeMismatchWithKey(key: "uint8Transform", expected: UInt8.self, actual: rawValue)
            }
            return value
        })
        XCTAssertEqual(uint8?["O"], 123)
        
        let uint16: [String: UInt16]? = data.value(for: "uint16Transform", with: { (rawValue: String) -> UInt16 in
            guard let value = UInt16(rawValue) else {
                throw OutlawError.typeMismatchWithKey(key: "uint16Transform", expected: UInt16.self, actual: rawValue)
            }
            return value
        })
        XCTAssertEqual(uint16?["O"], 12345)
        
        let uint32: [String: UInt32]? = data.value(for: "uint32Transform", with: { (rawValue: String) -> UInt32 in
            guard let value = UInt32(rawValue) else {
                throw OutlawError.typeMismatchWithKey(key: "uint32Transform", expected: UInt32.self, actual: rawValue)
            }
            return value
        })
        XCTAssertEqual(uint32?["O"], 12345)
        
        let uint64: [String: UInt64]? = data.value(for: "uint64Transform", with: { (rawValue: String) -> UInt64 in
            guard let value = UInt64(rawValue) else {
                throw OutlawError.typeMismatchWithKey(key: "uint64Transform", expected: UInt64.self, actual: rawValue)
            }
            return value
        })
        XCTAssertEqual(uint64?["O"], 12345)
        
        let url: [String: URL]? = data.value(for: "urlTransform", with: { (rawValue: String) -> URL in
            let urlValue = rawValue == "HOMEPAGE" ? "http://molbie.co" : rawValue
            guard let value = URL(string: urlValue) else {
                throw OutlawError.typeMismatchWithKey(key: "urlTransform", expected: URL.self, actual: rawValue)
            }
            
            return value
        })
        XCTAssertEqual(url?["O"]?.absoluteString, "http://molbie.co")
        
        let formatter = shortDateformatter()
        let date: [String: Date]? = data.value(for: "dateTransform", with: { (rawValue: String) -> Date in
            return formatter.date(from: rawValue)!
        })
        XCTAssertEqual(formatShortDate(date!["O"]!), formatShortDate(shortDateForAssert()))
    }
    
    func testOptionalTransformOptionalValue() {
        let bool: [String: Bool]? = data.value(for: "boolTransform", with: { (rawValue: String?) -> Bool in
            return rawValue == "TRUE"
        })
        XCTAssertEqual(bool?["O"], true)
        
        let string: [String: String]? = data.value(for: "stringTransform", with: { (rawValue: Bool?) -> String in
            let value = rawValue ?? false
            return value ? "TRUE" : "FALSE"
        })
        XCTAssertEqual(string?["O"], "TRUE")
        
        let character: [String: Character]? = data.value(for: "characterTransform", with: { (rawValue: Bool?) -> Character in
            let value = rawValue ?? false
            return value ? "1" : "0"
        })
        XCTAssertEqual(character?["O"], "1")
        
        let float: [String: Float]? = data.value(for: "floatTransform", with: { (rawValue: String?) -> Float in
            let value = rawValue ?? ""
            return value == "PI" ? 3.14 : 0
        })
        XCTAssertEqual(float?["O"], 3.14)
        
        let double: [String: Double]? = data.value(for: "doubleTransform", with: { (rawValue: String?) -> Double in
            let value = rawValue ?? ""
            return value == "PI" ? 3.14 : 0
        })
        XCTAssertEqual(double?["O"], 3.14)
        
        let int: [String: Int]? = data.value(for: "intTransform", with: { (rawValue: String?) -> Int in
            guard let value = Int(rawValue ?? "") else {
                throw OutlawError.typeMismatchWithKey(key: "intTransform", expected: Int.self, actual: rawValue ?? "")
            }
            return value
        })
        XCTAssertEqual(int?["O"], 12345)
        
        let int8: [String: Int8]? = data.value(for: "int8Transform", with: { (rawValue: String?) -> Int8 in
            guard let value = Int8(rawValue ?? "") else {
                throw OutlawError.typeMismatchWithKey(key: "int8Transform", expected: Int8.self, actual: rawValue ?? "")
            }
            return value
        })
        XCTAssertEqual(int8?["O"], 123)
        
        let int16: [String: Int16]? = data.value(for: "int16Transform", with: { (rawValue: String?) -> Int16 in
            guard let value = Int16(rawValue ?? "") else {
                throw OutlawError.typeMismatchWithKey(key: "int16Transform", expected: Int16.self, actual: rawValue ?? "")
            }
            return value
        })
        XCTAssertEqual(int16?["O"], 12345)
        
        let int32: [String: Int32]? = data.value(for: "int32Transform", with: { (rawValue: String?) -> Int32 in
            guard let value = Int32(rawValue ?? "") else {
                throw OutlawError.typeMismatchWithKey(key: "int32Transform", expected: Int32.self, actual: rawValue ?? "")
            }
            return value
        })
        XCTAssertEqual(int32?["O"], 12345)
        
        let int64: [String: Int64]? = data.value(for: "int64Transform", with: { (rawValue: String?) -> Int64 in
            guard let value = Int64(rawValue ?? "") else {
                throw OutlawError.typeMismatchWithKey(key: "int64Transform", expected: Int64.self, actual: rawValue ?? "")
            }
            return value
        })
        XCTAssertEqual(int64?["O"], 12345)
        
        let uint: [String: UInt]? = data.value(for: "uintTransform", with: { (rawValue: String?) -> UInt in
            guard let value = UInt(rawValue ?? "") else {
                throw OutlawError.typeMismatchWithKey(key: "uintTransform", expected: UInt.self, actual: rawValue ?? "")
            }
            return value
        })
        XCTAssertEqual(uint?["O"], 12345)
        
        let uint8: [String: UInt8]? = data.value(for: "uint8Transform", with: { (rawValue: String?) -> UInt8 in
            guard let value = UInt8(rawValue ?? "") else {
                throw OutlawError.typeMismatchWithKey(key: "uint8Transform", expected: UInt8.self, actual: rawValue ?? "")
            }
            return value
        })
        XCTAssertEqual(uint8?["O"], 123)
        
        let uint16: [String: UInt16]? = data.value(for: "uint16Transform", with: { (rawValue: String?) -> UInt16 in
            guard let value = UInt16(rawValue ?? "") else {
                throw OutlawError.typeMismatchWithKey(key: "uint16Transform", expected: UInt16.self, actual: rawValue ?? "")
            }
            return value
        })
        XCTAssertEqual(uint16?["O"], 12345)
        
        let uint32: [String: UInt32]? = data.value(for: "uint32Transform", with: { (rawValue: String?) -> UInt32 in
            guard let value = UInt32(rawValue ?? "") else {
                throw OutlawError.typeMismatchWithKey(key: "uint32Transform", expected: UInt32.self, actual: rawValue ?? "")
            }
            return value
        })
        XCTAssertEqual(uint32?["O"], 12345)
        
        let uint64: [String: UInt64]? = data.value(for: "uint64Transform", with: { (rawValue: String?) -> UInt64 in
            guard let value = UInt64(rawValue ?? "") else {
                throw OutlawError.typeMismatchWithKey(key: "uint64Transform", expected: UInt64.self, actual: rawValue ?? "")
            }
            return value
        })
        XCTAssertEqual(uint64?["O"], 12345)
        
        let url: [String: URL]? = data.value(for: "urlTransform", with: { (rawValue: String?) -> URL in
            let urlValue = rawValue == "HOMEPAGE" ? "http://molbie.co" : (rawValue ?? "")
            guard let value = URL(string: urlValue) else {
                throw OutlawError.typeMismatchWithKey(key: "urlTransform", expected: URL.self, actual: rawValue ?? "")
            }
            
            return value
        })
        XCTAssertEqual(url?["O"]?.absoluteString, "http://molbie.co")
        
        let formatter = shortDateformatter()
        let date: [String: Date]? = data.value(for: "dateTransform", with: { (rawValue: String?) -> Date in
            let value = rawValue ?? "11/18/2016"
            return formatter.date(from: value)!
        })
        XCTAssertEqual(formatShortDate(date!["O"]!), formatShortDate(shortDateForAssert()))
    }
    
// MARK: -
// MARK: Transforms of Optionals
    
    func testTransformValueOfOptionals() {
        let bool: [String: Bool?] = try! data.value(for: "boolTransform", with: { (rawValue: String) -> Bool? in
            return rawValue == "TRUE"
        })
        XCTAssertEqual(bool["O"]!, true)
        
        let string: [String: String?] = try! data.value(for: "stringTransform", with: { (rawValue: Bool) -> String? in
            return rawValue ? "TRUE" : "FALSE"
        })
        XCTAssertEqual(string["O"]!, "TRUE")
        
        let character: [String: Character?] = try! data.value(for: "characterTransform", with: { (rawValue: Bool) -> Character? in
            return rawValue ? "1" : "0"
        })
        XCTAssertEqual(character["O"]!, "1")
        
        let float: [String: Float?] = try! data.value(for: "floatTransform", with: { (rawValue: String) -> Float? in
            return rawValue == "PI" ? 3.14 : 0
        })
        XCTAssertEqual(float["O"]!, 3.14)
        
        let double: [String: Double?] = try! data.value(for: "doubleTransform", with: { (rawValue: String) -> Double? in
            return rawValue == "PI" ? 3.14 : 0
        })
        XCTAssertEqual(double["O"]!, 3.14)
        
        let int: [String: Int?] = try! data.value(for: "intTransform", with: { (rawValue: String) -> Int? in
            guard let value = Int(rawValue) else {
                throw OutlawError.typeMismatchWithKey(key: "intTransform", expected: Int.self, actual: rawValue)
            }
            return value
        })
        XCTAssertEqual(int["O"]!, 12345)
        
        let int8: [String: Int8?] = try! data.value(for: "int8Transform", with: { (rawValue: String) -> Int8? in
            guard let value = Int8(rawValue) else {
                throw OutlawError.typeMismatchWithKey(key: "intTransform", expected: Int8.self, actual: rawValue)
            }
            return value
        })
        XCTAssertEqual(int8["O"]!, 123)
        
        let int16: [String: Int16?] = try! data.value(for: "int16Transform", with: { (rawValue: String) -> Int16? in
            guard let value = Int16(rawValue) else {
                throw OutlawError.typeMismatchWithKey(key: "int16Transform", expected: Int16.self, actual: rawValue)
            }
            return value
        })
        XCTAssertEqual(int16["O"]!, 12345)
        
        let int32: [String: Int32?] = try! data.value(for: "int32Transform", with: { (rawValue: String) -> Int32? in
            guard let value = Int32(rawValue) else {
                throw OutlawError.typeMismatchWithKey(key: "int32Transform", expected: Int32.self, actual: rawValue)
            }
            return value
        })
        XCTAssertEqual(int32["O"]!, 12345)
        
        let int64: [String: Int64?] = try! data.value(for: "int64Transform", with: { (rawValue: String) -> Int64? in
            guard let value = Int64(rawValue) else {
                throw OutlawError.typeMismatchWithKey(key: "int64Transform", expected: Int64.self, actual: rawValue)
            }
            return value
        })
        XCTAssertEqual(int64["O"]!, 12345)
        
        let uint: [String: UInt?] = try! data.value(for: "uintTransform", with: { (rawValue: String) -> UInt? in
            guard let value = UInt(rawValue) else {
                throw OutlawError.typeMismatchWithKey(key: "uintTransform", expected: UInt.self, actual: rawValue)
            }
            return value
        })
        XCTAssertEqual(uint["O"]!, 12345)
        
        let uint8: [String: UInt8?] = try! data.value(for: "uint8Transform", with: { (rawValue: String) -> UInt8? in
            guard let value = UInt8(rawValue) else {
                throw OutlawError.typeMismatchWithKey(key: "uintTransform", expected: UInt8.self, actual: rawValue)
            }
            return value
        })
        XCTAssertEqual(uint8["O"]!, 123)
        
        let uint16: [String: UInt16?] = try! data.value(for: "uint16Transform", with: { (rawValue: String) -> UInt16? in
            guard let value = UInt16(rawValue) else {
                throw OutlawError.typeMismatchWithKey(key: "uint16Transform", expected: UInt16.self, actual: rawValue)
            }
            return value
        })
        XCTAssertEqual(uint16["O"]!, 12345)
        
        let uint32: [String: UInt32?] = try! data.value(for: "uint32Transform", with: { (rawValue: String) -> UInt32? in
            guard let value = UInt32(rawValue) else {
                throw OutlawError.typeMismatchWithKey(key: "uint32Transform", expected: UInt32.self, actual: rawValue)
            }
            return value
        })
        XCTAssertEqual(uint32["O"]!, 12345)
        
        let uint64: [String: UInt64?] = try! data.value(for: "uint64Transform", with: { (rawValue: String) -> UInt64? in
            guard let value = UInt64(rawValue) else {
                throw OutlawError.typeMismatchWithKey(key: "uint64Transform", expected: UInt64.self, actual: rawValue)
            }
            return value
        })
        XCTAssertEqual(uint64["O"]!, 12345)
        
        let url: [String: URL?] = try! data.value(for: "urlTransform", with: { (rawValue: String) -> URL? in
            let urlValue = rawValue == "HOMEPAGE" ? "http://molbie.co" : rawValue
            guard let value = URL(string: urlValue) else {
                throw OutlawError.typeMismatchWithKey(key: "urlTransform", expected: URL.self, actual: rawValue)
            }
            
            return value
        })
        XCTAssertEqual(url["O"]!?.absoluteString, "http://molbie.co")
        
        let formatter = shortDateformatter()
        let date: [String: Date?] = try! data.value(for: "dateTransform", with: { (rawValue: String) -> Date? in
            return formatter.date(from: rawValue)!
        })
        XCTAssertEqual(formatShortDate(date["O"]!!), formatShortDate(shortDateForAssert()))
    }
    
    func testOptionalTransformValueOfOptionals() {
        let bool: [String: Bool?] = try! data.value(for: "boolTransform", with: { (rawValue: String?) -> Bool? in
            return rawValue == "TRUE"
        })
        XCTAssertEqual(bool["O"]!, true)
        
        let string: [String: String?] = try! data.value(for: "stringTransform", with: { (rawValue: Bool?) -> String? in
            guard let rawValue = rawValue else { return "FALSE" }
            return rawValue ? "TRUE" : "FALSE"
        })
        XCTAssertEqual(string["O"]!, "TRUE")
        
        let character: [String: Character?] = try! data.value(for: "characterTransform", with: { (rawValue: Bool?) -> Character? in
            guard let rawValue = rawValue else { return "0" }
            return rawValue ? "1" : "0"
        })
        XCTAssertEqual(character["O"]!, "1")
        
        let float: [String: Float?] = try! data.value(for: "floatTransform", with: { (rawValue: String?) -> Float? in
            guard let rawValue = rawValue else { return 0 }
            return rawValue == "PI" ? 3.14 : 0
        })
        XCTAssertEqual(float["O"]!, 3.14)
        
        let double: [String: Double?] = try! data.value(for: "doubleTransform", with: { (rawValue: String?) -> Double? in
            guard let rawValue = rawValue else { return 0 }
            return rawValue == "PI" ? 3.14 : 0
        })
        XCTAssertEqual(double["O"]!, 3.14)
        
        let int: [String: Int?] = try! data.value(for: "intTransform", with: { (rawValue: String?) -> Int? in
            guard let value = Int(rawValue ?? "0") else {
                throw OutlawError.typeMismatchWithKey(key: "intTransform", expected: Int.self, actual: rawValue ?? "nil")
            }
            return value
        })
        XCTAssertEqual(int["O"]!, 12345)
        
        let int8: [String: Int8?] = try! data.value(for: "int8Transform", with: { (rawValue: String?) -> Int8? in
            guard let value = Int8(rawValue ?? "0") else {
                throw OutlawError.typeMismatchWithKey(key: "int8Transform", expected: Int8.self, actual: rawValue ?? "nil")
            }
            return value
        })
        XCTAssertEqual(int8["O"]!, 123)
        
        let int16: [String: Int16?] = try! data.value(for: "int16Transform", with: { (rawValue: String?) -> Int16? in
            guard let value = Int16(rawValue ?? "0") else {
                throw OutlawError.typeMismatchWithKey(key: "int16Transform", expected: Int16.self, actual: rawValue ?? "nil")
            }
            return value
        })
        XCTAssertEqual(int16["O"]!, 12345)
        
        let int32: [String: Int32?] = try! data.value(for: "int32Transform", with: { (rawValue: String?) -> Int32? in
            guard let value = Int32(rawValue ?? "0") else {
                throw OutlawError.typeMismatchWithKey(key: "int32Transform", expected: Int32.self, actual: rawValue ?? "nil")
            }
            return value
        })
        XCTAssertEqual(int32["O"]!, 12345)
        
        let int64: [String: Int64?] = try! data.value(for: "intTransform", with: { (rawValue: String?) -> Int64? in
            guard let value = Int64(rawValue ?? "0") else {
                throw OutlawError.typeMismatchWithKey(key: "intTransform", expected: Int64.self, actual: rawValue ?? "nil")
            }
            return value
        })
        XCTAssertEqual(int64["O"]!, 12345)
        
        let uint: [String: UInt?] = try! data.value(for: "uintTransform", with: { (rawValue: String?) -> UInt? in
            guard let value = UInt(rawValue ?? "0") else {
                throw OutlawError.typeMismatchWithKey(key: "uintTransform", expected: UInt.self, actual: rawValue ?? "nil")
            }
            return value
        })
        XCTAssertEqual(uint["O"]!, 12345)
        
        let uint8: [String: UInt8?] = try! data.value(for: "uint8Transform", with: { (rawValue: String?) -> UInt8? in
            guard let value = UInt8(rawValue ?? "0") else {
                throw OutlawError.typeMismatchWithKey(key: "uint8Transform", expected: UInt8.self, actual: rawValue ?? "nil")
            }
            return value
        })
        XCTAssertEqual(uint8["O"]!, 123)
        
        let uint16: [String: UInt16?] = try! data.value(for: "uint16Transform", with: { (rawValue: String?) -> UInt16? in
            guard let value = UInt16(rawValue ?? "0") else {
                throw OutlawError.typeMismatchWithKey(key: "uint16Transform", expected: UInt16.self, actual: rawValue ?? "nil")
            }
            return value
        })
        XCTAssertEqual(uint16["O"]!, 12345)
        
        let uint32: [String: UInt32?] = try! data.value(for: "uint32Transform", with: { (rawValue: String?) -> UInt32? in
            guard let value = UInt32(rawValue ?? "0") else {
                throw OutlawError.typeMismatchWithKey(key: "uint32Transform", expected: UInt32.self, actual: rawValue ?? "nil")
            }
            return value
        })
        XCTAssertEqual(uint32["O"]!, 12345)
        
        let uint64: [String: UInt64?] = try! data.value(for: "uintTransform", with: { (rawValue: String?) -> UInt64? in
            guard let value = UInt64(rawValue ?? "0") else {
                throw OutlawError.typeMismatchWithKey(key: "uintTransform", expected: UInt64.self, actual: rawValue ?? "nil")
            }
            return value
        })
        XCTAssertEqual(uint64["O"]!, 12345)
        
        let url: [String: URL?] = try! data.value(for: "urlTransform", with: { (rawValue: String?) -> URL? in
            let urlValue = rawValue == "HOMEPAGE" ? "http://molbie.co" : (rawValue ?? "")
            guard let value = URL(string: urlValue) else {
                throw OutlawError.typeMismatchWithKey(key: "urlTransform", expected: URL.self, actual: rawValue ?? "")
            }
            
            return value
        })
        XCTAssertEqual(url["O"]!?.absoluteString, "http://molbie.co")
        
        let formatter = shortDateformatter()
        let date: [String: Date?] = try! data.value(for: "dateTransform", with: { (rawValue: String?) -> Date? in
            guard let dateValue = rawValue else {
                throw OutlawError.typeMismatchWithKey(key: "transform", expected: Date.self, actual: rawValue ?? "")
            }
            
            return formatter.date(from: dateValue)!
        })
        XCTAssertEqual(formatShortDate(date["O"]!!), formatShortDate(shortDateForAssert()))
    }
    
    func testTransformOptionalValueOfOptionals() {
        let bool: [String: Bool?]? = data.value(for: "boolTransform", with: { (rawValue: String) -> Bool? in
            return rawValue == "TRUE"
        })
        XCTAssertEqual(bool?["O"]!, true)
        
        let string: [String: String?]? = data.value(for: "stringTransform", with: { (rawValue: Bool) -> String? in
            return rawValue ? "TRUE" : "FALSE"
        })
        XCTAssertEqual(string?["O"]!, "TRUE")
        
        let character: [String: Character?]? = data.value(for: "characterTransform", with: { (rawValue: Bool) -> Character? in
            return rawValue ? "1" : "0"
        })
        XCTAssertEqual(character?["O"]!, "1")
        
        let float: [String: Float?]? = data.value(for: "floatTransform", with: { (rawValue: String) -> Float? in
            return rawValue == "PI" ? 3.14 : 0
        })
        XCTAssertEqual(float?["O"]!, 3.14)
        
        let double: [String: Double?]? = data.value(for: "doubleTransform", with: { (rawValue: String) -> Double? in
            return rawValue == "PI" ? 3.14 : 0
        })
        XCTAssertEqual(double?["O"]!, 3.14)
        
        let int: [String: Int?]? = data.value(for: "intTransform", with: { (rawValue: String) -> Int? in
            guard let value = Int(rawValue) else {
                throw OutlawError.typeMismatchWithKey(key: "intTransform", expected: Int.self, actual: rawValue)
            }
            return value
        })
        XCTAssertEqual(int?["O"]!, 12345)
        
        let int8: [String: Int8?]? = data.value(for: "int8Transform", with: { (rawValue: String) -> Int8? in
            guard let value = Int8(rawValue) else {
                throw OutlawError.typeMismatchWithKey(key: "int8Transform", expected: Int8.self, actual: rawValue)
            }
            return value
        })
        XCTAssertEqual(int8?["O"]!, 123)
        
        let int16: [String: Int16?]? = data.value(for: "int16Transform", with: { (rawValue: String) -> Int16? in
            guard let value = Int16(rawValue) else {
                throw OutlawError.typeMismatchWithKey(key: "int16Transform", expected: Int16.self, actual: rawValue)
            }
            return value
        })
        XCTAssertEqual(int16?["O"]!, 12345)
        
        let int32: [String: Int32?]? = data.value(for: "int32Transform", with: { (rawValue: String) -> Int32? in
            guard let value = Int32(rawValue) else {
                throw OutlawError.typeMismatchWithKey(key: "int32Transform", expected: Int32.self, actual: rawValue)
            }
            return value
        })
        XCTAssertEqual(int32?["O"]!, 12345)
        
        let int64: [String: Int64?]? = data.value(for: "int64Transform", with: { (rawValue: String) -> Int64? in
            guard let value = Int64(rawValue) else {
                throw OutlawError.typeMismatchWithKey(key: "int64Transform", expected: Int64.self, actual: rawValue)
            }
            return value
        })
        XCTAssertEqual(int64?["O"]!, 12345)
        
        let uint: [String: UInt?]? = data.value(for: "uintTransform", with: { (rawValue: String) -> UInt? in
            guard let value = UInt(rawValue) else {
                throw OutlawError.typeMismatchWithKey(key: "uintTransform", expected: UInt.self, actual: rawValue)
            }
            return value
        })
        XCTAssertEqual(uint?["O"]!, 12345)
        
        let uint8: [String: UInt8?]? = data.value(for: "uint8Transform", with: { (rawValue: String) -> UInt8? in
            guard let value = UInt8(rawValue) else {
                throw OutlawError.typeMismatchWithKey(key: "uint8Transform", expected: UInt8.self, actual: rawValue)
            }
            return value
        })
        XCTAssertEqual(uint8?["O"]!, 123)
        
        let uint16: [String: UInt16?]? = data.value(for: "uint16Transform", with: { (rawValue: String) -> UInt16? in
            guard let value = UInt16(rawValue) else {
                throw OutlawError.typeMismatchWithKey(key: "uint16Transform", expected: UInt16.self, actual: rawValue)
            }
            return value
        })
        XCTAssertEqual(uint16?["O"]!, 12345)
        
        let uint32: [String: UInt32?]? = data.value(for: "uint32Transform", with: { (rawValue: String) -> UInt32? in
            guard let value = UInt32(rawValue) else {
                throw OutlawError.typeMismatchWithKey(key: "uint32Transform", expected: UInt32.self, actual: rawValue)
            }
            return value
        })
        XCTAssertEqual(uint32?["O"]!, 12345)
        
        let uint64: [String: UInt64?]? = data.value(for: "uint64Transform", with: { (rawValue: String) -> UInt64? in
            guard let value = UInt64(rawValue) else {
                throw OutlawError.typeMismatchWithKey(key: "uint64Transform", expected: UInt64.self, actual: rawValue)
            }
            return value
        })
        XCTAssertEqual(uint64?["O"]!, 12345)
        
        let url: [String: URL?]? = data.value(for: "urlTransform", with: { (rawValue: String) -> URL? in
            let urlValue = rawValue == "HOMEPAGE" ? "http://molbie.co" : rawValue
            guard let value = URL(string: urlValue) else {
                throw OutlawError.typeMismatchWithKey(key: "urlTransform", expected: URL.self, actual: rawValue)
            }
            
            return value
        })
        XCTAssertEqual(url?["O"]!?.absoluteString, "http://molbie.co")
        
        let formatter = shortDateformatter()
        let date: [String: Date?]? = data.value(for: "dateTransform", with: { (rawValue: String) -> Date? in
            return formatter.date(from: rawValue)!
        })
        XCTAssertEqual(formatShortDate(date!["O"]!!), formatShortDate(shortDateForAssert()))
    }
    
    func testOptionalTransformOptionalValueOfOptionals() {
        let bool: [String: Bool?]? = data.value(for: "boolTransform", with: { (rawValue: String?) -> Bool? in
            return rawValue == "TRUE"
        })
        XCTAssertEqual(bool?["O"]!, true)
        
        let string: [String: String?]? = data.value(for: "stringTransform", with: { (rawValue: Bool?) -> String? in
            let value = rawValue ?? false
            return value ? "TRUE" : "FALSE"
        })
        XCTAssertEqual(string?["O"]!, "TRUE")
        
        let character: [String: Character?]? = data.value(for: "characterTransform", with: { (rawValue: Bool?) -> Character? in
            let value = rawValue ?? false
            return value ? "1" : "0"
        })
        XCTAssertEqual(character?["O"]!, "1")
        
        let float: [String: Float?]? = data.value(for: "floatTransform", with: { (rawValue: String?) -> Float? in
            let value = rawValue ?? ""
            return value == "PI" ? 3.14 : 0
        })
        XCTAssertEqual(float?["O"]!, 3.14)
        
        let double: [String: Double?]? = data.value(for: "doubleTransform", with: { (rawValue: String?) -> Double? in
            let value = rawValue ?? ""
            return value == "PI" ? 3.14 : 0
        })
        XCTAssertEqual(double?["O"]!, 3.14)
        
        let int: [String: Int?]? = data.value(for: "intTransform", with: { (rawValue: String?) -> Int? in
            guard let value = Int(rawValue ?? "") else {
                throw OutlawError.typeMismatchWithKey(key: "intTransform", expected: Int.self, actual: rawValue ?? "")
            }
            return value
        })
        XCTAssertEqual(int?["O"]!, 12345)
        
        let int8: [String: Int8?]? = data.value(for: "int8Transform", with: { (rawValue: String?) -> Int8? in
            guard let value = Int8(rawValue ?? "") else {
                throw OutlawError.typeMismatchWithKey(key: "int8Transform", expected: Int8.self, actual: rawValue ?? "")
            }
            return value
        })
        XCTAssertEqual(int8?["O"]!, 123)
        
        let int16: [String: Int16?]? = data.value(for: "int16Transform", with: { (rawValue: String?) -> Int16? in
            guard let value = Int16(rawValue ?? "") else {
                throw OutlawError.typeMismatchWithKey(key: "int16Transform", expected: Int16.self, actual: rawValue ?? "")
            }
            return value
        })
        XCTAssertEqual(int16?["O"]!, 12345)
        
        let int32: [String: Int32?]? = data.value(for: "int32Transform", with: { (rawValue: String?) -> Int32? in
            guard let value = Int32(rawValue ?? "") else {
                throw OutlawError.typeMismatchWithKey(key: "int32Transform", expected: Int32.self, actual: rawValue ?? "")
            }
            return value
        })
        XCTAssertEqual(int32?["O"]!, 12345)
        
        let int64: [String: Int64?]? = data.value(for: "int64Transform", with: { (rawValue: String?) -> Int64? in
            guard let value = Int64(rawValue ?? "") else {
                throw OutlawError.typeMismatchWithKey(key: "int64Transform", expected: Int64.self, actual: rawValue ?? "")
            }
            return value
        })
        XCTAssertEqual(int64?["O"]!, 12345)
        
        let uint: [String: UInt?]? = data.value(for: "uintTransform", with: { (rawValue: String?) -> UInt? in
            guard let value = UInt(rawValue ?? "") else {
                throw OutlawError.typeMismatchWithKey(key: "uintTransform", expected: UInt.self, actual: rawValue ?? "")
            }
            return value
        })
        XCTAssertEqual(uint?["O"]!, 12345)
        
        let uint8: [String: UInt8?]? = data.value(for: "uint8Transform", with: { (rawValue: String?) -> UInt8? in
            guard let value = UInt8(rawValue ?? "") else {
                throw OutlawError.typeMismatchWithKey(key: "uint8Transform", expected: UInt8.self, actual: rawValue ?? "")
            }
            return value
        })
        XCTAssertEqual(uint8?["O"]!, 123)
        
        let uint16: [String: UInt16?]? = data.value(for: "uint16Transform", with: { (rawValue: String?) -> UInt16? in
            guard let value = UInt16(rawValue ?? "") else {
                throw OutlawError.typeMismatchWithKey(key: "uint16Transform", expected: UInt16.self, actual: rawValue ?? "")
            }
            return value
        })
        XCTAssertEqual(uint16?["O"]!, 12345)
        
        let uint32: [String: UInt32?]? = data.value(for: "uint32Transform", with: { (rawValue: String?) -> UInt32? in
            guard let value = UInt32(rawValue ?? "") else {
                throw OutlawError.typeMismatchWithKey(key: "uint32Transform", expected: UInt32.self, actual: rawValue ?? "")
            }
            return value
        })
        XCTAssertEqual(uint32?["O"]!, 12345)
        
        let uint64: [String: UInt64?]? = data.value(for: "uint64Transform", with: { (rawValue: String?) -> UInt64? in
            guard let value = UInt64(rawValue ?? "") else {
                throw OutlawError.typeMismatchWithKey(key: "uint64Transform", expected: UInt64.self, actual: rawValue ?? "")
            }
            return value
        })
        XCTAssertEqual(uint64?["O"]!, 12345)
        
        let url: [String: URL?]? = data.value(for: "urlTransform", with: { (rawValue: String?) -> URL? in
            let urlValue = rawValue == "HOMEPAGE" ? "http://molbie.co" : (rawValue ?? "")
            guard let value = URL(string: urlValue) else {
                throw OutlawError.typeMismatchWithKey(key: "urlTransform", expected: URL.self, actual: rawValue ?? "")
            }
            
            return value
        })
        XCTAssertEqual(url?["O"]!?.absoluteString, "http://molbie.co")
        
        let formatter = shortDateformatter()
        let date: [String: Date?]? = data.value(for: "dateTransform", with: { (rawValue: String?) -> Date? in
            let value = rawValue ?? "11/18/2016"
            return formatter.date(from: value)!
        })
        XCTAssertEqual(formatShortDate(date!["O"]!!), formatShortDate(shortDateForAssert()))
    }
}
