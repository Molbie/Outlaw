//
//  Extractable+Enum.swift
//  Outlaw
//
//  Created by Brian Mullen on 11/9/16.
//  Copyright © 2016 Molbie LLC. All rights reserved.
//

import Foundation


// MARK: -
// MARK: Enum

public extension Outlaw.Extractable {
    public func value<E: RawRepresentable>(for key: Outlaw.Key) throws -> E where E.RawValue: Outlaw.Value {
        let rawValue = try self.value(for: key) as E.RawValue
        guard let value = E(rawValue: rawValue) else {
            throw OutlawError.typeMismatchWithKey(key: key.outlawKey, expected: E.self, actual: type(of: rawValue))
        }
        return value
    }
    
    public func value<E: RawRepresentable>(for key: Outlaw.Key) -> E? where E.RawValue: Outlaw.Value {
        return try? self.value(for: key)
    }
}

// MARK: -
// MARK: Enum Array

public extension Outlaw.Extractable {
    public func value<E: RawRepresentable>(for key: Outlaw.Key) throws -> [E] where E.RawValue: Outlaw.Value {
        let rawArray = try self.value(for: key) as [E.RawValue]
        return try rawArray.map {
            guard let value = E(rawValue: $0) else {
                throw OutlawError.typeMismatchWithKey(key: key.outlawKey, expected: E.self, actual: type(of: $0))
            }
            return value
        }
    }
    
    public func value<E: RawRepresentable>(for key: Outlaw.Key) -> [E]? where E.RawValue: Outlaw.Value {
        return try? self.value(for: key)
    }
}

// MARK: -
// MARK: Enum Dictionary

public extension Outlaw.Extractable {
    public func value<K, V: RawRepresentable>(for key: Outlaw.Key) throws -> [K: V] where V.RawValue: Outlaw.Value {
        let any = try self.any(for: key)
        do {
            let rawDictionary: [K: V.RawValue] = try Dictionary<K, V.RawValue>.mappedValue(from: any)
            
            return try rawDictionary.map { (key, rawValue) in
                guard let value = V(rawValue: rawValue) else {
                    throw OutlawError.typeMismatch(expected: V.self, actual: type(of: rawValue))
                }
                return (key, value)
            }
        }
        catch let OutlawError.typeMismatch(expected: expected, actual: actual) {
            throw OutlawError.typeMismatchWithKey(key: key.outlawKey, expected: expected, actual: actual)
        }
    }
    
    public func value<K, V: RawRepresentable>(for key: Outlaw.Key) -> [K: V]? where V.RawValue: Outlaw.Value {
        return try? self.value(for: key)
    }
}

// MARK: -
// MARK: Enum Set

public extension Outlaw.Extractable {
    public func value<E: RawRepresentable>(for key: Outlaw.Key) throws -> Set<E> where E.RawValue: Outlaw.Value {
        let rawArray = try self.value(for: key) as [E.RawValue]
        let enumArray: [E] = try rawArray.map {
            guard let value = E(rawValue: $0) else {
                throw OutlawError.typeMismatchWithKey(key: key.outlawKey, expected: E.self, actual: type(of: $0))
            }
            return value
        }
        return Set<E>(enumArray)
    }
    
    public func value<E: RawRepresentable>(for key: Outlaw.Key) -> Set<E>? where E.RawValue: Outlaw.Value {
        return try? self.value(for: key)
    }
}
