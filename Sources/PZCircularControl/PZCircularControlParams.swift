//
//  PZCircularControlParams.swift
//  PZCircularControl
//
//  Created by Phil Zet on 12/6/19.
//

import SwiftUI
import Combine

open class PZCircularControlParams<InnerBackgoundType: ShapeStyle,
                                   OuterBackgroundType: ShapeStyle,
                                   TintType: ShapeStyle>: ObservableObject {
    
    @Published public var progress: CGFloat = 0
    @Published public var innerBackgroundColor: InnerBackgoundType
    @Published public var outerBackgroundColor: OuterBackgroundType
    @Published public var tintColor: TintType
    @Published public var textColor: Color
    @Published public var barWidth: CGFloat
    @Published public var glowDistance: CGFloat
    @Published public var font: Font
    @Published public var textFormatter: ((CGFloat) -> String)
    @Published public var overlayView: AnyView?
    
    public init(
        innerBackgroundColor: InnerBackgoundType = Color.clear as! InnerBackgoundType,
        outerBackgroundColor: OuterBackgroundType = Color.gray as! OuterBackgroundType,
        tintColor: TintType = LinearGradient(
            gradient: Gradient(colors: [.blue, .purple]),
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        ) as! TintType,
        textColor: Color = .black,
        barWidth: CGFloat = 20.0,
        glowDistance: CGFloat = 10.0,
        font: Font = .largeTitle,
        initialValue: CGFloat = 0.0,
        textFormatter: @escaping ((CGFloat) -> String) = { progress in
            "\(Int(progress * 100))%"
        },
        overlayView: AnyView? = nil
    ) {
        self.innerBackgroundColor = innerBackgroundColor
        self.outerBackgroundColor = outerBackgroundColor
        self.tintColor = tintColor
        self.textColor = textColor
        self.barWidth = barWidth
        self.glowDistance = glowDistance
        self.font = font
        self.progress = initialValue
        self.textFormatter = textFormatter
        self.overlayView = overlayView
    }
    
}

extension PZCircularControlParams: Equatable, Hashable {
    
    public static func == (lhs: PZCircularControlParams, rhs: PZCircularControlParams) -> Bool {
        return lhs.barWidth == rhs.barWidth
            && lhs.progress == rhs.progress
            && lhs.textColor == rhs.textColor
            && lhs.glowDistance == rhs.glowDistance
            && lhs.font == rhs.font
    }
    
    public func hash(into hasher: inout Hasher) {
        var hashValue: Int {
            var hasher = Hasher()
            self.hash(into: &hasher)
            return hasher.finalize()
        }
    }
}
