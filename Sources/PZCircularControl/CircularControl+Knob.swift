//
//  CircularControl+Knob.swift
//  PZCircularControl
//
//  Created by Phil Zakharchenko on 12/23/24.
//

import SwiftUI

extension CircularControl {
    struct Knob: View {
        let style: KnobStyle
        let position: CGPoint
        @Binding var isDragging: Bool
        
        @Environment(\.isEnabled) private var isEnabled
        
        var body: some View {
            Rectangle()
                .fill(style.opacity(isEnabled ? isDragging ? 0.8 : 1 : 0.3))
                .background(.thinMaterial)
                .clipShape(.circle)
                .shadow(radius: 0.5)
                .shadow(radius: isDragging ? 3 : 2)
#if !os(macOS)
                .hoverEffect()
#endif
        }
    }
}
