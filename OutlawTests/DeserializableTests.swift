//
//  DeserializableTests.swift
//  Outlaw
//
//  Created by Brian Mullen on 11/15/16.
//  Copyright © 2016 Molbie LLC. All rights reserved.
//

import XCTest
@testable import Outlaw


class DeserializableTests: OutlawTestCase {
    lazy var data = OutlawTestCase.jsonData(for: "ObjectTests")
    
    func testValue() {
        let personNoAddress: Person = try! data.value(for: "personNoAddress")
        XCTAssertEqual(personNoAddress.firstName, "Brian")
        XCTAssertEqual(personNoAddress.lastName, "Mullen")
        XCTAssertNil(personNoAddress.address)
        
        let personNullAddress: Person = try! data.value(for: "personNullAddress")
        XCTAssertEqual(personNullAddress.firstName, "Brian")
        XCTAssertEqual(personNullAddress.lastName, "Mullen")
        XCTAssertNil(personNullAddress.address)
        
        let personWithAddress: Person = try! data.value(for: "personWithAddress")
        XCTAssertEqual(personWithAddress.firstName, "Brian")
        XCTAssertEqual(personWithAddress.lastName, "Mullen")
        XCTAssertNotNil(personWithAddress.address)
        XCTAssertEqual(personWithAddress.address?.street, "1 Infinite Loop")
        XCTAssertEqual(personWithAddress.address?.city, "Cupertino")
    }
    
    func testArrayValue() {
        let personNoAddress: [Person] = try! data.value(for: "arrayNoAddress")
        XCTAssertEqual(personNoAddress.count, 3)
        XCTAssertEqual(personNoAddress[0].firstName, "Brian")
        XCTAssertEqual(personNoAddress[0].lastName, "Mullen")
        XCTAssertNil(personNoAddress[0].address)
        
        let personNullAddress: [Person] = try! data.value(for: "arrayNullAddress")
        XCTAssertEqual(personNullAddress.count, 3)
        XCTAssertEqual(personNullAddress[0].firstName, "Brian")
        XCTAssertEqual(personNullAddress[0].lastName, "Mullen")
        XCTAssertNil(personNullAddress[0].address)
        
        let personWithAddress: [Person] = try! data.value(for: "arrayWithAddress")
        XCTAssertEqual(personWithAddress.count, 3)
        XCTAssertEqual(personWithAddress[0].firstName, "Brian")
        XCTAssertEqual(personWithAddress[0].lastName, "Mullen")
        XCTAssertNotNil(personWithAddress[0].address)
        XCTAssertEqual(personWithAddress[0].address?.street, "1 Infinite Loop")
        XCTAssertEqual(personWithAddress[0].address?.city, "Cupertino")
    }
    
    func testDictionaryValue() {
        let personNoAddress: [String: Person] = try! data.value(for: "dictionaryNoAddress")
        XCTAssertEqual(personNoAddress["O"]?.firstName, "Brian")
        XCTAssertEqual(personNoAddress["O"]?.lastName, "Mullen")
        XCTAssertNil(personNoAddress["O"]?.address)
        
        let personNullAddress: [String: Person] = try! data.value(for: "dictionaryNullAddress")
        XCTAssertEqual(personNullAddress["O"]?.firstName, "Brian")
        XCTAssertEqual(personNullAddress["O"]?.lastName, "Mullen")
        XCTAssertNil(personNullAddress["O"]?.address)
        
        let personWithAddress: [String: Person] = try! data.value(for: "dictionaryWithAddress")
        XCTAssertEqual(personWithAddress["O"]?.firstName, "Brian")
        XCTAssertEqual(personWithAddress["O"]?.lastName, "Mullen")
        XCTAssertNotNil(personWithAddress["O"]?.address)
        XCTAssertEqual(personWithAddress["O"]?.address?.street, "1 Infinite Loop")
        XCTAssertEqual(personWithAddress["O"]?.address?.city, "Cupertino")
    }
    
