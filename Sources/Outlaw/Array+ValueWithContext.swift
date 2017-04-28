//
//  Array+ValueWithContext.swift
//  Outlaw
//
//  Created by Brian Mullen on 11/15/16.
//  Copyright © 2016 Molbie LLC. All rights reserved.
//

import Foundation


public extension Array {
    public static func mappedValue<Element: ValueWithContext>(from object: Any, using context: Element.Context) throws -> [Element] {
        guard let anyArray = object as? [Any] else {
            throw OutlawError.typeMismatch(expected: self, actual: type(of: object))
        }
        
        return try anyArray.map {
            let value = try Element.value(from: $0, using: context)
            guard let element = value as? Element else {
                throw OutlawError.typeMismatch(expected: Element.self, actual: type(of: object))
            }
            return element
        }
    }
    
    public static func mappedValue<Element: ValueWithContext>(from object: Any, using context: Element.Context) throws -> [Element?] {
        guard let anyArray = object as? [Any?] else {
            throw OutlawError.typeMismatch(expected: self, actual: type(of: object))
        }
        
        return anyArray.map {
            guard let rawValue = $0 else { return nil }
            let value = try? Element.value(from: rawValue, using: context)
            return value as? Element
        }
    }
}

// MARK: -
// MARK: Transforms

public extension Array {
    public static func mappedValue<Element: ValueWithContext, T>(from object: Any, using context: Element.Context, with transform:(Element, Element.Context) throws -> T) throws -> [T] {
        guard let anyArray = object as? [Any] else {
            throw OutlawError.typeMismatch(expected: self, actual: type(of: object))
        }
        
        return try anyArray.map {
            let value = try Element.value(from: $0, using: context)
            guard let element = value as? Element else {
                throw OutlawError.typeMismatch(expected: Element.self, actual: type(of: object))
            }
            return try transform(element, context)
        }
    }
    
    public static func mappedValue<Element: ValueWithContext, T>(from object: Any, using context: Element.Context, with transform:(Element?, Element.Context) throws -> T) throws -> [T] {
        guard let anyArray = object as? [Any?] else {
            throw OutlawError.typeMismatch(expected: self, actual: type(of: object))
        }
        
        return try anyArray.map {
            guard let rawValue = $0 else { return try transform(nil, context) }
            let value = try? Element.value(from: rawValue, using: context)
            return try transform(value as? Element, context)
        }
    }
    
    public static func mappedValue<Element: ValueWithContext, T>(from object: Any, using context: Element.Context, with transform:(Element, Element.Context) -> T?) throws -> [T?] {
        guard let anyArray = object as? [Any?] else {
            throw OutlawError.typeMismatch(expected: self, actual: type(of: object))
        }
        
        return anyArray.map {
            guard let rawValue = $0 else { return nil }
            let value = try? Element.value(from: rawValue, using: context)
            
            guard let element = value as? Element else { return nil }
            return transform(element, context)
        }
    }
    
    public static func mappedValue<Element: ValueWithContext, T>(from object: Any, using context: Element.Context, with transform:(Element?, Element.Context) -> T?) throws -> [T?] {
        guard let anyArray = object as? [Any?] else {
            throw OutlawError.typeMismatch(expected: self, actual: type(of: object))
        }
        
        return anyArray.map {
            guard let rawValue = $0 else { return transform(nil, context) }
            let value = try? Element.value(from: rawValue, using: context)
            
            return transform(value as? Element, context)
        }
    }
}
