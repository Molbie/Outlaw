//
//  Extractable.swift
//  Outlaw
//
//  Created by Brian Mullen on 11/5/16.
//  Copyright © 2016 Molbie LLC. All rights reserved.
//

import Foundation


public protocol Extractable {
    func any(for key: Key) throws -> Any
    func optionalAny(for key: Key) -> Any?
}

public extension Extractable {
    public func any(for key: Key) throws -> Any {
        let pathComponents = key.outlawKey.characters.split(separator: ".").map(String.init)
        var accumulator: Any = self
        
        for component in pathComponents {
            if let componentData = accumulator as? Extractable, let value = componentData.optionalAny(for: component) {
                accumulator = value
                continue
            }
            throw OutlawError.keyNotFound(key: key.outlawKey)
        }
        
        if let _ = accumulator as? NSNull {
            throw OutlawError.nullValueWithKey(key: key.outlawKey)
        }
        
        return accumulator
    }
}

// MARK: -
// MARK: Any Array

public extension Extractable {
    public func value<V>(for key: Key) throws -> [V] {
        let any = try self.any(for: key)
        do {
            return try Array<V>.value(from: any)
        }
        catch let OutlawError.typeMismatch(expected: expected, actual: actual) {
            throw OutlawError.typeMismatchWithKey(key: key.outlawKey, expected: expected, actual: actual)
        }
    }
    
    public func value<V>(for key: Key) -> [V]? {
        return try? self.value(for: key)
    }
}

// MARK: -
// MARK: Any Dictionary

public extension Extractable {
    public func value<K, V>(for key: Key) throws -> [K: V] {
        let any = try self.any(for: key)
        do {
            return try Dictionary<K, V>.value(from: any)
        }
        catch let OutlawError.typeMismatch(expected: expected, actual: actual) {
            throw OutlawError.typeMismatchWithKey(key: key.outlawKey, expected: expected, actual: actual)
        }
    }
    
    public func value<K, V>(for key: Key) -> [K: V]? {
        return try? self.value(for: key)
    }
}

// MARK: -
// MARK: Any Set

public extension Extractable {
    public func value<V>(for key: Key) throws -> Set<V> {
        let any = try self.any(for: key)
        do {
            return try Set<V>.value(from: any)
        }
        catch let OutlawError.typeMismatch(expected: expected, actual: actual) {
            throw OutlawError.typeMismatchWithKey(key: key.outlawKey, expected: expected, actual: actual)
        }
    }
    
    public func value<V>(for key: Key) -> Set<V>? {
        return try? self.value(for: key)
    }
}
