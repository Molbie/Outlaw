//
//  Dictionary+Value.swift
//  Outlaw
//
//  Created by Brian Mullen on 11/6/16.
//  Copyright © 2016 Molbie LLC. All rights reserved.
//

import Foundation


public extension Dictionary {
    public static func mappedValue<Value: Outlaw.Value>(from object: Any) throws -> [Key: Value] {
        guard let anyDictionary = object as? [Key: Any] else {
            throw OutlawError.typeMismatch(expected: self, actual: type(of: object))
        }
        
        return try anyDictionary.map { (key, anyValue) in
            let value = try Value.value(from: anyValue)
            guard let element = value as? Value else {
                throw OutlawError.typeMismatch(expected: Value.self, actual: type(of: value))
            }
            return (key, element)
        }
    }
    
    public static func mappedValue<Value: Outlaw.Value>(from object: Any) throws -> [Key: Value?] {
        guard let anyDictionary = object as? [Key: Any?] else {
            throw OutlawError.typeMismatch(expected: self, actual: type(of: object))
        }
        
        return anyDictionary.map { (key, anyValue) in
            guard let rawAnyValue = anyValue else { return (key, nil) }
            let value = try? Value.value(from: rawAnyValue)
            return (key, value as? Value)
        }
    }
}

// MARK: -
// MARK: Transforms

public extension Dictionary {
    public static func mappedValue<Value: Outlaw.Value, T>(from object: Any, with transform:(Value) throws -> T) throws -> [Key: T] {
        guard let anyDictionary = object as? [Key: Any] else {
            throw OutlawError.typeMismatch(expected: self, actual: type(of: object))
        }
        
        return try anyDictionary.map { (key, anyValue) in
            let value = try Value.value(from: anyValue)
            guard let element = value as? Value else {
                throw OutlawError.typeMismatch(expected: Value.self, actual: type(of: object))
            }
            return (key, try transform(element))
        }
    }
    
    public static func mappedValue<Value: Outlaw.Value, T>(from object: Any, with transform:(Value?) throws -> T) throws -> [Key: T] {
        guard let anyDictionary = object as? [Key: Any?] else {
            throw OutlawError.typeMismatch(expected: self, actual: type(of: object))
        }
        
        return try anyDictionary.map { (key, anyValue) in
            guard let rawValue = anyValue else { return (key, try transform(nil)) }
            let value = try? Value.value(from: rawValue)
            return (key, try transform(value as? Value))
        }
    }
    
    public static func mappedValue<Value: Outlaw.Value, T>(from object: Any, with transform:(Value) -> T?) throws -> [Key: T?] {
        guard let anyDictionary = object as? [Key: Any?] else {
            throw OutlawError.typeMismatch(expected: self, actual: type(of: object))
        }
        
        return anyDictionary.map { (key, anyValue) in
            guard let rawValue = anyValue else { return (key, nil) }
            let value = try? Value.value(from: rawValue)
            
            guard let element = value as? Value else { return (key, nil) }
            return (key, transform(element))
        }
    }
    
    public static func mappedValue<Value: Outlaw.Value, T>(from object: Any, with transform:(Value?) -> T?) throws -> [Key: T?] {
        guard let anyDictionary = object as? [Key: Any?] else {
            throw OutlawError.typeMismatch(expected: self, actual: type(of: object))
        }
        
        return anyDictionary.map { (key, anyValue) in
            guard let rawValue = anyValue else { return (key, transform(nil)) }
            let value = try? Value.value(from: rawValue)
            
            return (key, transform(value as? Value))
        }
    }
}
