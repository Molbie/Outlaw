//
//  JSONSerializable.swift
//  Outlaw
//
//  Created by Brian Mullen on 11/26/16.
//  Copyright © 2016 Molbie LLC. All rights reserved.
//

import Foundation


public protocol JSONSerializable {
    func jsonCollection() -> JSONCollection
}
