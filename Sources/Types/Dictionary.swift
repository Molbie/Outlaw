//
//  Dictionary.swift
//  Outlaw
//
//  Created by Brian Mullen on 11/18/16.
//  Copyright © 2016 Molbie LLC. All rights reserved.
//

import Foundation


public extension Dictionary {
    public static func value(from object: Any) throws -> [Key: Value] {
        guard let value = object as? [Key: Value] else {
            throw OutlawError.typeMismatch(expected: self, actual: type(of: object))
        }
        
        return value
    }
    
    public static func value(from object: Any) throws -> [Key: Value?] {
        guard let anyDictionary = object as? [Key: Any?] else {
            throw OutlawError.typeMismatch(expected: self, actual: type(of: object))
        }
        
        return anyDictionary.map { (key, anyValue) in
            return (key, anyValue as? Value)
        }
    }
}

// MARK: -
// MARK: Transforms

public extension Dictionary {
    public static func value<T>(from object: Any, with transform:(Value) throws -> T) throws -> [Key: T] {
        guard let anyDictionary = object as? [Key: Value] else {
            throw OutlawError.typeMismatch(expected: self, actual: type(of: object))
        }
        
        return try anyDictionary.map { (key, anyValue) in
            return (key, try transform(anyValue))
        }
    }
    
    public static func value<T>(from object: Any, with transform:(Value?) throws -> T) throws -> [Key: T] {
        guard let anyDictionary = object as? [Key: Value?] else {
            throw OutlawError.typeMismatch(expected: self, actual: type(of: object))
        }
        
        return try anyDictionary.map { (key, anyValue) in
            return (key, try transform(anyValue))
        }
    }
    
    public static func value<T>(from object: Any, with transform:(Value) -> T?) throws -> [Key: T?] {
        guard let anyDictionary = object as? [Key: Value?] else {
            throw OutlawError.typeMismatch(expected: self, actual: type(of: object))
        }
        
        return anyDictionary.map { (key, anyValue) in
            guard let rawValue = anyValue else { return (key, nil) }
            return (key, transform(rawValue))
        }
    }
    
    public static func value<T>(from object: Any, with transform:(Value?) -> T?) throws -> [Key: T?] {
        guard let anyDictionary = object as? [Key: Value?] else {
            throw OutlawError.typeMismatch(expected: self, actual: type(of: object))
        }
        
        return anyDictionary.map { (key, anyValue) in
            return (key, transform(anyValue))
        }
    }
}