    func testSetValue() {
        let personNoAddress: Set<Person> = try! data.value(for: "setNoAddress")
        XCTAssertEqual(personNoAddress.count, 1)
        XCTAssertEqual(personNoAddress.first?.firstName, "Brian")
        XCTAssertEqual(personNoAddress.first?.lastName, "Mullen")
        XCTAssertNil(personNoAddress.first?.address)
        
        let personNullAddress: Set<Person> = try! data.value(for: "setNullAddress")
        XCTAssertEqual(personNullAddress.count, 1)
        XCTAssertEqual(personNullAddress.first?.firstName, "Brian")
        XCTAssertEqual(personNullAddress.first?.lastName, "Mullen")
        XCTAssertNil(personNullAddress.first?.address)
        
        let personWithAddress: Set<Person> = try! data.value(for: "setWithAddress")
        XCTAssertEqual(personWithAddress.count, 1)
        XCTAssertEqual(personWithAddress.first?.firstName, "Brian")
        XCTAssertEqual(personWithAddress.first?.lastName, "Mullen")
        XCTAssertNotNil(personWithAddress.first?.address)
        XCTAssertEqual(personWithAddress.first?.address?.street, "1 Infinite Loop")
        XCTAssertEqual(personWithAddress.first?.address?.city, "Cupertino")
    }
    
    func testNestedValue() {
        let personNoAddress: Person = try! data.value(for: "object.personNoAddress")
        XCTAssertEqual(personNoAddress.firstName, "Brian")
        XCTAssertEqual(personNoAddress.lastName, "Mullen")
        XCTAssertNil(personNoAddress.address)
        
        let personNullAddress: Person = try! data.value(for: "object.personNullAddress")
        XCTAssertEqual(personNullAddress.firstName, "Brian")
        XCTAssertEqual(personNullAddress.lastName, "Mullen")
        XCTAssertNil(personNullAddress.address)
        
        let personWithAddress: Person = try! data.value(for: "object.personWithAddress")
        XCTAssertEqual(personWithAddress.firstName, "Brian")
        XCTAssertEqual(personWithAddress.lastName, "Mullen")
        XCTAssertNotNil(personWithAddress.address)
        XCTAssertEqual(personWithAddress.address?.street, "1 Infinite Loop")
        XCTAssertEqual(personWithAddress.address?.city, "Cupertino")
    }
    
    func testNestedArrayValue() {
        let personNoAddress: [Person] = try! data.value(for: "object.arrayNoAddress")
        XCTAssertEqual(personNoAddress.count, 3)
        XCTAssertEqual(personNoAddress[0].firstName, "Brian")
        XCTAssertEqual(personNoAddress[0].lastName, "Mullen")
        XCTAssertNil(personNoAddress[0].address)
        
        let personNullAddress: [Person] = try! data.value(for: "object.arrayNullAddress")
        XCTAssertEqual(personNullAddress.count, 3)
        XCTAssertEqual(personNullAddress[0].firstName, "Brian")
        XCTAssertEqual(personNullAddress[0].lastName, "Mullen")
        XCTAssertNil(personNullAddress[0].address)
        
        let personWithAddress: [Person] = try! data.value(for: "object.arrayWithAddress")
        XCTAssertEqual(personWithAddress.count, 3)
        XCTAssertEqual(personWithAddress[0].firstName, "Brian")
        XCTAssertEqual(personWithAddress[0].lastName, "Mullen")
        XCTAssertNotNil(personWithAddress[0].address)
        XCTAssertEqual(personWithAddress[0].address?.street, "1 Infinite Loop")
        XCTAssertEqual(personWithAddress[0].address?.city, "Cupertino")
    }
    
    func testNestedDictionaryValue() {
        let personNoAddress: [String: Person] = try! data.value(for: "object.dictionaryNoAddress")
        XCTAssertEqual(personNoAddress["O"]?.firstName, "Brian")
        XCTAssertEqual(personNoAddress["O"]?.lastName, "Mullen")
        XCTAssertNil(personNoAddress["O"]?.address)
        
        let personNullAddress: [String: Person] = try! data.value(for: "object.dictionaryNullAddress")
        XCTAssertEqual(personNullAddress["O"]?.firstName, "Brian")
        XCTAssertEqual(personNullAddress["O"]?.lastName, "Mullen")
        XCTAssertNil(personNullAddress["O"]?.address)
        
        let personWithAddress: [String: Person] = try! data.value(for: "object.dictionaryWithAddress")
        XCTAssertEqual(personWithAddress["O"]?.firstName, "Brian")
        XCTAssertEqual(personWithAddress["O"]?.lastName, "Mullen")
        XCTAssertNotNil(personWithAddress["O"]?.address)
        XCTAssertEqual(personWithAddress["O"]?.address?.street, "1 Infinite Loop")
        XCTAssertEqual(personWithAddress["O"]?.address?.city, "Cupertino")
    }
    
