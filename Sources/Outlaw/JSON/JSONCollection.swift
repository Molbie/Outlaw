//
//  JSONCollection.swift
//  Outlaw
//
//  Created by Brian Mullen on 11/26/16.
//  Copyright © 2016 Molbie LLC. All rights reserved.
//

import Foundation


public protocol JSONCollection {
    func isValidJson() -> Bool
    func jsonData() throws -> Data
}

extension JSONCollection {
    public func isValidJson() -> Bool {
        let collection = self
        return JSON.isValid(collection)
    }
    
    public func jsonData() throws -> Data {
        let collection = self
        return try JSON.data(from: collection)
    }
}

extension Dictionary: JSONCollection {}
extension NSDictionary: JSONCollection {}
extension Array: JSONCollection {}
extension NSArray: JSONCollection {}
extension Set: JSONCollection {}
extension NSSet: JSONCollection {}
