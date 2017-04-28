//
//  Updatable.swift
//  Outlaw
//
//  Created by Brian Mullen on 11/9/16.
//  Copyright © 2016 Molbie LLC. All rights reserved.
//

import Foundation


public protocol Updatable {
    mutating func update(with object: Extractable) throws
}
