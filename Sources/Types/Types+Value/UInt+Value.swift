//
//  UInt+Value.swift
//  Outlaw
//
//  Created by Brian Mullen on 11/5/16.
//  Copyright © 2016 Molbie LLC. All rights reserved.
//

import Foundation


extension UInt: Outlaw.Value {}
extension UInt8: Outlaw.Value {
    public static func value(from object: Any) throws -> UInt8 {
        guard let value = object as? UInt else {
            throw OutlawError.typeMismatch(expected: ValueType.self, actual: type(of: object))
        }
        return ValueType(value)
    }
}
extension UInt16: Outlaw.Value {
    public static func value(from object: Any) throws -> UInt16 {
        guard let value = object as? UInt else {
            throw OutlawError.typeMismatch(expected: ValueType.self, actual: type(of: object))
        }
        return ValueType(value)
    }
}
extension UInt32: Outlaw.Value {
    public static func value(from object: Any) throws -> UInt32 {
        guard let value = object as? UInt else {
            throw OutlawError.typeMismatch(expected: ValueType.self, actual: type(of: object))
        }
        return ValueType(value)
    }
}
extension UInt64: Outlaw.Value {
    public static func value(from object: Any) throws -> UInt64 {
        guard let value = object as? UInt else {
            throw OutlawError.typeMismatch(expected: ValueType.self, actual: type(of: object))
        }
        return ValueType(value)
    }
}
