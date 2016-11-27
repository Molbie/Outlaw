//
//  UpdatableTests.swift
//  Outlaw
//
//  Created by Brian Mullen on 11/15/16.
//  Copyright © 2016 Molbie LLC. All rights reserved.
//

import XCTest
@testable import Outlaw


class UpdatableTests: OutlawTestCase {
    override func setUp() {
        super.setUp()
        
        data = jsonData(for: "ObjectTests")
    }
    
    func testUpdatePerson() {
        var person = Person(firstName: "First", lastName: "Last", address: nil)
        XCTAssertEqual(person.firstName, "First")
        XCTAssertEqual(person.lastName, "Last")
        XCTAssertNil(person.address)
        
        try! person.update(with: data["personNoAddress"] as! Extractable)
        XCTAssertEqual(person.firstName, "Brian")
        XCTAssertEqual(person.lastName, "Mullen")
        XCTAssertNil(person.address)
    }
    
    func testUpdateAddress() {
        let emptyAddress = Address(street: "Street", city: "City")
        var person = Person(firstName: "First", lastName: "Last", address: emptyAddress)
        XCTAssertEqual(person.firstName, "First")
        XCTAssertEqual(person.lastName, "Last")
        XCTAssertNotNil(person.address)
        XCTAssertEqual(person.address!.street, "Street")
        XCTAssertEqual(person.address!.city, "City")
        
        try! person.update(with: data["personWithAddress"] as! Extractable)
        XCTAssertEqual(person.firstName, "Brian")
        XCTAssertEqual(person.lastName, "Mullen")
        XCTAssertNotNil(person.address)
        XCTAssertEqual(person.address!.street, "1 Infinite Loop")
        XCTAssertEqual(person.address!.city, "Cupertino")
    }
    
    func testAddAddress() {
        var person = Person(firstName: "First", lastName: "Last", address: nil)
        XCTAssertEqual(person.firstName, "First")
        XCTAssertEqual(person.lastName, "Last")
        XCTAssertNil(person.address)
        
        try! person.update(with: data["personWithAddress"] as! Extractable)
        XCTAssertEqual(person.firstName, "Brian")
        XCTAssertEqual(person.lastName, "Mullen")
        XCTAssertNotNil(person.address)
        XCTAssertEqual(person.address!.street, "1 Infinite Loop")
        XCTAssertEqual(person.address!.city, "Cupertino")
    }
    
    func testUpdatePartialAddress() {
        let emptyAddress = Address(street: "Street", city: "City")
        var person = Person(firstName: "First", lastName: "Last", address: emptyAddress)
        XCTAssertEqual(person.firstName, "First")
        XCTAssertEqual(person.lastName, "Last")
        XCTAssertNotNil(person.address)
        XCTAssertEqual(person.address!.street, "Street")
        XCTAssertEqual(person.address!.city, "City")
        
        try! person.update(with: ["first": "Brian", "last": "Mullen", "address": ["street": "1 Infinite Loop"]])
        XCTAssertEqual(person.firstName, "Brian")
        XCTAssertEqual(person.lastName, "Mullen")
        XCTAssertNotNil(person.address)
        XCTAssertEqual(person.address!.street, "1 Infinite Loop")
        XCTAssertEqual(person.address!.city, "City")
    }
}

// MARK: -
// MARK: Types

extension Address: Outlaw.Updatable {
    mutating func update(with data: Outlaw.Extractable) throws {
        if let street: String = data.value(for: "street") {
            self.street = street
        }
        if let city: String = data.value(for: "city") {
            self.city = city
        }
    }
}
extension Person: Outlaw.Updatable {
    mutating func update(with data: Outlaw.Extractable) throws {
        if let firstName: String = data.value(for: "first") {
            self.firstName = firstName
        }
        if let lastName: String = data.value(for: "last") {
            self.lastName = lastName
        }
        if address != nil {
            if let addressData: [String: Any] = data.value(for: "address") {
                try self.address?.update(with: addressData)
            }
        }
        else if let address: Address = data.value(for: "address") {
            self.address = address
        }
    }
}
