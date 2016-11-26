//
//  Array+IndexExtractable.swift
//  Outlaw
//
//  Created by Brian Mullen on 11/23/16.
//  Copyright © 2016 Molbie LLC. All rights reserved.
//

import Foundation


extension Array: Outlaw.IndexExtractable {
    public func optionalAny(for index: Outlaw.Index) -> Any? {
        guard let anIndex = index as? Index else { return nil }
        return self[anIndex]
    }
}

extension NSArray: Outlaw.IndexExtractable {
    public func optionalAny(for index: Outlaw.Index) -> Any? {
        return self[index.outlawIndex]
    }
}
