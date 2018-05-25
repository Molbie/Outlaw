//
//  URL+Value.swift
//  Outlaw
//
//  Created by Brian Mullen on 11/15/16.
//  Copyright © 2016 Molbie LLC. All rights reserved.
//

import Foundation


extension URL: Value {
    public static func value(from object: Any) throws -> URL {
        guard let value = object as? String else {
            throw OutlawError.typeMismatch(expected: String.self, actual: type(of: object))
        }
        guard let objectValue = URL(string: value) else {
            throw OutlawError.typeMismatch(expected: "valid URL", actual: value)
        }
        return objectValue
    }
}
