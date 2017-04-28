//
//  UpdatableWithContext.swift
//  Outlaw
//
//  Created by Brian Mullen on 11/15/16.
//  Copyright © 2016 Molbie LLC. All rights reserved.
//

import Foundation


public protocol UpdatableWithContext {
    associatedtype UpdatableContext
    
    mutating func update(with object: Extractable, using context: UpdatableContext) throws
}
