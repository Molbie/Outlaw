//
//  String+Value.swift
//  Outlaw
//
//  Created by Brian Mullen on 11/5/16.
//  Copyright © 2016 Molbie LLC. All rights reserved.
//

import Foundation


extension String: Value {}
extension Character: Value {
    public static func value(from object: Any) throws -> Character {
        guard let value = object as? String else {
            throw OutlawError.typeMismatch(expected: ValueType.self, actual: type(of: object))
        }
        return ValueType(value)
    }
}
