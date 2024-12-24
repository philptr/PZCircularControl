//
//  EditableDemoView.swift
//  CircularControlExample
//
//  Created by Phil Zakharchenko on 12/24/24.
//

import SwiftUI
import PZCircularControl

struct EditableDemoView: View {
    @State private var isDisabled: Bool = false
    @State private var allowsWrapping: Bool = false
    
    @State private var firstProgress: Double = 0.4
    @State private var secondProgress: Double = 0.75
    
    var body: some View {
        VStack {
            GroupBox {
                Toggle("Disabled", isOn: $isDisabled)
                Toggle("Wraps Around", isOn: $allowsWrapping)
                    .disabled(isDisabled)
            }
            
            DynamicView {
                contentView
                    .circularControlAllowsWrapping(allowsWrapping)
            }
            .frame(maxHeight: .infinity, alignment: .center)
        }
        .padding()
    }
    
    @ViewBuilder
    private var contentView: some View {
        CircularControl(progress: $firstProgress)
            .padding()
            .disabled(isDisabled)
        
        CircularControl(progress: $secondProgress, strokeWidth: 30, style: .init(
            track: Color.indigo.opacity(0.2),
            progress: LinearGradient(
                colors: [.mint, .blue],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            ),
            shadow: .init(color: .mint.opacity(0.6), radius: 12)
        ))
        .fontDesign(.rounded)
        .circularControlKnobScale(1)
        .disabled(isDisabled)
        .padding()
        
        CircularControl(
            progress: $secondProgress,
            strokeWidth: 25,
            style: .init(
                track: Color.cyan.opacity(0.2),
                progress: Color.cyan
            ),
            format: .custom({ value in "\(Int(value * 10)) / 10" })
        )
        .disabled(isDisabled)
        .padding()
    }
}
