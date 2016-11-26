//
//  IndexExtractable+Value.swift
//  Outlaw
//
//  Created by Brian Mullen on 11/23/16.
//  Copyright © 2016 Molbie LLC. All rights reserved.
//

import Foundation


// MARK: -
// MARK: Value

public extension Outlaw.IndexExtractable {
    public func value<V: Outlaw.Value>(for index: Outlaw.Index) throws -> V {
        let any = try self.any(for: index)
        do {
            guard let result = try V.value(from: any) as? V else {
                throw OutlawError.typeMismatchWithIndex(index: index.outlawIndex, expected: V.self, actual: any)
            }
            return result
        }
        catch let OutlawError.typeMismatch(expected: expected, actual: actual) {
            throw OutlawError.typeMismatchWithIndex(index: index.outlawIndex, expected: expected, actual: actual)
        }
    }
    
    public func value<V: Outlaw.Value>(for index: Outlaw.Index) -> V? {
        return try? self.value(for: index)
    }
}

// MARK: -
// MARK: Transform Value

public extension Outlaw.IndexExtractable {
    public func value<V: Outlaw.Value, T>(for index: Outlaw.Index, with transform:(V) throws -> T) throws -> T {
        let rawValue: V = try self.value(for: index)
        return try transform(rawValue)
    }
    
    public func value<V: Outlaw.Value, T>(for index: Outlaw.Index, with transform:(V?) throws -> T) throws -> T {
        let rawValue: V? = self.value(for: index)
        return try transform(rawValue)
    }
    
    public func value<V: Outlaw.Value, T>(for index: Outlaw.Index, with transform:(V) -> T?) -> T? {
        guard let rawValue: V = try? self.value(for: index) else { return nil }
        return transform(rawValue)
    }
    
    public func value<V: Outlaw.Value, T>(for index: Outlaw.Index, with transform:(V?) -> T?) -> T? {
        let rawValue: V? = self.value(for: index)
        return transform(rawValue)
    }
}

// MARK: -
// MARK: Array of Value's

public extension Outlaw.IndexExtractable {
    public func value<V: Outlaw.Value>(for index: Outlaw.Index) throws -> [V] {
        let any = try self.any(for: index)
        do {
            return try Array<V>.mappedValue(from: any)
        }
        catch let OutlawError.typeMismatch(expected: expected, actual: actual) {
            throw OutlawError.typeMismatchWithIndex(index: index.outlawIndex, expected: expected, actual: actual)
        }
    }
    
    public func value<V: Outlaw.Value>(for index: Outlaw.Index) -> [V]? {
        return try? self.value(for: index)
    }
}

// MARK: -
// MARK: Array of Transformed Value's

public extension Outlaw.IndexExtractable {
    public func value<V: Outlaw.Value, T>(for index: Outlaw.Index, with transform:(V) throws -> T) throws -> [T] {
        let any = try self.any(for: index)
        do {
            return try Array<V>.mappedValue(from: any, with: transform)
        }
        catch let OutlawError.typeMismatch(expected: expected, actual: actual) {
            throw OutlawError.typeMismatchWithIndex(index: index.outlawIndex, expected: expected, actual: actual)
        }
    }
    
    public func value<V: Outlaw.Value, T>(for index: Outlaw.Index, with transform:(V) throws -> T) -> [T]? {
        return try? self.value(for: index, with: transform)
    }
    
    public func value<V: Outlaw.Value, T>(for index: Outlaw.Index, with transform:(V?) throws -> T) throws -> [T] {
        let any = try self.any(for: index)
        do {
            return try Array<V>.mappedValue(from: any, with: transform)
        }
        catch let OutlawError.typeMismatch(expected: expected, actual: actual) {
            throw OutlawError.typeMismatchWithIndex(index: index.outlawIndex, expected: expected, actual: actual)
        }
    }
    
    public func value<V: Outlaw.Value, T>(for index: Outlaw.Index, with transform:(V?) throws -> T) -> [T]? {
        return try? self.value(for: index, with: transform)
    }
}

// MARK: -
// MARK: Array of Optional Value's

public extension Outlaw.IndexExtractable {
    public func value<V: Outlaw.Value>(for index: Outlaw.Index) throws -> [V?] {
        let any = try self.any(for: index)
        do {
            return try Array<V?>.mappedValue(from: any)
        }
        catch let OutlawError.typeMismatch(expected: expected, actual: actual) {
            throw OutlawError.typeMismatchWithIndex(index: index.outlawIndex, expected: expected, actual: actual)
        }
    }
    
    public func value<V: Outlaw.Value>(for index: Outlaw.Index) -> [V?]? {
        return try? self.value(for: index)
    }
}

