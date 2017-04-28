//
//  Key.swift
//  Outlaw
//
//  Created by Brian Mullen on 11/5/16.
//  Copyright © 2016 Molbie LLC. All rights reserved.
//


import Foundation


public protocol Key {
    var outlawKey: String { get }
}

extension String: Key {
    public var outlawKey: String {
        return self
    }
}
