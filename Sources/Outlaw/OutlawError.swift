//
//  OutlawError.swift
//  Outlaw
//
//  Created by Brian Mullen on 11/5/16.
//  Copyright © 2016 Molbie LLC. All rights reserved.
//

import Foundation


public enum OutlawError: Error, CustomStringConvertible {
    case typeMismatch(expected: Any, actual: Any)
    case keyNotFound(key: Key)
    case nullValueWithKey(key: Key)
    case typeMismatchWithKey(key: Key, expected: Any, actual: Any)
    case indexNotFound(index: Index)
    case nullValueWithIndex(index: Index)
    case typeMismatchWithIndex(index: Index, expected: Any, actual: Any)
    
    public var description: String {
        switch self {
        case let .typeMismatch(expected, actual):
            return "Type mismatch. Expected `\(expected)`. Got `\(actual)`"
        case let .keyNotFound(key):
            return "Key not found: `\(key.outlawKey)`"
        case let .nullValueWithKey(key):
            return "Null Value found for key: `\(key.outlawKey)`"
        case let .typeMismatchWithKey(key, expected, actual):
            return "Type mismatch. Expected `\(expected)` for key: `\(key.outlawKey)`. Got `\(actual)`"
        case let .indexNotFound(index):
            return "Index not found: `\(index.outlawIndex)`"
        case let .nullValueWithIndex(index):
            return "Null Value found for index: `\(index.outlawIndex)`"
        case let .typeMismatchWithIndex(index, expected, actual):
            return "Type mismatch. Expected `\(expected)` for index: `\(index.outlawIndex)`. Got `\(actual)`"
        }
    }
}
