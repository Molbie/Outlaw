//
//  Dictionary+map.swift
//  Outlaw
//
//  Created by Brian Mullen on 11/6/16.
//  Copyright © 2016 Molbie LLC. All rights reserved.
//

import Foundation


internal extension Dictionary {
    internal init(_ pairs: [Element]) {
        self.init()
        for (k, v) in pairs {
            self[k] = v
        }
    }
    
    internal func map<K: Hashable, V>(_ transform: (Element) throws -> (K, V)) rethrows -> [K: V] {
        return Dictionary<K, V>(try map(transform))
    }
}
