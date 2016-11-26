//
//  Array.swift
//  Outlaw
//
//  Created by Brian Mullen on 11/18/16.
//  Copyright © 2016 Molbie LLC. All rights reserved.
//

import Foundation


public extension Array {
    public static func value(from object: Any) throws -> [Element] {
        guard let value = object as? Array<Element> else {
            throw OutlawError.typeMismatch(expected: self, actual: type(of: object))
        }
        
        return value
    }
    
    public static func value(from object: Any) throws -> [Element?] {
        guard let anyArray = object as? [Any?] else {
            throw OutlawError.typeMismatch(expected: self, actual: type(of: object))
        }
        
        return anyArray.map { $0 as? Element }
    }
}

// MARK: -
// MARK: Transforms

public extension Array {
    public static func value<T>(from object: Any, with transform:(Element) throws -> T) throws -> [T] {
        guard let elementArray = object as? Array<Element> else {
            throw OutlawError.typeMismatch(expected: self, actual: type(of: object))
        }
        
        return try elementArray.map { try transform($0) }
    }
    
    public static func value<T>(from object: Any, with transform:(Element?) throws -> T) throws -> [T] {
        guard let elementArray = object as? Array<Element?> else {
            throw OutlawError.typeMismatch(expected: self, actual: type(of: object))
        }
        
        return try elementArray.map { try transform($0) }
    }
    
    public static func value<T>(from object: Any, with transform:(Element) -> T?) throws -> [T?] {
        guard let elementArray = object as? Array<Element?> else {
            throw OutlawError.typeMismatch(expected: self, actual: type(of: object))
        }
        
        return elementArray.map {
            guard let rawValue = $0 else { return nil }
            return transform(rawValue)
        }
    }
    
    public static func value<T>(from object: Any, with transform:(Element?) -> T?) throws -> [T?] {
        guard let elementArray = object as? Array<Element?> else {
            throw OutlawError.typeMismatch(expected: self, actual: type(of: object))
        }
        
        return elementArray.map { return transform($0) }
    }
}
