//
//  Indicator.swift
//  PZCircularControl
//
//  Created by Phil Zet on 12/6/19.
//

import SwiftUI

internal struct Indicator<InnerBackgoundType: ShapeStyle, OuterBackgroundType: ShapeStyle, TintType: ShapeStyle>: View {
    var progress: CGFloat
    var innerBackgroundColor: InnerBackgoundType
    var outerBackgroundColor: OuterBackgroundType
    var tintColor: TintType
    var textColor: Color
    var barWidth: CGFloat
    var glowDistance: CGFloat
    var font: Font
    
    var body: some View {
        
        GeometryReader { geometry in
            ZStack {
                Circle()
                    .fill(self.innerBackgroundColor)
                    .modifier(
                        PercentageIndicator<OuterBackgroundType>(
                            pct: 1.0,
                            tintColor: self.outerBackgroundColor,
                            isBackground: true,
                            textColor: self.textColor,
                            barWidth: self.barWidth,
                            glowDistance: self.glowDistance,
                            font: self.font
                        )
                    )
                    .modifier(
                        PercentageIndicator<TintType>(
                            pct: self.progress,
                            tintColor: self.tintColor,
                            textColor: self.textColor,
                            barWidth: self.barWidth,
                            glowDistance: self.glowDistance,
                            font: self.font
                        )
                    )
            }
        }
        .aspectRatio(1, contentMode: .fit)
        .padding(2 + self.glowDistance)
        .onAppear() {
            
        }
        
    }
}
