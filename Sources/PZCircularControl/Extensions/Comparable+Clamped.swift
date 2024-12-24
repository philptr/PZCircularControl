//
//  Comparable+Clamped.swift
//  PZCircularControl
//
//  Created by Phil Zakharchenko on 12/23/24.
//

import Foundation

extension Comparable {
    func clamped(to limits: ClosedRange<Self>) -> Self {
        min(max(self, limits.lowerBound), limits.upperBound)
    }
}
