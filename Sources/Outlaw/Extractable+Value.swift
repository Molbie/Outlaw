//
//  Extractable+Value.swift
//  Outlaw
//
//  Created by Brian Mullen on 11/5/16.
//  Copyright © 2016 Molbie LLC. All rights reserved.
//

import Foundation


// MARK: -
// MARK: Value

public extension Extractable {
    public func value<V: Value>(for key: Key) throws -> V {
        let any = try self.any(for: key)
        do {
            guard let result = try V.value(from: any) as? V else {
                throw OutlawError.typeMismatchWithKey(key: key.outlawKey, expected: V.self, actual: any)
            }
            return result
        }
        catch let OutlawError.typeMismatch(expected: expected, actual: actual) {
            throw OutlawError.typeMismatchWithKey(key: key.outlawKey, expected: expected, actual: actual)
        }
    }
    
    public func value<V: Value>(for key: Key) -> V? {
        return try? self.value(for: key)
    }
    
    public func value<V: Value>(for key: Key, or value: V) -> V {
        guard let result: V = self.value(for: key) else { return value }
        return result
    }
}

// MARK: -
// MARK: Transform Value

public extension Extractable {
    public func value<V: Value, T>(for key: Key, with transform:(V) throws -> T) throws -> T {
        let rawValue: V = try self.value(for: key)
        return try transform(rawValue)
    }
    
    public func value<V: Value, T>(for key: Key, with transform:(V?) throws -> T) throws -> T {
        let rawValue: V? = self.value(for: key)
        return try transform(rawValue)
    }
    
    public func value<V: Value, T>(for key: Key, with transform:(V) -> T?) -> T? {
        guard let rawValue: V = try? self.value(for: key) else { return nil }
        return transform(rawValue)
    }
    
    public func value<V: Value, T>(for key: Key, with transform:(V?) -> T?) -> T? {
        let rawValue: V? = self.value(for: key)
        return transform(rawValue)
    }
}

// MARK: -
// MARK: Array of Value's

public extension Extractable {
    public func value<V: Value>(for key: Key) throws -> [V] {
        let any = try self.any(for: key)
        do {
            return try Array<V>.mappedValue(from: any)
        }
        catch let OutlawError.typeMismatch(expected: expected, actual: actual) {
            throw OutlawError.typeMismatchWithKey(key: key.outlawKey, expected: expected, actual: actual)
        }
    }
    
    public func value<V: Value>(for key: Key) -> [V]? {
        return try? self.value(for: key)
    }
    
    public func value<V: Value>(for key: Key, or value: [V]) -> [V] {
        guard let result: [V] = self.value(for: key) else { return value }
        return result
    }
}

// MARK: -
// MARK: Array of Transformed Value's

public extension Extractable {
    public func value<V: Value, T>(for key: Key, with transform:(V) throws -> T) throws -> [T] {
        let any = try self.any(for: key)
        do {
            return try Array<V>.mappedValue(from: any, with: transform)
        }
        catch let OutlawError.typeMismatch(expected: expected, actual: actual) {
            throw OutlawError.typeMismatchWithKey(key: key.outlawKey, expected: expected, actual: actual)
        }
    }
    
    public func value<V: Value, T>(for key: Key, with transform:(V) throws -> T) -> [T]? {
        return try? self.value(for: key, with: transform)
    }
    
    public func value<V: Value, T>(for key: Key, with transform:(V?) throws -> T) throws -> [T] {
        let any = try self.any(for: key)
        do {
            return try Array<V>.mappedValue(from: any, with: transform)
        }
        catch let OutlawError.typeMismatch(expected: expected, actual: actual) {
            throw OutlawError.typeMismatchWithKey(key: key.outlawKey, expected: expected, actual: actual)
        }
    }
    
    public func value<V: Value, T>(for key: Key, with transform:(V?) throws -> T) -> [T]? {
        return try? self.value(for: key, with: transform)
    }
}

// MARK: -
// MARK: Array of Optional Value's

public extension Extractable {
    public func value<V: Value>(for key: Key) throws -> [V?] {
        let any = try self.any(for: key)
        do {
            return try Array<V?>.mappedValue(from: any)
        }
        catch let OutlawError.typeMismatch(expected: expected, actual: actual) {
            throw OutlawError.typeMismatchWithKey(key: key.outlawKey, expected: expected, actual: actual)
        }
    }
    
    public func value<V: Value>(for key: Key) -> [V?]? {
        return try? self.value(for: key)
    }
    
