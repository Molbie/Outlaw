//
//  Deserializable.swift
//  Outlaw
//
//  Created by Brian Mullen on 11/9/16.
//  Copyright © 2016 Molbie LLC. All rights reserved.
//

import Foundation


public protocol Deserializable: Outlaw.Value {
    init(object: Outlaw.Extractable) throws
}

extension Deserializable {
    public static func value(from object: Any) throws -> ValueType {
        guard let objectValue = object as? Outlaw.Extractable else {
            throw OutlawError.typeMismatch(expected: Outlaw.Extractable.self, actual: type(of: object))
        }
        guard let value = try self.init(object: objectValue) as? ValueType else {
            throw OutlawError.typeMismatch(expected: ValueType.self, actual: type(of: object))
        }
        return value
    }
}
