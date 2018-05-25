//
//  Float+Value.swift
//  Outlaw
//
//  Created by Brian Mullen on 11/5/16.
//  Copyright © 2016 Molbie LLC. All rights reserved.
//

import Foundation


extension Float: Value {
    public static func value(from object: Any) throws -> Float {
        let value: Float
        
        switch object {
            case let rawValue as Double:
                value = ValueType(rawValue)
            case let rawValue as Float:
                value = ValueType(rawValue)
            case let rawValue as NSNumber:
                value = ValueType(rawValue.floatValue)
            default:
                throw OutlawError.typeMismatch(expected: ValueType.self, actual: type(of: object))
        }
        
        return value
    }
}
extension Double: Value {
    public static func value(from object: Any) throws -> Double {
        let value: Double
        
        switch object {
        case let rawValue as Double:
            value = ValueType(rawValue)
        case let rawValue as Float:
            value = ValueType(rawValue)
        case let rawValue as NSNumber:
            value = ValueType(rawValue.floatValue)
        default:
            throw OutlawError.typeMismatch(expected: ValueType.self, actual: type(of: object))
        }
        
        return value
    }
}
