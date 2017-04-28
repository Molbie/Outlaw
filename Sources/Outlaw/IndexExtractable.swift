//
//  IndexExtractable.swift
//  Outlaw
//
//  Created by Brian Mullen on 11/23/16.
//  Copyright © 2016 Molbie LLC. All rights reserved.
//

import Foundation


public protocol IndexExtractable {
    var count: Int { get }
    var isEmpty: Bool { get }
    
    func any(for index: Outlaw.Index) throws -> Any
    func optionalAny(for index: Outlaw.Index) -> Any?
}

public extension Outlaw.IndexExtractable {
    public func any(for index: Outlaw.Index) throws -> Any {
        let indexes = [index]
        var accumulator: Any = self
        
        for component in indexes {
            if let componentData = accumulator as? IndexExtractable, let value = componentData.optionalAny(for: component) {
                accumulator = value
                continue
            }
            throw OutlawError.indexNotFound(index: component.outlawIndex)
        }
        
        if let _ = accumulator as? NSNull {
            throw OutlawError.nullValueWithIndex(index: indexes[0].outlawIndex)
        }
        
        return accumulator
    }
}

// MARK: -
// MARK: Any Array

public extension Outlaw.IndexExtractable {
    public func value<V>(for index: Outlaw.Index) throws -> [V] {
        let any = try self.any(for: index)
        do {
            return try Array<V>.value(from: any)
        }
        catch let OutlawError.typeMismatch(expected: expected, actual: actual) {
            throw OutlawError.typeMismatchWithIndex(index: index.outlawIndex, expected: expected, actual: actual)
        }
    }
    
    public func value<V>(for index: Outlaw.Index) -> [V]? {
        return try? self.value(for: index)
    }
}

// MARK: -
// MARK: Any Dictionary

public extension Outlaw.IndexExtractable {
    public func value<K, V>(for index: Outlaw.Index) throws -> [K: V] {
        let any = try self.any(for: index)
        do {
            return try Dictionary<K, V>.value(from: any)
        }
        catch let OutlawError.typeMismatch(expected: expected, actual: actual) {
            throw OutlawError.typeMismatchWithIndex(index: index.outlawIndex, expected: expected, actual: actual)
        }
    }
    
    public func value<K, V>(for index: Outlaw.Index) -> [K: V]? {
        return try? self.value(for: index)
    }
}

// MARK: -
// MARK: Any Set

public extension Outlaw.IndexExtractable {
    public func value<V>(for index: Outlaw.Index) throws -> Set<V> {
        let any = try self.any(for: index)
        do {
            return try Set<V>.value(from: any)
        }
        catch let OutlawError.typeMismatch(expected: expected, actual: actual) {
            throw OutlawError.typeMismatchWithIndex(index: index.outlawIndex, expected: expected, actual: actual)
        }
    }
    
    public func value<V>(for index: Outlaw.Index) -> Set<V>? {
        return try? self.value(for: index)
    }
}
