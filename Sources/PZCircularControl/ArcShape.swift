//
//  ArcShape.swift
//  PZCircularControl
//
//  Created by Zetegy on 12/6/19.
//

import SwiftUI

internal struct ArcShape: Shape {
    
    let pct: CGFloat
    
    func path(in rect: CGRect) -> Path {
        
        var p = Path()
        
        p.addArc(center: CGPoint(x: rect.width / 2.0, y:rect.height / 2.0),
                 radius: rect.height / 2.0 + 5.0,
                 startAngle: .degrees(-90.0),
                 endAngle: .degrees(360.0 * Double(pct) - 90.0), clockwise: false)
        
        return p
    }
}
