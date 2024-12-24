//
//  HapticFeedback.swift
//  PZCircularControl
//
//  Created by Phil Zakharchenko on 12/23/24.
//

#if os(iOS)

import UIKit

@MainActor
enum HapticFeedback {
    case light
    case selection
    case impact(UIImpactFeedbackGenerator.FeedbackStyle)
    
    func play() {
        switch self {
        case .light:
            let generator = UIImpactFeedbackGenerator(style: .light)
            generator.impactOccurred()
        case .selection:
            let generator = UISelectionFeedbackGenerator()
            generator.selectionChanged()
        case .impact(let style):
            let generator = UIImpactFeedbackGenerator(style: style)
            generator.impactOccurred()
        }
    }
}

#endif
