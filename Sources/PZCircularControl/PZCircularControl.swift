//
//  PZCircularControl.swift
//  PZCircularControl
//
//  Created by Phil Zet on 12/6/19.
//

import Foundation
import SwiftUI
import Combine

public struct PZCircularControl<InnerBackgoundType: ShapeStyle, OuterBackgroundType: ShapeStyle, TintType: ShapeStyle>: View {
    
    public var id: Int = Int.random(in: 0...999)
    
    @ObservedObject public var params: PZCircularControlParams<InnerBackgoundType, OuterBackgroundType, TintType>
    
    public init(id: Int, _ params: PZCircularControlParams<InnerBackgoundType, OuterBackgroundType, TintType>) {
        self.id = id
        self.params = params
    }
    
    public init(_ params: PZCircularControlParams<InnerBackgoundType, OuterBackgroundType, TintType>) {
        self.params = params
    }
    
    public init() {
        self.params = PZCircularControlParams()
    }
    
    public var body: some View {
        Color.clear.overlay(
            Indicator<InnerBackgoundType, OuterBackgroundType, TintType>(
                progress: self.params.progress,
                innerBackgroundColor: self.params.innerBackgroundColor,
                outerBackgroundColor: self.params.outerBackgroundColor,
                tintColor: self.params.tintColor,
                textColor: self.params.textColor,
                barWidth: self.params.barWidth,
                glowDistance: self.params.glowDistance,
                font: self.params.font,
                textFormatter: self.params.textFormatter
            )
        )
    }
}

