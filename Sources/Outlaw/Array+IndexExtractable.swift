//
//  Array+IndexExtractable.swift
//  Outlaw
//
//  Created by Brian Mullen on 11/23/16.
//  Copyright © 2016 Molbie LLC. All rights reserved.
//

import Foundation


extension Array: IndexExtractable {
    public func optionalAny(for index: Outlaw.Index) -> Any? {
        guard let anIndex = index as? Index else { return nil }
        return self[anIndex]
    }
}

extension NSArray: IndexExtractable {
    public var isEmpty: Bool {
        return count == 0
    }
    
    public func optionalAny(for index: Outlaw.Index) -> Any? {
        return self[index.outlawIndex]
    }
}