// MARK: -
// MARK: Array of Transformed Optional Value's

public extension Outlaw.IndexExtractable {
    public func value<V: Outlaw.Value, T>(for index: Outlaw.Index, with transform:(V) -> T?) throws -> [T?] {
        let any = try self.any(for: index)
        do {
            return try Array<V>.mappedValue(from: any, with: transform)
        }
        catch let OutlawError.typeMismatch(expected: expected, actual: actual) {
            throw OutlawError.typeMismatchWithIndex(index: index.outlawIndex, expected: expected, actual: actual)
        }
    }
    
    public func value<V: Outlaw.Value, T>(for index: Outlaw.Index, with transform:(V) -> T?) -> [T?]? {
        return try? self.value(for: index, with: transform)
    }
    
    public func value<V: Outlaw.Value, T>(for index: Outlaw.Index, with transform:(V?) -> T?) throws -> [T?] {
        let any = try self.any(for: index)
        do {
            return try Array<V?>.mappedValue(from: any, with: transform)
        }
        catch let OutlawError.typeMismatch(expected: expected, actual: actual) {
            throw OutlawError.typeMismatchWithIndex(index: index.outlawIndex, expected: expected, actual: actual)
        }
    }
    
    public func value<V: Outlaw.Value, T>(for index: Outlaw.Index, with transform:(V?) -> T?) -> [T?]? {
        return try? self.value(for: index, with: transform)
    }
}

// MARK: -
// MARK: Dictionary of Value's

public extension Outlaw.IndexExtractable {
    public func value<K, V: Outlaw.Value>(for index: Outlaw.Index) throws -> [K: V] {
        let any = try self.any(for: index)
        do {
            return try Dictionary<K, V>.mappedValue(from: any)
        }
        catch let OutlawError.typeMismatch(expected: expected, actual: actual) {
            throw OutlawError.typeMismatchWithIndex(index: index.outlawIndex, expected: expected, actual: actual)
        }
    }
    
    public func value<K, V: Outlaw.Value>(for index: Outlaw.Index) -> [K: V]? {
        return try? self.value(for: index)
    }
}

// MARK: -
// MARK: Dictionary of Transformed Value's

public extension Outlaw.IndexExtractable {
    public func value<K, V: Outlaw.Value, T>(for index: Outlaw.Index, with transform:(V) throws -> T) throws -> [K: T] {
        let any = try self.any(for: index)
        do {
            return try Dictionary<K, V>.mappedValue(from: any, with: transform)
        }
        catch let OutlawError.typeMismatch(expected: expected, actual: actual) {
            throw OutlawError.typeMismatchWithIndex(index: index.outlawIndex, expected: expected, actual: actual)
        }
    }
    
    public func value<K, V: Outlaw.Value, T>(for index: Outlaw.Index, with transform:(V) throws -> T) -> [K: T]? {
        return try? self.value(for: index, with: transform)
    }
    
    public func value<K, V: Outlaw.Value, T>(for index: Outlaw.Index, with transform:(V?) throws -> T) throws -> [K: T] {
        let any = try self.any(for: index)
        do {
            return try Dictionary<K, V>.mappedValue(from: any, with: transform)
        }
        catch let OutlawError.typeMismatch(expected: expected, actual: actual) {
            throw OutlawError.typeMismatchWithIndex(index: index.outlawIndex, expected: expected, actual: actual)
        }
    }
    
    public func value<K, V: Outlaw.Value, T>(for index: Outlaw.Index, with transform:(V?) throws -> T) -> [K: T]? {
        return try? self.value(for: index, with: transform)
    }
}

// MARK: -
// MARK: Dictionary of Optional Value's

public extension Outlaw.IndexExtractable {
    public func value<K, V: Outlaw.Value>(for index: Outlaw.Index) throws -> [K: V?] {
        let any = try self.any(for: index)
        do {
            return try Dictionary<K, V?>.mappedValue(from: any)
        }
        catch let OutlawError.typeMismatch(expected: expected, actual: actual) {
            throw OutlawError.typeMismatchWithIndex(index: index.outlawIndex, expected: expected, actual: actual)
        }
    }
    
    public func value<K, V: Outlaw.Value>(for index: Outlaw.Index) -> [K: V?]? {
        return try? self.value(for: index)
    }
}

// MARK: -
// MARK: Dictionary of Transformed Optional Value's

