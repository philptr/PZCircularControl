//
//  CircularControlStyle.swift
//  PZCircularControl
//
//  Created by Phil Zakharchenko on 12/23/24.
//

import SwiftUI

public struct CircularControlStyle<TrackStyle: ShapeStyle, ProgressStyle: ShapeStyle, KnobStyle: ShapeStyle> {
    public struct Shadow {
        let color: Color
        let radius: CGFloat
        
        public init(color: Color, radius: CGFloat) {
            self.color = color
            self.radius = radius
        }
    }
    
    let track: TrackStyle
    let progress: ProgressStyle
    let knob: KnobStyle
    let shadow: Shadow?
    
    public init(
        track: TrackStyle = Color.secondary.opacity(0.2),
        progress: ProgressStyle = LinearGradient(
            colors: [.blue, .purple],
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        ),
        knob: KnobStyle = Color.circularControlKnob,
        shadow: Shadow? = .init(color: .blue.opacity(0.3), radius: 8)
    ) {
        self.track = track
        self.progress = progress
        self.knob = knob
        self.shadow = shadow
    }
}
