//
//  XCTestCase+JSON.swift
//  Outlaw
//
//  Created by Brian Mullen on 11/26/16.
//  Copyright © 2016 Molbie LLC. All rights reserved.
//

import XCTest
@testable import Outlaw


public class OutlawTestCase: XCTestCase {
    public static func jsonUrl(for resource: String) -> URL {
        let path = Bundle(for: OutlawTestCase.self).path(forResource: resource, ofType: "json")!
        return URL(fileURLWithPath: path)
    }
    
    public static func jsonData(for resource: String) -> [String: Any] {
        let url = jsonUrl(for: resource)
        return try! JSON.value(from: url)
    }
}
