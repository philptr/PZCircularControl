//
//  PercentageIndicator.swift
//  PZCircularControl
//
//  Created by Zetegy on 12/6/19.
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
    var overlayView: (any View)?
    
    var animatableData: CGFloat {
        get { pct }
        set { pct = newValue }
    }
    
    private var strokeStyle: StrokeStyle {
        StrokeStyle(
            lineWidth: self.barWidth,
            lineCap: .round
        )
    }
    
    private var overlayOrLabel: any View {
        guard let overlayView else {
            return LabelView(
                pct: pct,
                textColor: textColor,
                font: self.font,
                textFormatter: textFormatter
            )
        }
        
        return overlayView
    }
    
    func body(content: Content) -> some View {
        content
            .overlay {
                isBackground ? nil :
                ArcShape(pct: pct)
                    .stroke(style: strokeStyle)
                    .fill(tintColor)
                    .blur(radius: glowDistance)
                    .opacity(0.95)
            }
            .overlay {
                ArcShape(pct: pct)
                    .stroke(style: strokeStyle)
                    .fill(tintColor)
            }
            .overlay {
                isBackground ? nil : AnyView(overlayOrLabel)
            }
    }
    
    
}
