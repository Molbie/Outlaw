//
//  Array+Value.swift
//  Outlaw
//
//  Created by Brian Mullen on 11/6/16.
//  Copyright © 2016 Molbie LLC. All rights reserved.
//

import Foundation


public extension Array {
    public static func mappedValue<Element: Value>(from object: Any) throws -> [Element] {
        guard let anyArray = object as? [Any] else {
            throw OutlawError.typeMismatch(expected: self, actual: type(of: object))
        }
        
        return try anyArray.map {
            let value = try Element.value(from: $0)
            guard let element = value as? Element else {
                throw OutlawError.typeMismatch(expected: Element.self, actual: type(of: object))
            }
            return element
        }
    }
    
    public static func mappedValue<Element: Value>(from object: Any) throws -> [Element?] {
        guard let anyArray = object as? [Any?] else {
            throw OutlawError.typeMismatch(expected: self, actual: type(of: object))
        }
        
        return anyArray.map {
            guard let rawValue = $0 else { return nil }
            let value = try? Element.value(from: rawValue)
            return value as? Element
        }
    }
}

// MARK: -
// MARK: Transforms

public extension Array {
    public static func mappedValue<Element: Value, T>(from object: Any, with transform:(Element) throws -> T) throws -> [T] {
        guard let anyArray = object as? [Any] else {
            throw OutlawError.typeMismatch(expected: self, actual: type(of: object))
        }
        
        return try anyArray.map {
            let value = try Element.value(from: $0)
            guard let element = value as? Element else {
                throw OutlawError.typeMismatch(expected: Element.self, actual: type(of: object))
            }
            return try transform(element)
        }
    }
    
    public static func mappedValue<Element: Value, T>(from object: Any, with transform:(Element?) throws -> T) throws -> [T] {
        guard let anyArray = object as? [Any?] else {
            throw OutlawError.typeMismatch(expected: self, actual: type(of: object))
        }
        
        return try anyArray.map {
            guard let rawValue = $0 else { return try transform(nil) }
            let value = try? Element.value(from: rawValue)
            return try transform(value as? Element)
        }
    }
    
    public static func mappedValue<Element: Value, T>(from object: Any, with transform:(Element) -> T?) throws -> [T?] {
        guard let anyArray = object as? [Any?] else {
            throw OutlawError.typeMismatch(expected: self, actual: type(of: object))
        }
        
        return anyArray.map {
            guard let rawValue = $0 else { return nil }
            let value = try? Element.value(from: rawValue)
            
            guard let element = value as? Element else { return nil }
            return transform(element)
        }
    }
    
    public static func mappedValue<Element: Value, T>(from object: Any, with transform:(Element?) -> T?) throws -> [T?] {
        guard let anyArray = object as? [Any?] else {
            throw OutlawError.typeMismatch(expected: self, actual: type(of: object))
        }
        
        return anyArray.map {
            guard let rawValue = $0 else { return transform(nil) }
            let value = try? Element.value(from: rawValue)
            
            return transform(value as? Element)
        }
    }
}
