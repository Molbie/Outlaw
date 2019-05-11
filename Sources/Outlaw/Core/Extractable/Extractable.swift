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
    func any(for key: Key) throws -> Any {
    #if swift(>=4.0)
        let pathComponents = key.outlawKey.split(separator: ".").map(String.init)
    #else
        let pathComponents = key.outlawKey.characters.split(separator: ".").map(String.init)
    #endif
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
    func value<V>(for key: Key) throws -> [V] {
        let any = try self.any(for: key)
        do {
            return try Array<V>.value(from: any)
        }
        catch let OutlawError.typeMismatch(expected: expected, actual: actual) {
            throw OutlawError.typeMismatchWithKey(key: key.outlawKey, expected: expected, actual: actual)
        }
    }
    
    func optional<V>(for key: Key) -> [V]? {
        return try? self.value(for: key)
    }
    
    func value<V>(for key: Key, or value: [V]) -> [V] {
        guard let result: [V] = self.optional(for: key) else { return value }
        return result
    }
}

// MARK: -
// MARK: Any Dictionary

public extension Extractable {
    func value<K, V>(for key: Key) throws -> [K: V] {
        let any = try self.any(for: key)
        do {
            return try Dictionary<K, V>.value(from: any)
        }
        catch let OutlawError.typeMismatch(expected: expected, actual: actual) {
            throw OutlawError.typeMismatchWithKey(key: key.outlawKey, expected: expected, actual: actual)
        }
    }
    
    func optional<K, V>(for key: Key) -> [K: V]? {
        return try? self.value(for: key)
    }
    
    func value<K, V>(for key: Key, or value: [K: V]) -> [K: V] {
        guard let result: [K: V] = self.optional(for: key) else { return value }
        return result
    }
}

// MARK: -
// MARK: Any Set

public extension Extractable {
    func value<V>(for key: Key) throws -> Set<V> {
        let any = try self.any(for: key)
        do {
            return try Set<V>.value(from: any)
        }
        catch let OutlawError.typeMismatch(expected: expected, actual: actual) {
            throw OutlawError.typeMismatchWithKey(key: key.outlawKey, expected: expected, actual: actual)
        }
    }
    
    func optional<V>(for key: Key) -> Set<V>? {
        return try? self.value(for: key)
    }
    
    func value<V>(for key: Key, or value: Set<V>) -> Set<V> {
        guard let result: Set<V> = self.optional(for: key) else { return value }
        return result
    }
}
