//
//  LabelView.swift
//  PZCircularControl
//
//  Created by Phil Zet on 12/6/19.
//

import SwiftUI

internal struct LabelView: View {
    
    let pct: CGFloat
    let textColor: Color
    var font: Font
    
    var body: some View {
        Text("\(Int(pct * 100))%")
            .font(self.font)
            .fontWeight(.bold)
            .foregroundColor(self.textColor)
    }
}
