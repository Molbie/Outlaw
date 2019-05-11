//
//  JSON.swift
//  Outlaw
//
//  Created by Brian Mullen on 11/26/16.
//  Copyright © 2016 Molbie LLC. All rights reserved.
//

import Foundation


public struct JSON {
    fileprivate init() {}
}

// MARK: -
// MARK: Validation

public extension JSON {
    static func isValid(_ collection: JSONCollection) -> Bool {
        return JSONSerialization.isValidJSONObject(collection)
    }
}

// MARK: -
// MARK: Serialization

public extension JSON {
    static func data(from collection: JSONCollection, withFormatting: Bool = false) throws -> Data {
        let options: JSONSerialization.WritingOptions = withFormatting ? .prettyPrinted : []
        return try JSONSerialization.data(withJSONObject: collection, options: options)
    }
    
    static func write(_ collection: JSONCollection, to stream: OutputStream, withFormatting: Bool = false) throws -> Int {
        let options: JSONSerialization.WritingOptions = withFormatting ? .prettyPrinted : []
        
#if os(Linux)
        let result = try JSONSerialization.writeJSONObject(collection, toStream: stream, options: options)
#else
        var error: NSError? = nil
        let result = JSONSerialization.writeJSONObject(collection, to: stream, options: options, error: &error)
        if let error = error {
            throw error
        }
#endif
        
        return result
    }
}

// MARK: -
// MARK: Data

public extension JSON {
    static func value<V>(from data: Data) throws -> [V] {
        let any = try JSONSerialization.jsonObject(with: data, options: [])
        return try Array<V>.value(from: any)
    }
    
    static func optional<V>(from data: Data) -> [V]? {
        return try? self.value(from: data)
    }
    
    static func value<V>(from data: Data, or value: [V]) -> [V] {
        guard let result: [V] = self.optional(from: data) else { return value }
        return result
    }
    
    static func value<K, V>(from data: Data) throws -> [K: V] {
        let any = try JSONSerialization.jsonObject(with: data, options: [])
        return try Dictionary<K, V>.value(from: any)
    }
    
    static func optional<K, V>(from data: Data) -> [K: V]? {
        return try? self.value(from: data)
    }
    
    static func value<K, V>(from data: Data, or value: [K: V]) -> [K: V] {
        guard let result: [K: V] = self.optional(from: data) else { return value }
        return result
    }
    
    static func value<V>(from data: Data) throws -> Set<V> {
        let any = try JSONSerialization.jsonObject(with: data, options: [])
        return try Set<V>.value(from: any)
    }
    
    static func optional<V>(from data: Data) -> Set<V>? {
        return try? self.value(from: data)
    }
    
    static func value<V>(from data: Data, or value: Set<V>) -> Set<V> {
        guard let result: Set<V> = self.optional(from: data) else { return value }
        return result
    }
    
    static func value<V: Value>(from data: Data) throws -> V {
        let any = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
        guard let result = try V.value(from: any) as? V else {
            throw OutlawError.typeMismatch(expected: V.self, actual: any)
        }
        return result
    }
    
    static func optional<V: Value>(from data: Data) -> V? {
        return try? self.value(from: data)
    }
    
    static func value<V: Value>(from data: Data, or value: V) -> V {
        guard let result: V = self.optional(from: data) else { return value }
        return result
    }
}

public extension JSON {
    static func value<V: Value>(from data: Data) throws -> [V] {
        let any = try JSONSerialization.jsonObject(with: data, options: [])
        return try Array<V>.mappedValue(from: any)
    }
    
    static func optional<V: Value>(from data: Data) -> [V]? {
        return try? self.value(from: data)
    }
    
    static func value<V: Value>(from data: Data, or value: [V]) -> [V] {
        guard let result: [V] = self.optional(from: data) else { return value }
        return result
    }
    
    static func value<K, V: Value>(from data: Data) throws -> [K: V] {
        let any = try JSONSerialization.jsonObject(with: data, options: [])
        return try Dictionary<K, V>.mappedValue(from: any)
    }
    
    static func optional<K, V: Value>(from data: Data) -> [K: V]? {
        return try? self.value(from: data)
    }
    