    func testNestedSetValue() {
        let personNoAddress: Set<Person> = try! data.value(for: "object.setNoAddress")
        XCTAssertEqual(personNoAddress.count, 1)
        XCTAssertEqual(personNoAddress.first?.firstName, "Brian")
        XCTAssertEqual(personNoAddress.first?.lastName, "Mullen")
        XCTAssertNil(personNoAddress.first?.address)
        
        let personNullAddress: Set<Person> = try! data.value(for: "object.setNullAddress")
        XCTAssertEqual(personNullAddress.count, 1)
        XCTAssertEqual(personNullAddress.first?.firstName, "Brian")
        XCTAssertEqual(personNullAddress.first?.lastName, "Mullen")
        XCTAssertNil(personNullAddress.first?.address)
        
        let personWithAddress: Set<Person> = try! data.value(for: "object.setWithAddress")
        XCTAssertEqual(personWithAddress.count, 1)
        XCTAssertEqual(personWithAddress.first?.firstName, "Brian")
        XCTAssertEqual(personWithAddress.first?.lastName, "Mullen")
        XCTAssertNotNil(personWithAddress.first?.address)
        XCTAssertEqual(personWithAddress.first?.address?.street, "1 Infinite Loop")
        XCTAssertEqual(personWithAddress.first?.address?.city, "Cupertino")
    }
    
    func testKeyNotFound() {
        var value: Person = try! Person(object: ["first":"", "last":""])
        
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
        XCTAssertEqual(value.firstName, "")
        XCTAssertEqual(value.lastName, "")
        XCTAssertNil(value.address)
    }
    
    func testTypeMismatch() {
        var value: Person = try! Person(object: ["first":"", "last":""])
        
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
        XCTAssertEqual(value.firstName, "")
        XCTAssertEqual(value.lastName, "")
        XCTAssertNil(value.address)
    }
    
// MARK: -
// MARK: Optionals
    
    func testOptional() {
        let personNoAddress: Person? = data.value(for: "personNoAddress")
        XCTAssertEqual(personNoAddress?.firstName, "Brian")
        XCTAssertEqual(personNoAddress?.lastName, "Mullen")
        XCTAssertNil(personNoAddress?.address)
        
        let personNullAddress: Person? = data.value(for: "personNullAddress")
        XCTAssertEqual(personNullAddress?.firstName, "Brian")
        XCTAssertEqual(personNullAddress?.lastName, "Mullen")
        XCTAssertNil(personNullAddress?.address)
        
        let personWithAddress: Person? = data.value(for: "personWithAddress")
        XCTAssertEqual(personWithAddress?.firstName, "Brian")
        XCTAssertEqual(personWithAddress?.lastName, "Mullen")
        XCTAssertNotNil(personWithAddress?.address)
        XCTAssertEqual(personWithAddress?.address?.street, "1 Infinite Loop")
        XCTAssertEqual(personWithAddress?.address?.city, "Cupertino")
    }
    
    func testOptionalArray() {
        let personNoAddress: [Person]? = data.value(for: "arrayNoAddress")
        XCTAssertEqual(personNoAddress?.count, 3)
        XCTAssertEqual(personNoAddress?[0].firstName, "Brian")
        XCTAssertEqual(personNoAddress?[0].lastName, "Mullen")
        XCTAssertNil(personNoAddress?[0].address)
        
        let personNullAddress: [Person]? = data.value(for: "arrayNullAddress")
        XCTAssertEqual(personNullAddress?.count, 3)
        XCTAssertEqual(personNullAddress?[0].firstName, "Brian")
        XCTAssertEqual(personNullAddress?[0].lastName, "Mullen")
        XCTAssertNil(personNullAddress?[0].address)
        
        let personWithAddress: [Person]? = data.value(for: "arrayWithAddress")
        XCTAssertEqual(personWithAddress?.count, 3)
        XCTAssertEqual(personWithAddress?[0].firstName, "Brian")
        XCTAssertEqual(personWithAddress?[0].lastName, "Mullen")
        XCTAssertNotNil(personWithAddress?[0].address)
        XCTAssertEqual(personWithAddress?[0].address?.street, "1 Infinite Loop")
        XCTAssertEqual(personWithAddress?[0].address?.city, "Cupertino")
    }
    
