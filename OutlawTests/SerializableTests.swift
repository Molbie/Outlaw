//
//  SerializableTests.swift
//  Outlaw
//
//  Created by Brian Mullen on 11/15/16.
//  Copyright © 2016 Molbie LLC. All rights reserved.
//

import XCTest
@testable import Outlaw


class SerializableTests: OutlawTestCase {
    lazy var data = OutlawTestCase.jsonData(for: "ObjectTests")
    
    func testValue() {
        let personData = data["personWithAddress"] as! [String: Any]
        let person = try! Person(object: personData)
        let serializedData = person.serialized()
        XCTAssertEqual(personData["first"] as! String, serializedData["first"] as! String)
        XCTAssertEqual(personData["last"] as! String, serializedData["last"] as! String)
        XCTAssertEqual((personData["address"] as! [String: Any])["street"] as! String, (serializedData["address"] as! [String: Any])["street"] as! String)
        XCTAssertEqual((personData["address"] as! [String: Any])["city"] as! String, (serializedData["address"] as! [String: Any])["city"] as! String)
    }
    
    func testValueNoAddress() {
        let personData = data["personNoAddress"] as! [String: Any]
        let person = try! Person(object: personData)
        let serializedData = person.serialized()
        XCTAssertEqual(personData["first"] as! String, serializedData["first"] as! String)
        XCTAssertEqual(personData["last"] as! String, serializedData["last"] as! String)
        XCTAssertNil(personData["address"])
        XCTAssertNil(serializedData["address"])
    }
}

// MARK: -
// MARK: Types

extension Address: Outlaw.Serializable {
    func serialized() -> [String: Any] {
        return ["street": street,"city": city]
    }
}
extension Person: Outlaw.Serializable {
    func serialized() -> [String: Any] {
        var result: [String: Any] = ["first": firstName,"last": lastName]
        if let address = address {
            result["address"] = address.serialized()
        }
        return result
    }
}
