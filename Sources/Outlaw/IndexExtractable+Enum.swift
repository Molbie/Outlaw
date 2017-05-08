//
//  IndexExtractable+Enum.swift
//  Outlaw
//
//  Created by Brian Mullen on 11/23/16.
//  Copyright © 2016 Molbie LLC. All rights reserved.
//

import Foundation


// MARK: -
// MARK: Enum

public extension IndexExtractable {
    public func value<E: RawRepresentable>(for index: Index) throws -> E where E.RawValue: Value {
        let rawValue = try self.value(for: index) as E.RawValue
        guard let value = E(rawValue: rawValue) else {
            throw OutlawError.typeMismatchWithIndex(index: index.outlawIndex, expected: E.self, actual: type(of: rawValue))
        }
        return value
    }
    
    public func value<E: RawRepresentable>(for index: Index) -> E? where E.RawValue: Value {
        return try? self.value(for: index)
    }
    
    public func value<E: RawRepresentable>(for index: Index, or value: E) -> E where E.RawValue: Value {
        guard let result: E = self.value(for: index) else { return value }
        return result
    }
}

// MARK: -
// MARK: Enum Array

public extension IndexExtractable {
    public func value<E: RawRepresentable>(for index: Index) throws -> [E] where E.RawValue: Value {
        let rawArray = try self.value(for: index) as [E.RawValue]
        return try rawArray.map {
            guard let value = E(rawValue: $0) else {
                throw OutlawError.typeMismatchWithIndex(index: index.outlawIndex, expected: E.self, actual: type(of: $0))
            }
            return value
        }
    }
    
    public func value<E: RawRepresentable>(for index: Index) -> [E]? where E.RawValue: Value {
        return try? self.value(for: index)
    }
    
    public func value<E: RawRepresentable>(for index: Index, or value: [E]) -> [E] where E.RawValue: Value {
        guard let result: [E] = self.value(for: index) else { return value }
        return result
    }
}

// MARK: -
// MARK: Enum Dictionary

public extension IndexExtractable {
    public func value<K, V: RawRepresentable>(for index: Index) throws -> [K: V] where V.RawValue: Value {
        let any = try self.any(for: index)
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
            throw OutlawError.typeMismatchWithIndex(index: index.outlawIndex, expected: expected, actual: actual)
        }
    }
    
    public func value<K, V: RawRepresentable>(for index: Index) -> [K: V]? where V.RawValue: Value {
        return try? self.value(for: index)
    }
    
    public func value<K, V: RawRepresentable>(for index: Index, or value: [K: V]) -> [K: V] where V.RawValue: Value {
        guard let result: [K: V] = self.value(for: index) else { return value }
        return result
    }
}

// MARK: -
// MARK: Enum Set

public extension IndexExtractable {
    public func value<E: RawRepresentable>(for index: Index) throws -> Set<E> where E.RawValue: Value {
        let rawArray = try self.value(for: index) as [E.RawValue]
        let enumArray: [E] = try rawArray.map {
            guard let value = E(rawValue: $0) else {
                throw OutlawError.typeMismatchWithIndex(index: index.outlawIndex, expected: E.self, actual: type(of: $0))
            }
            return value
        }
        return Set<E>(enumArray)
    }
    
    public func value<E: RawRepresentable>(for index: Index) -> Set<E>? where E.RawValue: Value {
        return try? self.value(for: index)
    }
    
    public func value<E: RawRepresentable>(for index: Index, or value: Set<E>) -> Set<E> where E.RawValue: Value {
        guard let result: Set<E> = self.value(for: index) else { return value }
        return result
    }
}