    static func value<K, V: Value>(from data: Data, or value: [K: V]) -> [K: V] {
        guard let result: [K: V] = self.optional(from: data) else { return value }
        return result
    }
    
    static func value<V: Value>(from data: Data) throws -> Set<V> {
        let any = try JSONSerialization.jsonObject(with: data, options: [])
        return try Set<V>.mappedValue(from: any)
    }
    
    static func optional<V: Value>(from data: Data) -> Set<V>? {
        return try? self.value(from: data)
    }
    
    static func value<V: Value>(from data: Data, or value: Set<V>) -> Set<V> {
        guard let result: Set<V> = self.optional(from: data) else { return value }
        return result
    }
}

// MARK: -
// MARK: InputStream

public extension JSON {
    static func value<V>(from stream: InputStream) throws -> [V] {
        let any = try JSONSerialization.jsonObject(with: stream, options: [])
        return try Array<V>.value(from: any)
    }
    
    static func optional<V>(from stream: InputStream) -> [V]? {
        return try? self.value(from: stream)
    }
    
    static func value<V>(from stream: InputStream, or value: [V]) -> [V] {
        guard let result: [V] = self.optional(from: stream) else { return value }
        return result
    }
    
    static func value<K, V>(from stream: InputStream) throws -> [K: V] {
        let any = try JSONSerialization.jsonObject(with: stream, options: [])
        return try Dictionary<K, V>.value(from: any)
    }
    
    static func optional<K, V>(from stream: InputStream) -> [K: V]? {
        return try? self.value(from: stream)
    }
    
    static func value<K, V>(from stream: InputStream, or value: [K: V]) -> [K: V] {
        guard let result: [K: V] = self.optional(from: stream) else { return value }
        return result
    }
    
    static func value<V>(from stream: InputStream) throws -> Set<V> {
        let any = try JSONSerialization.jsonObject(with: stream, options: [])
        return try Set<V>.value(from: any)
    }
    
    static func optional<V>(from stream: InputStream) -> Set<V>? {
        return try? self.value(from: stream)
    }
    
    static func value<V>(from stream: InputStream, or value: Set<V>) -> Set<V> {
        guard let result: Set<V> = self.optional(from: stream) else { return value }
        return result
    }
    
    static func value<V: Value>(from stream: InputStream) throws -> V {
        let any = try JSONSerialization.jsonObject(with: stream, options: .allowFragments)
        guard let result = try V.value(from: any) as? V else {
            throw OutlawError.typeMismatch(expected: V.self, actual: any)
        }
        return result
    }
    
    static func optional<V: Value>(from stream: InputStream) -> V? {
        return try? self.value(from: stream)
    }
    
    static func value<V: Value>(from stream: InputStream, or value: V) -> V {
        guard let result: V = self.optional(from: stream) else { return value }
        return result
    }
}

public extension JSON {
    static func value<V: Value>(from stream: InputStream) throws -> [V] {
        let any = try JSONSerialization.jsonObject(with: stream, options: [])
        return try Array<V>.mappedValue(from: any)
    }
    
    static func optional<V: Value>(from stream: InputStream) -> [V]? {
        return try? self.value(from: stream)
    }
    
    static func value<V: Value>(from stream: InputStream, or value: [V]) -> [V] {
        guard let result: [V] = self.optional(from: stream) else { return value }
        return result
    }
    
    static func value<K, V: Value>(from stream: InputStream) throws -> [K: V] {
        let any = try JSONSerialization.jsonObject(with: stream, options: [])
        return try Dictionary<K, V>.mappedValue(from: any)
    }
    
    static func optional<K, V: Value>(from stream: InputStream) -> [K: V]? {
        return try? self.value(from: stream)
    }
    
    static func value<K, V: Value>(from stream: InputStream, or value: [K: V]) -> [K: V] {
        guard let result: [K: V] = self.optional(from: stream) else { return value }
        return result
    }
    
    static func value<V: Value>(from stream: InputStream) throws -> Set<V> {
        let any = try JSONSerialization.jsonObject(with: stream, options: [])
        return try Set<V>.mappedValue(from: any)
    }
    
