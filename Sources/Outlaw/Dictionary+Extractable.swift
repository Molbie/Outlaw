//
//  Dictionary+Extractable.swift
//  Outlaw
//
//  Created by Brian Mullen on 11/5/16.
//  Copyright © 2016 Molbie LLC. All rights reserved.
//

import Foundation


extension Dictionary: Extractable {
    public func optionalAny(for key: Outlaw.Key) -> Any? {
        guard let aKey = key as? Key else { return nil }
        return self[aKey]
    }
}

extension NSDictionary: Extractable {
    public func any(for key: Outlaw.Key) throws -> Any {
        guard let value: Any = self.value(forKeyPath: key.outlawKey) else {
            throw OutlawError.keyNotFound(key: key)
        }
        if let _ = value as? NSNull {
            throw OutlawError.nullValueWithKey(key: key)
        }
        return value
    }
    
    public func optionalAny(for key: Outlaw.Key) -> Any? {
        return self[key]
    }
}
