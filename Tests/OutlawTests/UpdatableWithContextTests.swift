//
//  UpdatableWithContextTests.swift
//  Outlaw
//
//  Created by Brian Mullen on 11/15/16.
//  Copyright © 2016 Molbie LLC. All rights reserved.
//

import XCTest
@testable import Outlaw


class UpdatableWithContextTests: OutlawTestCase {
    static var allTests = [("testUpdateNoAddress", testUpdateNoAddress),
                           ("testUpdateExcludeAddress", testUpdateExcludeAddress),
                           ("testUpdateCreateAddress", testUpdateCreateAddress),
                           ("testUpdateWithAddress", testUpdateWithAddress)]
    
    override func setUp() {
        super.setUp()
        
        data = jsonData(for: "ObjectTests")
    }
    
    func testUpdateNoAddress() {
        let context = SomePersonContextIncludeAddress()
        
        var person = Person(firstName: "First", lastName: "Last", address: nil)
        XCTAssertEqual(person.firstName, "First")
        XCTAssertEqual(person.lastName, "Last")
        XCTAssertNil(person.address)
        
        try! person.update(with: data["personNoAddress"] as! Extractable, using: context)
        XCTAssertEqual(person.firstName, "Brian")
        XCTAssertEqual(person.lastName, "Mullen")
        XCTAssertNil(person.address)
    }
    
    func testUpdateExcludeAddress() {
        let context = SomePersonContextExcludeAddress()
        
        var person = Person(firstName: "First", lastName: "Last", address: nil)
        XCTAssertEqual(person.firstName, "First")
        XCTAssertEqual(person.lastName, "Last")
        XCTAssertNil(person.address)
        
        try! person.update(with: data["personWithAddress"] as! Extractable, using: context)
        XCTAssertEqual(person.firstName, "Brian")
        XCTAssertEqual(person.lastName, "Mullen")
        XCTAssertNil(person.address)
    }
    
    func testUpdateCreateAddress() {
        let context = NewObjectContext()
        
        var person = context.newPerson()
        XCTAssertEqual(person.firstName, "First")
        XCTAssertEqual(person.lastName, "Last")
        XCTAssertNil(person.address)
        
        try! person.update(with: data["personWithAddress"] as! Extractable, using: context)
        XCTAssertEqual(person.firstName, "Brian")
        XCTAssertEqual(person.lastName, "Mullen")
        XCTAssertNotNil(person.address)
        XCTAssertEqual(person.address!.street, "1 Infinite Loop")
        XCTAssertEqual(person.address!.city, "Cupertino")
    }
    
    func testUpdateWithAddress() {
        let context = NewObjectContext()
        
        var person = context.newPerson()
        person.address = context.newAddress()
        XCTAssertEqual(person.firstName, "First")
        XCTAssertEqual(person.lastName, "Last")
        XCTAssertNotNil(person.address)
        XCTAssertEqual(person.address!.street, "Street")
        XCTAssertEqual(person.address!.city, "City")
        
        try! person.update(with: data["personWithAddress"] as! Extractable, using: context)
        XCTAssertEqual(person.firstName, "Brian")
        XCTAssertEqual(person.lastName, "Mullen")
        XCTAssertNotNil(person.address)
        XCTAssertEqual(person.address!.street, "1 Infinite Loop")
        XCTAssertEqual(person.address!.city, "Cupertino")
    }
}

// MARK: -
// MARK: Types

extension Address: UpdatableWithContext {
    mutating func update(with data: Extractable, using context: AddressContext) throws {
        if let street: String = data.value(for: "street") {
            self.street = street
        }
        if let city: String = data.value(for: "city") {
            self.city = city
        }
    }
}

extension Person: UpdatableWithContext {
    mutating func update(with data: Extractable, using context: PersonContext) throws {
        if let firstName: String = data.value(for: "first") {
            self.firstName = firstName
        }
        if let lastName: String = data.value(for: "last") {
            self.lastName = lastName
        }
        
        if context is PersonContextIncludeAddress {
            if address == nil, let newObjectContext = context as? NewObjectContext {
                address = newObjectContext.newAddress()
            }
            
            if address != nil {
                if let addressData: [String: Any] = data.value(for: "address") {
                    try address?.update(with: addressData, using: context as! AddressContext)
                }
            }
            else {
                address = data.value(for: "address", using: context as! AddressContext)
            }
        }
    }
}
