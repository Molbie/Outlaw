//
//  IndexUpdatable.swift
//  Outlaw
//
//  Created by Brian Mullen on 11/23/16.
//  Copyright © 2016 Molbie LLC. All rights reserved.
//

import Foundation


public protocol IndexUpdatable {
    mutating func update(with object: IndexExtractable) throws
}
