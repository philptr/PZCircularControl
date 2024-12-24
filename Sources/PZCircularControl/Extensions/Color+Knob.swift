//
//  Color+Knob.swift
//  PZCircularControl
//
//  Created by Phil Zakharchenko on 12/23/24.
//

import SwiftUI

extension Color {
    public static var circularControlKnob: Self {
#if os(macOS)
        Color(nsColor: NSColor.controlColor)
#else
        .white
#endif
    }
}
