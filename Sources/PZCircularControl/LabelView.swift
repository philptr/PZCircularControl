//
//  LabelView.swift
//  PZCircularControl
//
//  Created by Zetegy on 12/6/19.
//

import SwiftUI

internal struct LabelView: View {
    
    let pct: CGFloat
    let textColor: Color
    var font: Font
    var textFormatter: ((CGFloat) -> String)
    
    var body: some View {
        Text(textFormatter(pct))
            .font(self.font)
            .fontWeight(.bold)
            .foregroundColor(self.textColor)
    }
}
