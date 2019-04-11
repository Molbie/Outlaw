//
//  Set.swift
//  Outlaw
//
//  Created by Brian Mullen on 11/18/16.
//  Copyright © 2016 Molbie LLC. All rights reserved.
//

import Foundation


public extension Set {
    static func value(from object: Any) throws -> Set<Element> {
        let anyArray: [Element] = try [Element].value(from: object)
        return Set<Element>(anyArray)
    }
}

// MARK: -
// MARK: Transforms

public extension Set {
    static func value<T>(from object: Any, with transform:(Element) throws -> T) throws -> Set<T> {
        guard let elementArray = object as? Array<Element> else {
            throw OutlawError.typeMismatch(expected: self, actual: type(of: object))
        }
        
        let transformedArray = try elementArray.map { try transform($0) }
        return Set<T>(transformedArray)
    }
    
    static func value<T>(from object: Any, with transform:(Element?) throws -> T) throws -> Set<T> {
        guard let elementArray = object as? Array<Element?> else {
            throw OutlawError.typeMismatch(expected: self, actual: type(of: object))
        }
        
        let transformedArray = try elementArray.map { try transform($0) }
        return Set<T>(transformedArray)
    }
    
    static func value<T>(from object: Any, with transform:(Element) -> T?) throws -> Set<T> {
        guard let elementArray = object as? Array<Element?> else {
            throw OutlawError.typeMismatch(expected: self, actual: type(of: object))
        }
        
        let array: [Element] = elementArray.compactMap { $0 }
        let transformedArray: [T?] = array.map { transform($0) }
        return Set<T>(transformedArray.compactMap { $0 })
    }
    
    static func value<T>(from object: Any, with transform:(Element?) -> T?) throws -> Set<T> {
        guard let elementArray = object as? Array<Element?> else {
            throw OutlawError.typeMismatch(expected: self, actual: type(of: object))
        }
        
        let transformedArray: [T?] = elementArray.map { transform($0) }
        return Set<T>(transformedArray.compactMap { $0 })
    }
}
