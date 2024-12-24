//
//  DefaultCircularControlLabel.swift
//  PZCircularControl
//
//  Created by Phil Zakharchenko on 12/6/19.
//

import SwiftUI

public struct DefaultCircularControlLabel: View {
    let format: CircularControlLabelFormat
    
    @Environment(\.circularControlProgress) private var progress
    
    public var body: some View {
        ViewThatFits {
            Text(format.string(from: progress))
                .font(.system(.title, weight: .semibold).monospacedDigit())
                .fixedSize()
                .foregroundStyle(.primary)
                .animation(.snappy, value: progress)
                .contentTransition(.numericText())
            
            Text("")
        }
    }
}
