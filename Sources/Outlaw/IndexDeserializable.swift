//
//  IndexDeserializable.swift
//  Outlaw
//
//  Created by Brian Mullen on 11/23/16.
//  Copyright © 2016 Molbie LLC. All rights reserved.
//

import Foundation


public protocol IndexDeserializable: Value {
    init(object: IndexExtractable) throws
}

extension IndexDeserializable {
    public static func value(from object: Any) throws -> ValueType {
        guard let objectValue = object as? IndexExtractable else {
            throw OutlawError.typeMismatch(expected: IndexExtractable.self, actual: type(of: object))
        }
        guard let value = try self.init(object: objectValue) as? ValueType else {
            throw OutlawError.typeMismatch(expected: ValueType.self, actual: type(of: object))
        }
        return value
    }
}
