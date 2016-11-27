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
    public func jsonUrl(for resource: String) -> URL? {
        guard let path = Bundle(for: OutlawTestCase.self).path(forResource: resource, ofType: "json") else { return nil }
        
        return URL(fileURLWithPath: path)
    }
    
    public func jsonData(for resource: String) -> [String: Any] {
        guard let url = jsonUrl(for: resource) else { return [:] }
        return try! JSON.value(from: url)
    }
    
    public var data: [String: Any]!
    
    public override func setUp() {
        super.setUp()
        
        data = jsonData(for: "\(type(of: self))")
    }
}
