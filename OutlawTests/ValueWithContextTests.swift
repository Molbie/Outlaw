//
//  ValueWithContextTests.swift
//  Outlaw
//
//  Created by Brian Mullen on 11/15/16.
//  Copyright © 2016 Molbie LLC. All rights reserved.
//

import XCTest
@testable import Outlaw


class ValueWithContextTests: OutlawTestCase {
    lazy var data = OutlawTestCase.jsonData(for: "ObjectTests")
    
    func testInvalidContext() {
        let context = SomePersonContextIncludeAddress()
        
        let ex = self.expectation(description: "Invalid context")
        do {
            let _: Person2 = try data.value(for: "personWithAddress", using: context)
        }
        catch {
            if case OutlawError.typeMismatchWithKey = error {
                ex.fulfill()
            }
        }
        self.waitForExpectations(timeout: 1, handler: nil)
    }
    
    func testPersonNoAddress() {
        let context = NewObjectContext()
        let person: Person2 = try! data.value(for: "personNoAddress", using: context)
        
        XCTAssertEqual(person.firstName, "Brian")
        XCTAssertEqual(person.lastName, "Mullen")
        XCTAssertNil(person.address)
    }
    
    func testPersonWithAddress() {
        let context = NewObjectContext()
        let person: Person2 = try! data.value(for: "personWithAddress", using: context)
        
        XCTAssertEqual(person.firstName, "Brian")
        XCTAssertEqual(person.lastName, "Mullen")
        XCTAssertNotNil(person.address)
        XCTAssertEqual(person.address!.street, "1 Infinite Loop")
        XCTAssertEqual(person.address!.city, "Cupertino")
    }
}

// MARK: -
// MARK: Types

extension Address2: ValueWithContext {
    static func value(from object: Any, using context: AddressContext) throws -> Address2 {
        guard let objectData = object as? Extractable else {
            throw OutlawError.typeMismatch(expected: Extractable.self, actual: type(of: object))
        }
        guard let newObjectContext = context as? NewObjectContext else {
            throw OutlawError.typeMismatch(expected: NewObjectContext.self, actual: type(of: context))
        }
        
        var address = newObjectContext.newAddress2()
        address.street = try objectData.value(for: "street")
        address.city = try objectData.value(for: "city")
        
        return address
    }
}

extension Person2: ValueWithContext {
    static func value(from object: Any, using context: PersonContext) throws -> Person2 {
        guard let objectData = object as? Extractable else {
            throw OutlawError.typeMismatch(expected: Extractable.self, actual: type(of: object))
        }
        guard let newObjectContext = context as? NewObjectContext else {
            throw OutlawError.typeMismatch(expected: NewObjectContext.self, actual: type(of: context))
        }
        
        var person = newObjectContext.newPerson2()
        person.firstName = try objectData.value(for: "first")
        person.lastName = try objectData.value(for: "last")
        person.address = objectData.value(for: "address", using: newObjectContext)
        
        return person
    }
}
