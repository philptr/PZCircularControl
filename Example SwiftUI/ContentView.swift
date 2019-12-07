//
//  ContentView.swift
//  Example SwiftUI
//
//  Created by Phil Zet on 12/6/19.
//

import SwiftUI
import PZCircularControl

struct ContentView: View {
    
    var myControls = [
        PZCircularControl(
            PZCircularControlParams(
                innerBackgroundColor: Color.clear,
                outerBackgroundColor: Color.gray.opacity(0.5),
                tintColor: LinearGradient(gradient: Gradient(colors: [.red, .orange]), startPoint: .topLeading, endPoint: .bottomTrailing)
            )
        ),
        PZCircularControl(
            PZCircularControlParams(
                innerBackgroundColor: Color.clear,
                outerBackgroundColor: Color.gray.opacity(0.5),
                tintColor: LinearGradient(gradient: Gradient(colors: [.blue, .purple]), startPoint: .topLeading, endPoint: .bottomTrailing),
                textColor: .purple,
                barWidth: 25.0
            )
        )
    ]

    var body: some View {
        VStack {
            Spacer()
           
            ForEach(self.myControls, id: \.id) { control in
                VStack {
                    control
                    Spacer()
                    HStack(spacing: 10) {
                        PZExampleButton(label: "0%", font: .headline) { withAnimation(.easeInOut(duration: 1.0)) { control.params.progress = 0.0 } }

                        PZExampleButton(label: "35%", font: .headline) { withAnimation(.easeInOut(duration: 1.0)) { control.params.progress = CGFloat(0.35) } }

                        PZExampleButton(label: "100%", font: .headline) { withAnimation(.easeInOut(duration: 1.0)) { control.params.progress = CGFloat(1.0) } }
                        
                        PZExampleButton(label: "?", font: .headline) { withAnimation(.easeInOut(duration: 1.0)) { control.params.progress = CGFloat(Float.random(in: 0...1)) } }
                    }
                }
            }
            
           
        }.navigationBarTitle("Example 10")
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    
    static let examples = [
        PZCircularControl(
            PZCircularControlParams(
                innerBackgroundColor: Color.clear,
                outerBackgroundColor: Color.gray.opacity(0.5),
                tintColor: LinearGradient(gradient: Gradient(colors: [Color.red, Color.orange]), startPoint: .topLeading, endPoint: .bottomTrailing),
                initialValue: CGFloat(Float.random(in: 0...1))
            )
        ),
        PZCircularControl(
            PZCircularControlParams(
                innerBackgroundColor: Color.clear,
                outerBackgroundColor: Color.gray.opacity(0.5),
                tintColor: LinearGradient(gradient: Gradient(colors: [.blue, .purple]), startPoint: .bottomLeading, endPoint: .topLeading),
                textColor: .purple,
                barWidth: 30.0,
                glowDistance: 30.0,
                initialValue: CGFloat(Float.random(in: 0...1))
            )
        ),
        PZCircularControl(
            PZCircularControlParams(
                innerBackgroundColor: Color.black,
                outerBackgroundColor: Color.black,
                tintColor: LinearGradient(gradient: Gradient(colors: [.yellow, .pink]), startPoint: .bottomLeading, endPoint: .topLeading),
                textColor: .orange,
                barWidth: 30.0,
                glowDistance: 30.0,
                initialValue: CGFloat(Float.random(in: 0...1))
            )
        )
    ]
    
    static var previews: some View {
        Group {
            
            ContentView()
            
            ForEach(examples, id: \.id) { control in
                Group {
                    control
                    }.previewLayout(.fixed(width: 300, height: 300))
            }
            
        }
    }
    
}
#endif
