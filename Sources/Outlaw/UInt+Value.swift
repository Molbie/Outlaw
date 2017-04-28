//
//  UInt+Value.swift
//  Outlaw
//
//  Created by Brian Mullen on 11/5/16.
//  Copyright © 2016 Molbie LLC. All rights reserved.
//

import Foundation


extension UInt: Value {
    public static func value(from object: Any) throws -> UInt {
        let value: UInt
        
        switch object {
            case let rawValue as UInt:
                value = ValueType(rawValue)
            case let rawValue as Int:
                value = ValueType(rawValue)
            case let rawValue as NSNumber:
                value = ValueType(rawValue.uintValue)
            case let rawValue as UInt64:
                value = ValueType(rawValue)
            case let rawValue as Int64:
                value = ValueType(rawValue)
            case let rawValue as UInt32:
                value = ValueType(rawValue)
            case let rawValue as Int32:
                value = ValueType(rawValue)
            case let rawValue as UInt16:
                value = ValueType(rawValue)
            case let rawValue as Int16:
                value = ValueType(rawValue)
            case let rawValue as UInt8:
                value = ValueType(rawValue)
            case let rawValue as Int8:
                value = ValueType(rawValue)
            default:
                throw OutlawError.typeMismatch(expected: ValueType.self, actual: type(of: object))
        }
        
        return value
    }
}
extension UInt8: Value {
    public static func value(from object: Any) throws -> UInt8 {
        let value: UInt8
        
        switch object {
            case let rawValue as UInt:
                value = ValueType(rawValue)
            case let rawValue as Int:
                value = ValueType(rawValue)
            case let rawValue as NSNumber:
                value = ValueType(rawValue.uint8Value)
            case let rawValue as UInt64:
                value = ValueType(rawValue)
            case let rawValue as Int64:
                value = ValueType(rawValue)
            case let rawValue as UInt32:
                value = ValueType(rawValue)
            case let rawValue as Int32:
                value = ValueType(rawValue)
            case let rawValue as UInt16:
                value = ValueType(rawValue)
            case let rawValue as Int16:
                value = ValueType(rawValue)
            case let rawValue as UInt8:
                value = ValueType(rawValue)
            case let rawValue as Int8:
                value = ValueType(rawValue)
            default:
                throw OutlawError.typeMismatch(expected: ValueType.self, actual: type(of: object))
        }
        
        return value
    }
}
extension UInt16: Value {
    public static func value(from object: Any) throws -> UInt16 {
        let value: UInt16
        
        switch object {
            case let rawValue as UInt:
                value = ValueType(rawValue)
            case let rawValue as Int:
                value = ValueType(rawValue)
            case let rawValue as NSNumber:
                value = ValueType(rawValue.uint16Value)
            case let rawValue as UInt64:
                value = ValueType(rawValue)
            case let rawValue as Int64:
                value = ValueType(rawValue)
            case let rawValue as UInt32:
                value = ValueType(rawValue)
            case let rawValue as Int32:
                value = ValueType(rawValue)
            case let rawValue as UInt16:
                value = ValueType(rawValue)
            case let rawValue as Int16:
                value = ValueType(rawValue)
            case let rawValue as UInt8:
                value = ValueType(rawValue)
            case let rawValue as Int8:
                value = ValueType(rawValue)
            default:
                throw OutlawError.typeMismatch(expected: ValueType.self, actual: type(of: object))
        }
        
        return value
    }
}
extension UInt32: Value {
    public static func value(from object: Any) throws -> UInt32 {
        let value: UInt32
        
        switch object {
            case let rawValue as UInt:
                value = ValueType(rawValue)
            case let rawValue as Int:
                value = ValueType(rawValue)
            case let rawValue as NSNumber:
                value = ValueType(rawValue.uint32Value)
            case let rawValue as UInt64:
                value = ValueType(rawValue)
            case let rawValue as Int64:
                value = ValueType(rawValue)
            case let rawValue as UInt32:
                value = ValueType(rawValue)
            case let rawValue as Int32:
                value = ValueType(rawValue)
            case let rawValue as UInt16:
                value = ValueType(rawValue)
            case let rawValue as Int16:
                value = ValueType(rawValue)
            case let rawValue as UInt8:
                value = ValueType(rawValue)
            case let rawValue as Int8:
                value = ValueType(rawValue)
            default:
                throw OutlawError.typeMismatch(expected: ValueType.self, actual: type(of: object))
        }
        
        return value
    }
}
extension UInt64: Value {
    public static func value(from object: Any) throws -> UInt64 {
        let value: UInt64
        
        switch object {
            case let rawValue as UInt:
                value = ValueType(rawValue)
            case let rawValue as Int:
                value = ValueType(rawValue)
            case let rawValue as NSNumber:
                value = ValueType(rawValue.uint64Value)
            case let rawValue as UInt64:
                value = ValueType(rawValue)
            case let rawValue as Int64:
                value = ValueType(rawValue)
            case let rawValue as UInt32:
                value = ValueType(rawValue)
            case let rawValue as Int32:
                value = ValueType(rawValue)
            case let rawValue as UInt16:
                value = ValueType(rawValue)
            case let rawValue as Int16:
                value = ValueType(rawValue)
            case let rawValue as UInt8:
                value = ValueType(rawValue)
            case let rawValue as Int8:
                value = ValueType(rawValue)
            default:
                throw OutlawError.typeMismatch(expected: ValueType.self, actual: type(of: object))
        }
        
        return value
    }
}
