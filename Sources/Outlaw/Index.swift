//
//  Index.swift
//  Outlaw
//
//  Created by Brian Mullen on 11/23/16.
//  Copyright © 2016 Molbie LLC. All rights reserved.
//

import Foundation


public protocol Index {
    var outlawIndex: Int { get }
}

extension Int: Index {
    public var outlawIndex: Int {
        return self
    }
}
