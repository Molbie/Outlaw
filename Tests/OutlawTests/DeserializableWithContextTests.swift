//
//  DeserializableWithContextTests.swift
//  Outlaw
//
//  Created by Brian Mullen on 11/15/16.
//  Copyright © 2016 Molbie LLC. All rights reserved.
//

import XCTest
@testable import Outlaw


class DeserializableWithContextTests: OutlawTestCase {
    override func setUp() {
        super.setUp()
        
        data = jsonData(for: "ObjectTests")
    }
    
    func testValue() {
        let context = SomePersonContextIncludeAddress()
        let person: Person = try! data.value(for: "personWithAddress", using: context)
        
        XCTAssertEqual(person.firstName, "Brian")
        XCTAssertEqual(person.lastName, "Mullen")
        XCTAssertNotNil(person.address)
        XCTAssertEqual(person.address?.street, "1 Infinite Loop")
        XCTAssertEqual(person.address?.city, "Cupertino")
    }
    
    func testValueNoAddress() {
        let context = SomePersonContextIncludeAddress()
        let person: Person = try! data.value(for: "personNoAddress", using: context)
        
        XCTAssertEqual(person.firstName, "Brian")
        XCTAssertEqual(person.lastName, "Mullen")
        XCTAssertNil(person.address)
    }
    
    func testValueExcludeAddress() {
        let context = SomePersonContextExcludeAddress()
        let person: Person = try! data.value(for: "personWithAddress", using: context)
        
        XCTAssertEqual(person.firstName, "Brian")
        XCTAssertEqual(person.lastName, "Mullen")
        XCTAssertNil(person.address)
    }
}

// MARK: -
// MARK: Types

extension Address: DeserializableWithContext {
    init(object data: Extractable, using context: AddressContext) throws {
        street = try data.value(for: "street")
        city = try data.value(for: "city")
    }
}

extension Person: DeserializableWithContext {
    init(object data: Extractable, using context: PersonContext) throws {
        firstName = try data.value(for: "first")
        lastName = try data.value(for: "last")
        
        if context is PersonContextIncludeAddress {
            address = data.value(for: "address", using: context as! AddressContext)
        }
        else {
            address = nil
        }
    }
}
