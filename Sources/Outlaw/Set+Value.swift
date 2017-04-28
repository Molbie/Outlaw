//
//  Set+Value.swift
//  Outlaw
//
//  Created by Brian Mullen on 11/9/16.
//  Copyright © 2016 Molbie LLC. All rights reserved.
//

import Foundation


public extension Set {
    public static func mappedValue<Element: Value>(from object: Any) throws -> Set<Element> {
        let anyArray: [Element] = try [Element].mappedValue(from: object)
        return Set<Element>(anyArray)
    }
}

// MARK: -
// MARK: Transforms

public extension Set {
    public static func mappedValue<Element: Value, T>(from object: Any, with transform:(Element) throws -> T) throws -> Set<T> {
        let anyArray: [T] = try [Element].mappedValue(from: object, with: transform)
        return Set<T>(anyArray)
    }
    
    public static func mappedValue<Element: Value, T>(from object: Any, with transform:(Element?) throws -> T) throws -> Set<T> {
        let anyArray: [T?] = try [Element?].mappedValue(from: object, with: transform)
        return Set<T>(anyArray.flatMap { $0 })
    }
    
    public static func mappedValue<Element: Value, T>(from object: Any, with transform:(Element) -> T?) throws -> Set<T> {
        let anyArray: [T?] = try [Element?].mappedValue(from: object, with: transform)
        return Set<T>(anyArray.flatMap { $0 })
    }
    
    public static func mappedValue<Element: Value, T>(from object: Any, with transform:(Element?) -> T?) throws -> Set<T> {
        let anyArray: [T?] = try [Element?].mappedValue(from: object, with: transform)
        return Set<T>(anyArray.flatMap { $0 })
    }
}
