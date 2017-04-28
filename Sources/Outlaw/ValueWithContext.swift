//
//  ValueWithContext.swift
//  Outlaw
//
//  Created by Brian Mullen on 11/15/16.
//  Copyright © 2016 Molbie LLC. All rights reserved.
//

import Foundation


public protocol ValueWithContext {
    associatedtype Context
    associatedtype ValueType = Self
    
    static func value(from object: Any, using context: Context) throws -> ValueType
}

extension ValueWithContext {
    public static func value(from object: Any, using context: Context) throws -> ValueType {
        guard let objectValue = object as? ValueType else {
            throw OutlawError.typeMismatch(expected: ValueType.self, actual: type(of: object))
        }
        return objectValue
    }
}
