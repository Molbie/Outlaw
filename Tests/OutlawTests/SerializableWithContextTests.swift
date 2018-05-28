//
//  SerializableWithContextTests.swift
//  Outlaw
//
//  Created by Brian Mullen on 11/15/16.
//  Copyright © 2016 Molbie LLC. All rights reserved.
//

import XCTest
@testable import Outlaw


class SerializableWithContextTests: OutlawTestCase {
    static var allTests = [("testValue", testValue),
                           ("testValueNoAddress", testValueNoAddress),
                           ("testValueExcludeAddress", testValueExcludeAddress)]
    
    override func setUp() {
        super.setUp()
        
        data = jsonData(for: "ObjectTests")
    }
    
    func testValue() {
        let context = SomePersonContextIncludeAddress()
        let personData = data["personWithAddress"] as! [String: Any]
        let person = try! Person(object: personData)
        let serializedData = person.serialized(using: context)
        
        XCTAssertEqual(personData["first"] as! String, serializedData["first"] as! String)
        XCTAssertEqual(personData["last"] as! String, serializedData["last"] as! String)
        XCTAssertEqual((personData["address"] as! [String: Any])["street"] as! String, (serializedData["address"] as! [String: Any])["street"] as! String)
        XCTAssertEqual((personData["address"] as! [String: Any])["city"] as! String, (serializedData["address"] as! [String: Any])["city"] as! String)
    }
    
    func testValueNoAddress() {
        let context = SomePersonContextIncludeAddress()
        let personData = data["personNoAddress"] as! [String: Any]
        let person = try! Person(object: personData)
        let serializedData = person.serialized(using: context)
        
        XCTAssertEqual(personData["first"] as! String, serializedData["first"] as! String)
        XCTAssertEqual(personData["last"] as! String, serializedData["last"] as! String)
        XCTAssertNil(personData["address"])
        XCTAssertNotNil(serializedData["address"])
        XCTAssertNil((serializedData["address"] as! [String: Any])["street"])
        XCTAssertNil((serializedData["address"] as! [String: Any])["city"])
    }
    
    func testValueExcludeAddress() {
        let context = SomePersonContextExcludeAddress()
        let personData = data["personWithAddress"] as! [String: Any]
        let person = try! Person(object: personData)
        let serializedData = person.serialized(using: context)
        
        XCTAssertEqual(personData["first"] as! String, serializedData["first"] as! String)
        XCTAssertEqual(personData["last"] as! String, serializedData["last"] as! String)
        XCTAssertNil(serializedData["address"])
    }
}

// MARK: -
// MARK: Types

extension Address: SerializableWithContext {
    typealias Context = AddressContext
    
    func serialized(using context: AddressContext) -> [String: Any] {
        return ["street": street,"city": city]
    }
}

extension Person: SerializableWithContext {
    typealias Context = PersonContext
    
    func serialized(using context: PersonContext) -> [String: Any] {
        var result: [String: Any] = ["first": firstName,"last": lastName]
        
        if context is PersonContextIncludeAddress {
            if let address = address {
                result["address"] = address.serialized(using: context as! AddressContext)
            }
            else {
                result["address"] = [String: Any]()
            }
        }
        
        return result
    }
}
