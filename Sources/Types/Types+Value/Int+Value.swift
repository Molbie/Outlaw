//
//  Int+Value.swift
//  Outlaw
//
//  Created by Brian Mullen on 11/5/16.
//  Copyright © 2016 Molbie LLC. All rights reserved.
//

import Foundation


extension Int: Outlaw.Value {}
extension Int8: Outlaw.Value {
    public static func value(from object: Any) throws -> Int8 {
        guard let value = object as? Int else {
            throw OutlawError.typeMismatch(expected: ValueType.self, actual: type(of: object))
        }
        return ValueType(value)
    }
}
extension Int16: Outlaw.Value {
    public static func value(from object: Any) throws -> Int16 {
        guard let value = object as? Int else {
            throw OutlawError.typeMismatch(expected: ValueType.self, actual: type(of: object))
        }
        return ValueType(value)
    }
}
extension Int32: Outlaw.Value {
    public static func value(from object: Any) throws -> Int32 {
        guard let value = object as? Int else {
            throw OutlawError.typeMismatch(expected: ValueType.self, actual: type(of: object))
        }
        return ValueType(value)
    }
}
extension Int64: Outlaw.Value {
    public static func value(from object: Any) throws -> Int64 {
        guard let value = object as? Int else {
            throw OutlawError.typeMismatch(expected: ValueType.self, actual: type(of: object))
        }
        return ValueType(value)
    }
}
