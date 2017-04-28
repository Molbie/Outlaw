//
//  Serializable.swift
//  Outlaw
//
//  Created by Brian Mullen on 11/9/16.
//  Copyright © 2016 Molbie LLC. All rights reserved.
//

import Foundation


public protocol Serializable {
    associatedtype SerializedObject: Extractable
    
    func serialized() -> Self.SerializedObject
}