    func testOptionalDictionary() {
        let personNoAddress: [String: Person]? = data.value(for: "dictionaryNoAddress")
        XCTAssertEqual(personNoAddress?["O"]?.firstName, "Brian")
        XCTAssertEqual(personNoAddress?["O"]?.lastName, "Mullen")
        XCTAssertNil(personNoAddress?["O"]?.address)
        
        let personNullAddress: [String: Person]? = data.value(for: "dictionaryNullAddress")
        XCTAssertEqual(personNullAddress?["O"]?.firstName, "Brian")
        XCTAssertEqual(personNullAddress?["O"]?.lastName, "Mullen")
        XCTAssertNil(personNullAddress?["O"]?.address)
        
        let personWithAddress: [String: Person]? = data.value(for: "dictionaryWithAddress")
        XCTAssertEqual(personWithAddress?["O"]?.firstName, "Brian")
        XCTAssertEqual(personWithAddress?["O"]?.lastName, "Mullen")
        XCTAssertNotNil(personWithAddress?["O"]?.address)
        XCTAssertEqual(personWithAddress?["O"]?.address?.street, "1 Infinite Loop")
        XCTAssertEqual(personWithAddress?["O"]?.address?.city, "Cupertino")
    }
    
    func testOptionalSet() {
        let personNoAddress: Set<Person>? = data.value(for: "setNoAddress")
        XCTAssertEqual(personNoAddress?.count, 1)
        XCTAssertEqual(personNoAddress?.first?.firstName, "Brian")
        XCTAssertEqual(personNoAddress?.first?.lastName, "Mullen")
        XCTAssertNil(personNoAddress?.first?.address)
        
        let personNullAddress: Set<Person>? = data.value(for: "setNullAddress")
        XCTAssertEqual(personNullAddress?.count, 1)
        XCTAssertEqual(personNullAddress?.first?.firstName, "Brian")
        XCTAssertEqual(personNullAddress?.first?.lastName, "Mullen")
        XCTAssertNil(personNullAddress?.first?.address)
        
        let personWithAddress: Set<Person>? = data.value(for: "setWithAddress")
        XCTAssertEqual(personWithAddress?.count, 1)
        XCTAssertEqual(personWithAddress?.first?.firstName, "Brian")
        XCTAssertEqual(personWithAddress?.first?.lastName, "Mullen")
        XCTAssertNotNil(personWithAddress?.first?.address)
        XCTAssertEqual(personWithAddress?.first?.address?.street, "1 Infinite Loop")
        XCTAssertEqual(personWithAddress?.first?.address?.city, "Cupertino")
    }
    
    func testOptionalNestedValue() {
        let personNoAddress: Person? = data.value(for: "object.personNoAddress")
        XCTAssertEqual(personNoAddress?.firstName, "Brian")
        XCTAssertEqual(personNoAddress?.lastName, "Mullen")
        XCTAssertNil(personNoAddress?.address)
        
        let personNullAddress: Person? = data.value(for: "object.personNullAddress")
        XCTAssertEqual(personNullAddress?.firstName, "Brian")
        XCTAssertEqual(personNullAddress?.lastName, "Mullen")
        XCTAssertNil(personNullAddress?.address)
        
        let personWithAddress: Person? = data.value(for: "object.personWithAddress")
        XCTAssertEqual(personWithAddress?.firstName, "Brian")
        XCTAssertEqual(personWithAddress?.lastName, "Mullen")
        XCTAssertNotNil(personWithAddress?.address)
        XCTAssertEqual(personWithAddress?.address?.street, "1 Infinite Loop")
        XCTAssertEqual(personWithAddress?.address?.city, "Cupertino")
    }
    