    public func value<V: Value>(for key: Key, or value: [V?]) -> [V?] {
        guard let result: [V?] = self.value(for: key) else { return value }
        return result
    }
}

// MARK: -
// MARK: Array of Transformed Optional Value's

public extension Extractable {
    public func value<V: Value, T>(for key: Key, with transform:(V) -> T?) throws -> [T?] {
        let any = try self.any(for: key)
        do {
            return try Array<V>.mappedValue(from: any, with: transform)
        }
        catch let OutlawError.typeMismatch(expected: expected, actual: actual) {
            throw OutlawError.typeMismatchWithKey(key: key.outlawKey, expected: expected, actual: actual)
        }
    }
    
    public func value<V: Value, T>(for key: Key, with transform:(V) -> T?) -> [T?]? {
        return try? self.value(for: key, with: transform)
    }
    
    public func value<V: Value, T>(for key: Key, with transform:(V?) -> T?) throws -> [T?] {
        let any = try self.any(for: key)
        do {
            return try Array<V?>.mappedValue(from: any, with: transform)
        }
        catch let OutlawError.typeMismatch(expected: expected, actual: actual) {
            throw OutlawError.typeMismatchWithKey(key: key.outlawKey, expected: expected, actual: actual)
        }
    }
    
    public func value<V: Value, T>(for key: Key, with transform:(V?) -> T?) -> [T?]? {
        return try? self.value(for: key, with: transform)
    }
}

// MARK: -
// MARK: Dictionary of Value's

public extension Extractable {
    public func value<K, V: Value>(for key: Key) throws -> [K: V] {
        let any = try self.any(for: key)
        do {
            return try Dictionary<K, V>.mappedValue(from: any)
        }
        catch let OutlawError.typeMismatch(expected: expected, actual: actual) {
            throw OutlawError.typeMismatchWithKey(key: key.outlawKey, expected: expected, actual: actual)
        }
    }
    
    public func value<K, V: Value>(for key: Key) -> [K: V]? {
        return try? self.value(for: key)
    }
    
    public func value<K, V: Value>(for key: Key, or value: [K: V]) -> [K: V] {
        guard let result: [K: V] = self.value(for: key) else { return value }
        return result
    }
}

// MARK: -
// MARK: Dictionary of Transformed Value's

public extension Extractable {
    public func value<K, V: Value, T>(for key: Key, with transform:(V) throws -> T) throws -> [K: T] {
        let any = try self.any(for: key)
        do {
            return try Dictionary<K, V>.mappedValue(from: any, with: transform)
        }
        catch let OutlawError.typeMismatch(expected: expected, actual: actual) {
            throw OutlawError.typeMismatchWithKey(key: key.outlawKey, expected: expected, actual: actual)
        }
    }
    
    public func value<K, V: Value, T>(for key: Key, with transform:(V) throws -> T) -> [K: T]? {
        return try? self.value(for: key, with: transform)
    }
    
    public func value<K, V: Value, T>(for key: Key, with transform:(V?) throws -> T) throws -> [K: T] {
        let any = try self.any(for: key)
        do {
            return try Dictionary<K, V>.mappedValue(from: any, with: transform)
        }
        catch let OutlawError.typeMismatch(expected: expected, actual: actual) {
            throw OutlawError.typeMismatchWithKey(key: key.outlawKey, expected: expected, actual: actual)
        }
    }
    
    public func value<K, V: Value, T>(for key: Key, with transform:(V?) throws -> T) -> [K: T]? {
        return try? self.value(for: key, with: transform)
    }
}

// MARK: -
// MARK: Dictionary of Optional Value's

public extension Extractable {
    public func value<K, V: Value>(for key: Key) throws -> [K: V?] {
        let any = try self.any(for: key)
        do {
            return try Dictionary<K, V?>.mappedValue(from: any)
        }
        catch let OutlawError.typeMismatch(expected: expected, actual: actual) {
            throw OutlawError.typeMismatchWithKey(key: key.outlawKey, expected: expected, actual: actual)
        }
    }
    
    public func value<K, V: Value>(for key: Key) -> [K: V?]? {
        return try? self.value(for: key)
    }
    
    public func value<K, V: Value>(for key: Key, or value: [K: V?]) -> [K: V?] {
        guard let result: [K: V?] = self.value(for: key) else { return value }
        return result
    }
}

// MARK: -
// MARK: Dictionary of Transformed Optional Value's