public extension Outlaw.IndexExtractable {
    public func value<K, V: Outlaw.Value, T>(for index: Outlaw.Index, with transform:(V) -> T?) throws -> [K: T?] {
        let any = try self.any(for: index)
        do {
            return try Dictionary<K, V?>.mappedValue(from: any, with: transform)
        }
        catch let OutlawError.typeMismatch(expected: expected, actual: actual) {
            throw OutlawError.typeMismatchWithIndex(index: index.outlawIndex, expected: expected, actual: actual)
        }
    }
    
    public func value<K, V: Outlaw.Value, T>(for index: Outlaw.Index, with transform:(V) -> T?) -> [K: T?]? {
        return try? self.value(for: index)
    }
    
    public func value<K, V: Outlaw.Value, T>(for index: Outlaw.Index, with transform:(V?) -> T?) throws -> [K: T?] {
        let any = try self.any(for: index)
        do {
            return try Dictionary<K, V?>.mappedValue(from: any, with: transform)
        }
        catch let OutlawError.typeMismatch(expected: expected, actual: actual) {
            throw OutlawError.typeMismatchWithIndex(index: index.outlawIndex, expected: expected, actual: actual)
        }
    }
    
    public func value<K, V: Outlaw.Value, T>(for index: Outlaw.Index, with transform:(V?) -> T?) -> [K: T?]? {
        return try? self.value(for: index)
    }
}

// MARK: -
// MARK: Set of Value's

public extension Outlaw.IndexExtractable {
    public func value<V: Outlaw.Value>(for index: Outlaw.Index) throws -> Set<V> {
        let any = try self.any(for: index)
        do {
            return try Set<V>.mappedValue(from: any)
        }
        catch let OutlawError.typeMismatch(expected: expected, actual: actual) {
            throw OutlawError.typeMismatchWithIndex(index: index.outlawIndex, expected: expected, actual: actual)
        }
    }
    
    public func value<V: Outlaw.Value>(for index: Outlaw.Index) -> Set<V>? {
        return try? self.value(for: index)
    }
}

// MARK: -
// MARK: Set of Transformed Value's

public extension Outlaw.IndexExtractable {
    public func value<V: Outlaw.Value & Hashable, T>(for index: Outlaw.Index, with transform:(V) throws -> T) throws -> Set<T> {
        let any = try self.any(for: index)
        do {
            return try Set<V>.mappedValue(from: any, with: transform)
        }
        catch let OutlawError.typeMismatch(expected: expected, actual: actual) {
            throw OutlawError.typeMismatchWithIndex(index: index.outlawIndex, expected: expected, actual: actual)
        }
    }
    
    public func value<V: Outlaw.Value & Hashable, T>(for index: Outlaw.Index, with transform:(V) throws -> T) -> Set<T>? {
        return try? self.value(for: index, with: transform)
    }
    
    public func value<V: Outlaw.Value & Hashable, T>(for index: Outlaw.Index, with transform:(V?) throws -> T) throws -> Set<T> {
        let any = try self.any(for: index)
        do {
            return try Set<V>.mappedValue(from: any, with: transform)
        }
        catch let OutlawError.typeMismatch(expected: expected, actual: actual) {
            throw OutlawError.typeMismatchWithIndex(index: index.outlawIndex, expected: expected, actual: actual)
        }
    }
    
    public func value<V: Outlaw.Value & Hashable, T>(for index: Outlaw.Index, with transform:(V?) throws -> T) -> Set<T>? {
        return try? self.value(for: index, with: transform)
    }
    
    public func value<V: Outlaw.Value & Hashable, T>(for index: Outlaw.Index, with transform:(V) -> T?) throws -> Set<T> {
        let any = try self.any(for: index)
        do {
            return try Set<V>.mappedValue(from: any, with: transform)
        }
        catch let OutlawError.typeMismatch(expected: expected, actual: actual) {
            throw OutlawError.typeMismatchWithIndex(index: index.outlawIndex, expected: expected, actual: actual)
        }
    }
    
    public func value<V: Outlaw.Value & Hashable, T>(for index: Outlaw.Index, with transform:(V) -> T?) -> Set<T>? {
        return try? self.value(for: index, with: transform)
    }
    
    public func value<V: Outlaw.Value & Hashable, T>(for index: Outlaw.Index, with transform:(V?) -> T?) throws -> Set<T> {
        let any = try self.any(for: index)
        do {
            return try Set<V>.mappedValue(from: any, with: transform)
        }
        catch let OutlawError.typeMismatch(expected: expected, actual: actual) {
            throw OutlawError.typeMismatchWithIndex(index: index.outlawIndex, expected: expected, actual: actual)
        }
    }
    
    public func value<V: Outlaw.Value & Hashable, T>(for index: Outlaw.Index, with transform:(V?) -> T?) -> Set<T>? {
        return try? self.value(for: index, with: transform)
    }
}
