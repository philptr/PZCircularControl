//
//  SimpleDemoView.swift
//  CircularControlExample
//
//  Created by Phil Zakharchenko on 12/24/24.
//

import SwiftUI
import PZCircularControl

struct SimpleDemoView: View {
    var body: some View {
        DynamicView {
            contentView
        }
    }
    
    @ViewBuilder
    private var contentView: some View {
        CircularControl(progress: 0.4)
            .padding()
        
        CircularControl(progress: 0.63, strokeWidth: 30, style: .init(
            track: Color.indigo.opacity(0.2),
            progress: LinearGradient(
                colors: [.teal, .blue],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            ),
            shadow: .init(color: .teal.opacity(0.6), radius: 12)
        ), format: .fraction)
        .fontDesign(.serif)
        .padding()
        
        CircularControl(
            progress: 0.75,
            strokeWidth: 25,
            style: .init(
                track: Color.orange.opacity(0.2),
                progress: Color.orange
            )
        ) {
            Image(systemName: "star.fill")
                .font(.largeTitle)
                .foregroundStyle(.orange)
        }
        .padding()
    }
}
