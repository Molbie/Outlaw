//
//  Extractable+ValueWithContext.swift
//  Outlaw
//
//  Created by Brian Mullen on 11/15/16.
//  Copyright © 2016 Molbie LLC. All rights reserved.
//

import Foundation


// MARK: -
// MARK: ValueWithContext

public extension Outlaw.Extractable {
    public func value<V: Outlaw.ValueWithContext>(for key: Outlaw.Key, using context: V.Context) throws -> V {
        let any = try self.any(for: key)
        do {
            guard let result = try V.value(from: any, using: context) as? V else {
                throw OutlawError.typeMismatchWithKey(key: key.outlawKey, expected: V.self, actual: any)
            }
            return result
        }
        catch let OutlawError.typeMismatch(expected: expected, actual: actual) {
            throw OutlawError.typeMismatchWithKey(key: key.outlawKey, expected: expected, actual: actual)
        }
    }
    
    public func value<V: Outlaw.ValueWithContext>(for key: Outlaw.Key, using context: V.Context) -> V? {
        return try? self.value(for: key, using: context)
    }
}

// MARK: -
// MARK: ValueWithContext Array

public extension Outlaw.Extractable {
    public func value<V: Outlaw.ValueWithContext>(for key: Outlaw.Key, using context: V.Context) throws -> [V] {
        let any = try self.any(for: key)
        do {
            return try Array<V>.mappedValue(from: any, using: context)
        }
        catch let OutlawError.typeMismatch(expected: expected, actual: actual) {
            throw OutlawError.typeMismatchWithKey(key: key.outlawKey, expected: expected, actual: actual)
        }
    }
    
    public func value<V: Outlaw.ValueWithContext>(for key: Outlaw.Key, using context: V.Context) -> [V]? {
        return try? self.value(for: key, using: context)
    }
}

// MARK: -
// MARK: Optional ValueWithContext Array

public extension Outlaw.Extractable {
    public func value<V: Outlaw.ValueWithContext>(for key: Outlaw.Key, using context: V.Context) throws -> [V?] {
        let any = try self.any(for: key)
        do {
            return try Array<V?>.mappedValue(from: any, using: context)
        }
        catch let OutlawError.typeMismatch(expected: expected, actual: actual) {
            throw OutlawError.typeMismatchWithKey(key: key.outlawKey, expected: expected, actual: actual)
        }
    }
    
    public func value<V: Outlaw.ValueWithContext>(for key: Outlaw.Key, using context: V.Context) -> [V?]? {
        return try? self.value(for: key, using: context)
    }
}

// MARK: -
// MARK: ValueWithContext Dictionary

public extension Outlaw.Extractable {
    public func value<K, V: Outlaw.ValueWithContext>(for key: Outlaw.Key, using context: V.Context) throws -> [K: V] {
        let any = try self.any(for: key)
        do {
            return try Dictionary<K, V>.mappedValue(from: any, using: context)
        }
        catch let OutlawError.typeMismatch(expected: expected, actual: actual) {
            throw OutlawError.typeMismatchWithKey(key: key.outlawKey, expected: expected, actual: actual)
        }
    }
    
    public func value<K, V: Outlaw.ValueWithContext>(for key: Outlaw.Key, using context: V.Context) -> [K: V]? {
        return try? self.value(for: key, using: context)
    }
}

// MARK: -
// MARK: Optional ValueWithContext Dictionary

public extension Outlaw.Extractable {
    public func value<K, V: Outlaw.ValueWithContext>(for key: Outlaw.Key, using context: V.Context) throws -> [K: V?] {
        let any = try self.any(for: key)
        do {
            return try Dictionary<K, V?>.mappedValue(from: any, using: context)
        }
        catch let OutlawError.typeMismatch(expected: expected, actual: actual) {
            throw OutlawError.typeMismatchWithKey(key: key.outlawKey, expected: expected, actual: actual)
        }
    }
    
    public func value<K, V: Outlaw.ValueWithContext>(for key: Outlaw.Key, using context: V.Context) -> [K: V?]? {
        return try? self.value(for: key, using: context)
    }
}

// MARK: -
// MARK: ValueWithContext Set

public extension Outlaw.Extractable {
    public func value<V: Outlaw.ValueWithContext>(for key: Outlaw.Key, using context: V.Context) throws -> Set<V> {
        let any = try self.any(for: key)
        do {
            return try Set<V>.mappedValue(from: any, using: context)
        }
        catch let OutlawError.typeMismatch(expected: expected, actual: actual) {
            throw OutlawError.typeMismatchWithKey(key: key.outlawKey, expected: expected, actual: actual)
        }
    }
    
    public func value<V: Outlaw.ValueWithContext>(for key: Outlaw.Key, using context: V.Context) -> Set<V>? {
        return try? self.value(for: key, using: context)
    }
}
