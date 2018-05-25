//
//  IndexDeserializableWithContext.swift
//  Outlaw
//
//  Created by Brian Mullen on 11/23/16.
//  Copyright © 2016 Molbie LLC. All rights reserved.
//

import Foundation


public protocol IndexDeserializableWithContext: ValueWithContext {
    init(object: IndexExtractable, using context: Context) throws
}

extension IndexDeserializableWithContext {
    public static func value(from object: Any, using context: Context) throws -> ValueType {
        guard let objectValue = object as? IndexExtractable else {
            throw OutlawError.typeMismatch(expected: IndexExtractable.self, actual: type(of: object))
        }
        guard let value = try self.init(object: objectValue, using: context) as? ValueType else {
            throw OutlawError.typeMismatch(expected: ValueType.self, actual: type(of: object))
        }
        return value
    }
}