    static func optional<V: Value>(from stream: InputStream) -> Set<V>? {
        return try? self.value(from: stream)
    }
    
    static func value<V: Value>(from stream: InputStream, or value: Set<V>) -> Set<V> {
        guard let result: Set<V> = self.optional(from: stream) else { return value }
        return result
    }
}

// MARK: -
// MARK: String

public extension JSON {
    static func value<V>(from string: String, using encoding: String.Encoding = .utf8) throws -> [V] {
        guard let data = string.data(using: encoding) else {
            throw OutlawError.typeMismatch(expected: Data.self, actual: String.self)
        }
        return try self.value(from: data)
    }
    
    static func optional<V>(from string: String, using encoding: String.Encoding = .utf8) -> [V]? {
        return try? self.value(from: string, using: encoding)
    }
    
    static func value<V>(from string: String, using encoding: String.Encoding = .utf8, or value: [V]) -> [V] {
        guard let result: [V] = self.optional(from: string, using: encoding) else { return value }
        return result
    }
    
    static func value<K, V>(from string: String, using encoding: String.Encoding = .utf8) throws -> [K: V] {
        guard let data = string.data(using: encoding) else {
            throw OutlawError.typeMismatch(expected: Data.self, actual: String.self)
        }
        return try self.value(from: data)
    }
    
    static func optional<K, V>(from string: String, using encoding: String.Encoding = .utf8) -> [K: V]? {
        return try? self.value(from: string, using: encoding)
    }
    
    static func value<K, V>(from string: String, using encoding: String.Encoding = .utf8, or value: [K: V]) -> [K: V] {
        guard let result: [K: V] = self.optional(from: string, using: encoding) else { return value }
        return result
    }
    
    static func value<V>(from string: String, using encoding: String.Encoding = .utf8) throws -> Set<V> {
        guard let data = string.data(using: encoding) else {
            throw OutlawError.typeMismatch(expected: Data.self, actual: String.self)
        }
        return try self.value(from: data)
    }
    
    static func optional<V>(from string: String, using encoding: String.Encoding = .utf8) -> Set<V>? {
        return try? self.value(from: string, using: encoding)
    }
    
    static func value<V>(from string: String, using encoding: String.Encoding = .utf8, or value: Set<V>) -> Set<V> {
        guard let result: Set<V> = self.optional(from: string, using: encoding) else { return value }
        return result
    }
    
    static func value<V: Value>(from string: String, using encoding: String.Encoding = .utf8) throws -> V {
        guard let data = string.data(using: encoding) else {
            throw OutlawError.typeMismatch(expected: Data.self, actual: String.self)
        }
        return try self.value(from: data)
    }
    
    static func optional<V: Value>(from string: String, using encoding: String.Encoding = .utf8) -> V? {
        return try? self.value(from: string, using: encoding)
    }
    
    static func value<V: Value>(from string: String, using encoding: String.Encoding = .utf8, or value: V) -> V {
        guard let result: V = self.optional(from: string, using: encoding) else { return value }
        return result
    }
}

public extension JSON {
    static func value<V: Value>(from string: String, using encoding: String.Encoding = .utf8) throws -> [V] {
        guard let data = string.data(using: encoding) else {
            throw OutlawError.typeMismatch(expected: Data.self, actual: String.self)
        }
        return try self.value(from: data)
    }
    
    static func optional<V: Value>(from string: String, using encoding: String.Encoding = .utf8) -> [V]? {
        return try? self.value(from: string, using: encoding)
    }
    
    static func value<V: Value>(from string: String, using encoding: String.Encoding = .utf8, or value: [V]) -> [V] {
        guard let result: [V] = self.optional(from: string, using: encoding) else { return value }
        return result
    }
    
    static func value<K, V: Value>(from string: String, using encoding: String.Encoding = .utf8) throws -> [K: V] {
        guard let data = string.data(using: encoding) else {
            throw OutlawError.typeMismatch(expected: Data.self, actual: String.self)
        }
        return try self.value(from: data)
    }
    