    func testOptionalNestedArray() {
        let personNoAddress: [Person]? = data.value(for: "object.arrayNoAddress")
        XCTAssertEqual(personNoAddress?.count, 3)
        XCTAssertEqual(personNoAddress?[0].firstName, "Brian")
        XCTAssertEqual(personNoAddress?[0].lastName, "Mullen")
        XCTAssertNil(personNoAddress?[0].address)
        
        let personNullAddress: [Person]? = data.value(for: "object.arrayNullAddress")
        XCTAssertEqual(personNullAddress?.count, 3)
        XCTAssertEqual(personNullAddress?[0].firstName, "Brian")
        XCTAssertEqual(personNullAddress?[0].lastName, "Mullen")
        XCTAssertNil(personNullAddress?[0].address)
        
        let personWithAddress: [Person]? = data.value(for: "object.arrayWithAddress")
        XCTAssertEqual(personWithAddress?.count, 3)
        XCTAssertEqual(personWithAddress?[0].firstName, "Brian")
        XCTAssertEqual(personWithAddress?[0].lastName, "Mullen")
        XCTAssertNotNil(personWithAddress?[0].address)
        XCTAssertEqual(personWithAddress?[0].address?.street, "1 Infinite Loop")
        XCTAssertEqual(personWithAddress?[0].address?.city, "Cupertino")
    }
    
    func testOptionalNestedDictionary() {
        let personNoAddress: [String: Person]? = data.value(for: "object.dictionaryNoAddress")
        XCTAssertEqual(personNoAddress?["O"]?.firstName, "Brian")
        XCTAssertEqual(personNoAddress?["O"]?.lastName, "Mullen")
        XCTAssertNil(personNoAddress?["O"]?.address)
        
        let personNullAddress: [String: Person]? = data.value(for: "object.dictionaryNullAddress")
        XCTAssertEqual(personNullAddress?["O"]?.firstName, "Brian")
        XCTAssertEqual(personNullAddress?["O"]?.lastName, "Mullen")
        XCTAssertNil(personNullAddress?["O"]?.address)
        
        let personWithAddress: [String: Person]? = data.value(for: "object.dictionaryWithAddress")
        XCTAssertEqual(personWithAddress?["O"]?.firstName, "Brian")
        XCTAssertEqual(personWithAddress?["O"]?.lastName, "Mullen")
        XCTAssertNotNil(personWithAddress?["O"]?.address)
        XCTAssertEqual(personWithAddress?["O"]?.address?.street, "1 Infinite Loop")
        XCTAssertEqual(personWithAddress?["O"]?.address?.city, "Cupertino")
    }
    
    func testOptionalNestedSet() {
        let personNoAddress: Set<Person>? = data.value(for: "object.setNoAddress")
        XCTAssertEqual(personNoAddress?.count, 1)
        XCTAssertEqual(personNoAddress?.first?.firstName, "Brian")
        XCTAssertEqual(personNoAddress?.first?.lastName, "Mullen")
        XCTAssertNil(personNoAddress?.first?.address)
        
        let personNullAddress: Set<Person>? = data.value(for: "object.setNullAddress")
        XCTAssertEqual(personNullAddress?.count, 1)
        XCTAssertEqual(personNullAddress?.first?.firstName, "Brian")
        XCTAssertEqual(personNullAddress?.first?.lastName, "Mullen")
        XCTAssertNil(personNullAddress?.first?.address)
        
        let personWithAddress: Set<Person>? = data.value(for: "object.setWithAddress")
        XCTAssertEqual(personWithAddress?.count, 1)
        XCTAssertEqual(personWithAddress?.first?.firstName, "Brian")
        XCTAssertEqual(personWithAddress?.first?.lastName, "Mullen")
        XCTAssertNotNil(personWithAddress?.first?.address)
        XCTAssertEqual(personWithAddress?.first?.address?.street, "1 Infinite Loop")
        XCTAssertEqual(personWithAddress?.first?.address?.city, "Cupertino")
    }
    
    func testOptionalKeyNotFound() {
        let value: Person? = data.value(for: "keyNotFound")
        XCTAssertNil(value)
    }
    
    func testOptionalTypeMismatch() {
        let value: Person? = data.value(for: "string")
        XCTAssertNil(value)
    }
}

// MARK: -
// MARK: Types

extension Address: Outlaw.Deserializable {
    init(object data: Outlaw.Extractable) throws {
        street = try data.value(for: "street")
        city = try data.value(for: "city")
    }
}
extension Person: Outlaw.Deserializable {
    init(object data: Outlaw.Extractable) throws {
        firstName = try data.value(for: "first")
        lastName = try data.value(for: "last")
        address = data.value(for: "address")
    }
}
