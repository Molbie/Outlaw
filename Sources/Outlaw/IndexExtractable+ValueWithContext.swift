//
//  IndexExtractable+ValueWithContext.swift
//  Outlaw
//
//  Created by Brian Mullen on 11/23/16.
//  Copyright © 2016 Molbie LLC. All rights reserved.
//

import Foundation


// MARK: -
// MARK: ValueWithContext

public extension IndexExtractable {
    public func value<V: ValueWithContext>(for index: Index, using context: V.Context) throws -> V {
        let any = try self.any(for: index)
        do {
            guard let result = try V.value(from: any, using: context) as? V else {
                throw OutlawError.typeMismatchWithIndex(index: index.outlawIndex, expected: V.self, actual: any)
            }
            return result
        }
        catch let OutlawError.typeMismatch(expected: expected, actual: actual) {
            throw OutlawError.typeMismatchWithIndex(index: index.outlawIndex, expected: expected, actual: actual)
        }
    }
    
    public func value<V: ValueWithContext>(for index: Index, using context: V.Context) -> V? {
        return try? self.value(for: index, using: context)
    }
    
    public func value<V: ValueWithContext>(for index: Index, using context: V.Context, or value: V) -> V {
        guard let result: V = self.value(for: index, using: context) else { return value }
        return result
    }
}

// MARK: -
// MARK: ValueWithContext Array

public extension IndexExtractable {
    public func value<V: ValueWithContext>(for index: Index, using context: V.Context) throws -> [V] {
        let any = try self.any(for: index)
        do {
            return try Array<V>.mappedValue(from: any, using: context)
        }
        catch let OutlawError.typeMismatch(expected: expected, actual: actual) {
            throw OutlawError.typeMismatchWithIndex(index: index.outlawIndex, expected: expected, actual: actual)
        }
    }
    
    public func value<V: ValueWithContext>(for index: Index, using context: V.Context) -> [V]? {
        return try? self.value(for: index, using: context)
    }
    
    public func value<V: ValueWithContext>(for index: Index, using context: V.Context, or value: [V]) -> [V] {
        guard let result: [V] = self.value(for: index, using: context) else { return value }
        return result
    }
}

// MARK: -
// MARK: Optional ValueWithContext Array

public extension IndexExtractable {
    public func value<V: ValueWithContext>(for index: Index, using context: V.Context) throws -> [V?] {
        let any = try self.any(for: index)
        do {
            return try Array<V?>.mappedValue(from: any, using: context)
        }
        catch let OutlawError.typeMismatch(expected: expected, actual: actual) {
            throw OutlawError.typeMismatchWithIndex(index: index.outlawIndex, expected: expected, actual: actual)
        }
    }
    
    public func value<V: ValueWithContext>(for index: Index, using context: V.Context) -> [V?]? {
        return try? self.value(for: index, using: context)
    }
    
    public func value<V: ValueWithContext>(for index: Index, using context: V.Context, or value: [V?]) -> [V?] {
        guard let result: [V?] = self.value(for: index, using: context) else { return value }
        return result
    }
}

// MARK: -
// MARK: ValueWithContext Dictionary

public extension IndexExtractable {
    public func value<K, V: ValueWithContext>(for index: Index, using context: V.Context) throws -> [K: V] {
        let any = try self.any(for: index)
        do {
            return try Dictionary<K, V>.mappedValue(from: any, using: context)
        }
        catch let OutlawError.typeMismatch(expected: expected, actual: actual) {
            throw OutlawError.typeMismatchWithIndex(index: index.outlawIndex, expected: expected, actual: actual)
        }
    }
    
    public func value<K, V: ValueWithContext>(for index: Index, using context: V.Context) -> [K: V]? {
        return try? self.value(for: index, using: context)
    }
    
    public func value<K, V: ValueWithContext>(for index: Index, using context: V.Context, or value: [K: V]) -> [K: V] {
        guard let result: [K: V] = self.value(for: index, using: context) else { return value }
        return result
    }
}

// MARK: -
// MARK: Optional ValueWithContext Dictionary

public extension IndexExtractable {
    public func value<K, V: ValueWithContext>(for index: Index, using context: V.Context) throws -> [K: V?] {
        let any = try self.any(for: index)
        do {
            return try Dictionary<K, V?>.mappedValue(from: any, using: context)
        }
        catch let OutlawError.typeMismatch(expected: expected, actual: actual) {
            throw OutlawError.typeMismatchWithIndex(index: index.outlawIndex, expected: expected, actual: actual)
        }
    }
    
    public func value<K, V: ValueWithContext>(for index: Index, using context: V.Context) -> [K: V?]? {
        return try? self.value(for: index, using: context)
    }
    
    public func value<K, V: ValueWithContext>(for index: Index, using context: V.Context, or value: [K: V?]) -> [K: V?] {
        guard let result: [K: V?] = self.value(for: index, using: context) else { return value }
        return result
    }
}

// MARK: -
// MARK: ValueWithContext Set

public extension IndexExtractable {
    public func value<V: ValueWithContext>(for index: Index, using context: V.Context) throws -> Set<V> {
        let any = try self.any(for: index)
        do {
            return try Set<V>.mappedValue(from: any, using: context)
        }
        catch let OutlawError.typeMismatch(expected: expected, actual: actual) {
            throw OutlawError.typeMismatchWithIndex(index: index.outlawIndex, expected: expected, actual: actual)
        }
    }
    
    public func value<V: ValueWithContext>(for index: Index, using context: V.Context) -> Set<V>? {
        return try? self.value(for: index, using: context)
    }
    
    public func value<V: ValueWithContext>(for index: Index, using context: V.Context, or value: Set<V>) -> Set<V> {
        guard let result: Set<V> = self.value(for: index, using: context) else { return value }
        return result
    }
}