public extension Extractable {
    public func value<K, V: Value, T>(for key: Key, with transform:(V) -> T?) throws -> [K: T?] {
        let any = try self.any(for: key)
        do {
            return try Dictionary<K, V?>.mappedValue(from: any, with: transform)
        }
        catch let OutlawError.typeMismatch(expected: expected, actual: actual) {
            throw OutlawError.typeMismatchWithKey(key: key.outlawKey, expected: expected, actual: actual)
        }
    }
    
    public func value<K, V: Value, T>(for key: Key, with transform:(V) -> T?) -> [K: T?]? {
        return try? self.value(for: key, with: transform)
    }
    
    public func value<K, V: Value, T>(for key: Key, with transform:(V?) -> T?) throws -> [K: T?] {
        let any = try self.any(for: key)
        do {
            return try Dictionary<K, V?>.mappedValue(from: any, with: transform)
        }
        catch let OutlawError.typeMismatch(expected: expected, actual: actual) {
            throw OutlawError.typeMismatchWithKey(key: key.outlawKey, expected: expected, actual: actual)
        }
    }
    
    public func value<K, V: Value, T>(for key: Key, with transform:(V?) -> T?) -> [K: T?]? {
        return try? self.value(for: key, with: transform)
    }
}

// MARK: -
// MARK: Set of Value's

public extension Extractable {
    public func value<V: Value>(for key: Key) throws -> Set<V> {
        let any = try self.any(for: key)
        do {
            return try Set<V>.mappedValue(from: any)
        }
        catch let OutlawError.typeMismatch(expected: expected, actual: actual) {
            throw OutlawError.typeMismatchWithKey(key: key.outlawKey, expected: expected, actual: actual)
        }
    }
    
    public func value<V: Value>(for key: Key) -> Set<V>? {
        return try? self.value(for: key)
    }
    
    public func value<V: Value>(for key: Key, or value: Set<V>) -> Set<V> {
        guard let result: Set<V> = self.value(for: key) else { return value }
        return result
    }
}

// MARK: -
// MARK: Set of Transformed Value's

public extension Extractable {
    public func value<V: Value & Hashable, T>(for key: Key, with transform:(V) throws -> T) throws -> Set<T> {
        let any = try self.any(for: key)
        do {
            return try Set<V>.mappedValue(from: any, with: transform)
        }
        catch let OutlawError.typeMismatch(expected: expected, actual: actual) {
            throw OutlawError.typeMismatchWithKey(key: key.outlawKey, expected: expected, actual: actual)
        }
    }
    
    public func value<V: Value & Hashable, T>(for key: Key, with transform:(V) throws -> T) -> Set<T>? {
        return try? self.value(for: key, with: transform)
    }
    
    public func value<V: Value & Hashable, T>(for key: Key, with transform:(V?) throws -> T) throws -> Set<T> {
        let any = try self.any(for: key)
        do {
            return try Set<V>.mappedValue(from: any, with: transform)
        }
        catch let OutlawError.typeMismatch(expected: expected, actual: actual) {
            throw OutlawError.typeMismatchWithKey(key: key.outlawKey, expected: expected, actual: actual)
        }
    }
    
    public func value<V: Value & Hashable, T>(for key: Key, with transform:(V?) throws -> T) -> Set<T>? {
        return try? self.value(for: key, with: transform)
    }
    
    public func value<V: Value & Hashable, T>(for key: Key, with transform:(V) -> T?) throws -> Set<T> {
        let any = try self.any(for: key)
        do {
            return try Set<V>.mappedValue(from: any, with: transform)
        }
        catch let OutlawError.typeMismatch(expected: expected, actual: actual) {
            throw OutlawError.typeMismatchWithKey(key: key.outlawKey, expected: expected, actual: actual)
        }
    }
    
    public func value<V: Value & Hashable, T>(for key: Key, with transform:(V) -> T?) -> Set<T>? {
        return try? self.value(for: key, with: transform)
    }
    
    public func value<V: Value & Hashable, T>(for key: Key, with transform:(V?) -> T?) throws -> Set<T> {
        let any = try self.any(for: key)
        do {
            return try Set<V>.mappedValue(from: any, with: transform)
        }
        catch let OutlawError.typeMismatch(expected: expected, actual: actual) {
            throw OutlawError.typeMismatchWithKey(key: key.outlawKey, expected: expected, actual: actual)
        }
    }
    
    public func value<V: Value & Hashable, T>(for key: Key, with transform:(V?) -> T?) -> Set<T>? {
        return try? self.value(for: key, with: transform)
    }
}
