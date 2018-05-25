//
//  Value.swift
//  Outlaw
//
//  Created by Brian Mullen on 11/5/16.
//  Copyright © 2016 Molbie LLC. All rights reserved.
//

import Foundation


public protocol Value {
    associatedtype ValueType = Self
    
    static func value(from object: Any) throws -> ValueType
}

extension Value {
    public static func value(from object: Any) throws -> ValueType {
        guard let objectValue = object as? ValueType else {
            throw OutlawError.typeMismatch(expected: ValueType.self, actual: type(of: object))
        }
        return objectValue
    }
}
