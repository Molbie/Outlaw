//
//  Set+ValueWithContext.swift
//  Outlaw
//
//  Created by Brian Mullen on 11/15/16.
//  Copyright © 2016 Molbie LLC. All rights reserved.
//

import Foundation


public extension Set {
    public static func mappedValue<Element: ValueWithContext>(from object: Any, using context: Element.Context) throws -> Set<Element> {
        let anyArray: [Element] = try [Element].mappedValue(from: object, using: context)
        return Set<Element>(anyArray)
    }
}

// MARK: -
// MARK: Transforms

public extension Set {
    public static func mappedValue<Element: ValueWithContext, T>(from object: Any, using context: Element.Context, with transform:(Element, Element.Context) throws -> T) throws -> Set<T> {
        let anyArray: [T] = try [Element].mappedValue(from: object, using: context, with: transform)
        return Set<T>(anyArray)
    }
    
    public static func mappedValue<Element: ValueWithContext, T>(from object: Any, using context: Element.Context, with transform:(Element?, Element.Context) throws -> T) throws -> Set<T> {
        let anyArray: [T?] = try [Element?].mappedValue(from: object, using: context, with: transform)
        return Set<T>(anyArray.flatMap { $0 })
    }
    
    public static func mappedValue<Element: ValueWithContext, T>(from object: Any, using context: Element.Context, with transform:(Element, Element.Context) -> T?) throws -> Set<T> {
        let anyArray: [T?] = try [Element?].mappedValue(from: object, using: context, with: transform)
        return Set<T>(anyArray.flatMap { $0 })
    }
    
    public static func mappedValue<Element: ValueWithContext, T>(from object: Any, using context: Element.Context, with transform:(Element?, Element.Context) -> T?) throws -> Set<T> {
        let anyArray: [T?] = try [Element?].mappedValue(from: object, using: context, with: transform)
        return Set<T>(anyArray.flatMap { $0 })
    }
}
