//
//  Int+Value.swift
//  Outlaw
//
//  Created by Brian Mullen on 11/5/16.
//  Copyright © 2016 Molbie LLC. All rights reserved.
//

import Foundation


extension Int: Value {
    public static func value(from object: Any) throws -> Int {
        let value: Int
        
        switch object {
            case let rawValue as Int:
                value = ValueType(rawValue)
            case let rawValue as UInt:
                value = ValueType(rawValue)
            case let rawValue as NSNumber:
                value = ValueType(rawValue.intValue)
            case let rawValue as Int64:
                value = ValueType(rawValue)
            case let rawValue as UInt64:
                value = ValueType(rawValue)
            case let rawValue as Int32:
                value = ValueType(rawValue)
            case let rawValue as UInt32:
                value = ValueType(rawValue)
            case let rawValue as Int16:
                value = ValueType(rawValue)
            case let rawValue as UInt16:
                value = ValueType(rawValue)
            case let rawValue as Int8:
                value = ValueType(rawValue)
            case let rawValue as UInt8:
                value = ValueType(rawValue)
            default:
                throw OutlawError.typeMismatch(expected: ValueType.self, actual: type(of: object))
        }
        
        return value
    }
}
extension Int8: Value {
    public static func value(from object: Any) throws -> Int8 {
        let value: Int8
        
        switch object {
            case let rawValue as Int:
                value = ValueType(rawValue)
            case let rawValue as UInt:
                value = ValueType(rawValue)
            case let rawValue as NSNumber:
                value = ValueType(rawValue.int8Value)
            case let rawValue as Int64:
                value = ValueType(rawValue)
            case let rawValue as UInt64:
                value = ValueType(rawValue)
            case let rawValue as Int32:
                value = ValueType(rawValue)
            case let rawValue as UInt32:
                value = ValueType(rawValue)
            case let rawValue as Int16:
                value = ValueType(rawValue)
            case let rawValue as UInt16:
                value = ValueType(rawValue)
            case let rawValue as Int8:
                value = ValueType(rawValue)
            case let rawValue as UInt8:
                value = ValueType(rawValue)
            default:
                throw OutlawError.typeMismatch(expected: ValueType.self, actual: type(of: object))
        }
        
        return value
    }
}
extension Int16: Value {
    public static func value(from object: Any) throws -> Int16 {
        let value: Int16
        
        switch object {
            case let rawValue as Int:
                value = ValueType(rawValue)
            case let rawValue as UInt:
                value = ValueType(rawValue)
            case let rawValue as NSNumber:
                value = ValueType(rawValue.int16Value)
            case let rawValue as Int64:
                value = ValueType(rawValue)
            case let rawValue as UInt64:
                value = ValueType(rawValue)
            case let rawValue as Int32:
                value = ValueType(rawValue)
            case let rawValue as UInt32:
                value = ValueType(rawValue)
            case let rawValue as Int16:
                value = ValueType(rawValue)
            case let rawValue as UInt16:
                value = ValueType(rawValue)
            case let rawValue as Int8:
                value = ValueType(rawValue)
            case let rawValue as UInt8:
                value = ValueType(rawValue)
            default:
                throw OutlawError.typeMismatch(expected: ValueType.self, actual: type(of: object))
        }
        
        return value
    }
}
extension Int32: Value {
    public static func value(from object: Any) throws -> Int32 {
        let value: Int32
        
        switch object {
            case let rawValue as Int:
                value = ValueType(rawValue)
            case let rawValue as UInt:
                value = ValueType(rawValue)
            case let rawValue as NSNumber:
                value = ValueType(rawValue.int32Value)
            case let rawValue as Int64:
                value = ValueType(rawValue)
            case let rawValue as UInt64:
                value = ValueType(rawValue)
            case let rawValue as Int32:
                value = ValueType(rawValue)
            case let rawValue as UInt32:
                value = ValueType(rawValue)
            case let rawValue as Int16:
                value = ValueType(rawValue)
            case let rawValue as UInt16:
                value = ValueType(rawValue)
            case let rawValue as Int8:
                value = ValueType(rawValue)
            case let rawValue as UInt8:
                value = ValueType(rawValue)
            default:
                throw OutlawError.typeMismatch(expected: ValueType.self, actual: type(of: object))
        }
        
        return value
    }
}
extension Int64: Value {
    public static func value(from object: Any) throws -> Int64 {
        let value: Int64
        
        switch object {
            case let rawValue as Int:
                value = ValueType(rawValue)
            case let rawValue as UInt:
                value = ValueType(rawValue)
            case let rawValue as NSNumber:
                value = ValueType(rawValue.int64Value)
            case let rawValue as Int64:
                value = ValueType(rawValue)
            case let rawValue as UInt64:
                value = ValueType(rawValue)
            case let rawValue as Int32:
                value = ValueType(rawValue)
            case let rawValue as UInt32:
                value = ValueType(rawValue)
            case let rawValue as Int16:
                value = ValueType(rawValue)
            case let rawValue as UInt16:
                value = ValueType(rawValue)
            case let rawValue as Int8:
                value = ValueType(rawValue)
            case let rawValue as UInt8:
                value = ValueType(rawValue)
            default:
                throw OutlawError.typeMismatch(expected: ValueType.self, actual: type(of: object))
        }
        
        return value
    }
}
