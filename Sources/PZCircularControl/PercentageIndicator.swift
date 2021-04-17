//
//  PercentageIndicator.swift
//  PZCircularControl
//
//  Created by Phil Zet on 12/6/19.
//

import SwiftUI

internal struct PercentageIndicator<S: ShapeStyle>: AnimatableModifier {
    var pct: CGFloat = 0.0
    var tintColor: S
    var isBackground: Bool = false
    var textColor: Color
    var barWidth: CGFloat
    var glowDistance: CGFloat
    var font: Font
    var textFormatter: ((CGFloat) -> String)
    
    var animatableData: CGFloat {
        get { pct }
        set { pct = newValue }
    }
    
    func body(content: Content) -> some View {
        content
            .overlay(!self.isBackground ? ArcShape(pct: pct)
                        .stroke(style:
                                    StrokeStyle(lineWidth: self.barWidth, lineCap: .round))
                        .fill(self.tintColor)
                        .blur(radius: self.glowDistance)
                        .opacity(0.95)
                        : nil
            )
            .overlay(ArcShape(pct: pct)
                        .stroke(style:
                                    StrokeStyle(lineWidth: self.barWidth, lineCap: .round))
                        .fill(self.tintColor)
                     
            )
            .overlay(!self.isBackground ? LabelView(pct: pct, textColor: self.textColor, font: self.font, textFormatter: self.textFormatter) : nil)
    }
    
    
}