    static func optional<K, V: Value>(from string: String, using encoding: String.Encoding = .utf8) -> [K: V]? {
        return try? self.value(from: string, using: encoding)
    }
    
    static func value<K, V: Value>(from string: String, using encoding: String.Encoding = .utf8, or value: [K: V]) -> [K: V] {
        guard let result: [K: V] = self.optional(from: string, using: encoding) else { return value }
        return result
    }
    
    static func value<V: Value>(from string: String, using encoding: String.Encoding = .utf8) throws -> Set<V> {
        guard let data = string.data(using: encoding) else {
            throw OutlawError.typeMismatch(expected: Data.self, actual: String.self)
        }
        return try self.value(from: data)
    }
    
    static func optional<V: Value>(from string: String, using encoding: String.Encoding = .utf8) -> Set<V>? {
        return try? self.value(from: string, using: encoding)
    }
    
    static func value<V: Value>(from string: String, using encoding: String.Encoding = .utf8, or value: Set<V>) -> Set<V> {
        guard let result: Set<V> = self.optional(from: string, using: encoding) else { return value }
        return result
    }
}

// MARK: -
// MARK: URL

public extension JSON {
    static func value<V>(from url: URL) throws -> [V] {
        let data = try Data(contentsOf: url)
        return try self.value(from: data)
    }
    
    static func optional<V>(from url: URL) -> [V]? {
        return try? self.value(from: url)
    }
    
    static func value<V>(from url: URL, or value: [V]) -> [V] {
        guard let result: [V] = self.optional(from: url) else { return value }
        return result
    }
    
    static func value<K, V>(from url: URL) throws -> [K: V] {
        let data = try Data(contentsOf: url)
        return try self.value(from: data)
    }
    
    static func optional<K, V>(from url: URL) -> [K: V]? {
        return try? self.value(from: url)
    }
    
    static func value<K, V>(from url: URL, or value: [K: V]) -> [K: V] {
        guard let result: [K: V] = self.optional(from: url) else { return value }
        return result
    }
    
    static func value<V>(from url: URL) throws -> Set<V> {
        let data = try Data(contentsOf: url)
        return try self.value(from: data)
    }
    
    static func optional<V>(from url: URL) -> Set<V>? {
        return try? self.value(from: url)
    }
    
    static func value<V>(from url: URL, or value: Set<V>) -> Set<V> {
        guard let result: Set<V> = self.optional(from: url) else { return value }
        return result
    }
    
    static func value<V: Value>(from url: URL) throws -> V {
        let data = try Data(contentsOf: url)
        return try self.value(from: data)
    }
    
    static func optional<V: Value>(from url: URL) -> V? {
        return try? self.value(from: url)
    }
    
    static func value<V: Value>(from url: URL, or value: V) -> V {
        guard let result: V = self.optional(from: url) else { return value }
        return result
    }
}

public extension JSON {
    static func value<V: Value>(from url: URL) throws -> [V] {
        let data = try Data(contentsOf: url)
        return try self.value(from: data)
    }
    
    static func optional<V: Value>(from url: URL) -> [V]? {
        return try? self.value(from: url)
    }
    
    static func value<V: Value>(from url: URL, or value: [V]) -> [V] {
        guard let result: [V] = self.optional(from: url) else { return value }
        return result
    }
    
    static func value<K, V: Value>(from url: URL) throws -> [K: V] {
        let data = try Data(contentsOf: url)
        return try self.value(from: data)
    }
    
    static func optional<K, V: Value>(from url: URL) -> [K: V]? {
        return try? self.value(from: url)
    }
    
    static func value<K, V: Value>(from url: URL, or value: [K: V]) -> [K: V] {
        guard let result: [K: V] = self.optional(from: url) else { return value }
        return result
    }
    
    static func value<V: Value>(from url: URL) throws -> Set<V> {
        let data = try Data(contentsOf: url)
        return try self.value(from: data)
    }
    
    static func optional<V: Value>(from url: URL) -> Set<V>? {
        return try? self.value(from: url)
    }
    
    static func value<V: Value>(from url: URL, or value: Set<V>) -> Set<V> {
        guard let result: Set<V> = self.optional(from: url) else { return value }
        return result
    }
}
