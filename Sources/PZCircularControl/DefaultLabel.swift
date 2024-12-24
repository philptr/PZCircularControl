//
//  DefaultLabel.swift
//  PZCircularControl
//
//  Created by Phil Zakharchenko on 12/6/19.
//

import SwiftUI

public struct DefaultLabel: View {
    let format: DefaultLabelFormat
    
    @Environment(\.circularControlProgress) private var progress
    
    public var body: some View {
        Text(format.string(from: progress))
            .font(.system(.title, weight: .semibold).monospacedDigit())
            .foregroundStyle(.primary)
            .animation(.snappy, value: progress)
            .contentTransition(.numericText())
    }
}

public enum DefaultLabelFormat {
    case percentage
    case fraction
    case custom((Double) -> String)
    
    func string(from value: Double) -> String {
        switch self {
        case .percentage:
            return "\(Int(value * 100))%"
        case .fraction:
            return String(format: "%.1f", value)
        case .custom(let formatter):
            return formatter(value)
        }
    }
}
