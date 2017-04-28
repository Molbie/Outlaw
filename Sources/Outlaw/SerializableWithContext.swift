//
//  SerializableWithContext.swift
//  Outlaw
//
//  Created by Brian Mullen on 11/15/16.
//  Copyright © 2016 Molbie LLC. All rights reserved.
//

import Foundation


public protocol SerializableWithContext {
    associatedtype SerializableContext
    associatedtype SerializedObject: Extractable
    
    func serialized(using context: SerializableContext) -> Self.SerializedObject
}
