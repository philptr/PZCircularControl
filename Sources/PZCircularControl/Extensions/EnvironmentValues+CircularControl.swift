//
//  EnvironmentValues+CircularControl.swift
//  PZCircularControl
//
//  Created by Phil Zakharchenko on 12/23/24.
//

import SwiftUI

extension EnvironmentValues {
    @Entry public var circularControlAllowsWrapping: Bool = false
    @Entry public var circularControlKnobScale: CGFloat = 1.4
    @Entry public var circularControlProgress: Double = 0
}

extension View {
    public func circularControlAllowsWrapping(_ allows: Bool) -> some View {
        environment(\.circularControlAllowsWrapping, allows)
    }
    
    public func circularControlKnobScale(_ scale: CGFloat) -> some View {
        environment(\.circularControlKnobScale, scale)
    }
}
