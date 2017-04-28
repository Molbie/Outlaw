//
//  Dictionary+ValueWithContext.swift
//  Outlaw
//
//  Created by Brian Mullen on 11/15/16.
//  Copyright © 2016 Molbie LLC. All rights reserved.
//

import Foundation


public extension Dictionary {
    public static func mappedValue<Value: ValueWithContext>(from object: Any, using context: Value.Context) throws -> [Key: Value] {
        guard let anyDictionary = object as? [Key: Any] else {
            throw OutlawError.typeMismatch(expected: self, actual: type(of: object))
        }
        
        return try anyDictionary.map { (key, anyValue) in
            let value = try Value.value(from: anyValue, using: context)
            guard let element = value as? Value else {
                throw OutlawError.typeMismatch(expected: Value.self, actual: type(of: value))
            }
            return (key, element)
        }
    }
    
    public static func mappedValue<Value: ValueWithContext>(from object: Any, using context: Value.Context) throws -> [Key: Value?] {
        guard let anyDictionary = object as? [Key: Any?] else {
            throw OutlawError.typeMismatch(expected: self, actual: type(of: object))
        }
        
        return anyDictionary.map { (key, anyValue) in
            guard let rawAnyValue = anyValue else { return (key, nil) }
            let value = try? Value.value(from: rawAnyValue, using: context)
            return (key, value as? Value)
        }
    }
}

// MARK: -
// MARK: Transforms

public extension Dictionary {
    public static func mappedValue<Value: ValueWithContext, T>(from object: Any, using context: Value.Context, with transform:(Value, Value.Context) throws -> T) throws -> [Key: T] {
        guard let anyDictionary = object as? [Key: Any] else {
            throw OutlawError.typeMismatch(expected: self, actual: type(of: object))
        }
        
        return try anyDictionary.map { (key, anyValue) in
            let value = try Value.value(from: anyValue, using: context)
            guard let element = value as? Value else {
                throw OutlawError.typeMismatch(expected: Value.self, actual: type(of: object))
            }
            return (key, try transform(element, context))
        }
    }
    
    public static func mappedValue<Value: ValueWithContext, T>(from object: Any, using context: Value.Context, with transform:(Value?, Value.Context) throws -> T) throws -> [Key: T] {
        guard let anyDictionary = object as? [Key: Any?] else {
            throw OutlawError.typeMismatch(expected: self, actual: type(of: object))
        }
        
        return try anyDictionary.map { (key, anyValue) in
            guard let rawValue = anyValue else { return (key, try transform(nil, context)) }
            let value = try? Value.value(from: rawValue, using: context)
            return (key, try transform(value as? Value, context))
        }
    }
    
    public static func mappedValue<Value: ValueWithContext, T>(from object: Any, using context: Value.Context, with transform:(Value, Value.Context) -> T?) throws -> [Key: T?] {
        guard let anyDictionary = object as? [Key: Any?] else {
            throw OutlawError.typeMismatch(expected: self, actual: type(of: object))
        }
        
        return anyDictionary.map { (key, anyValue) in
            guard let rawValue = anyValue else { return (key, nil) }
            let value = try? Value.value(from: rawValue, using: context)
            
            guard let element = value as? Value else { return (key, nil) }
            return (key, transform(element, context))
        }
    }
    
    public static func mappedValue<Value: ValueWithContext, T>(from object: Any, using context: Value.Context, with transform:(Value?, Value.Context) -> T?) throws -> [Key: T?] {
        guard let anyDictionary = object as? [Key: Any?] else {
            throw OutlawError.typeMismatch(expected: self, actual: type(of: object))
        }
        
        return anyDictionary.map { (key, anyValue) in
            guard let rawValue = anyValue else { return (key, transform(nil, context)) }
            let value = try? Value.value(from: rawValue, using: context)
            
            return (key, transform(value as? Value, context))
        }
    }
}
