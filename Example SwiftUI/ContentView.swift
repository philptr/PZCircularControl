//
//  ContentView.swift
//  Example SwiftUI
//
//  Created by Zetegy on 12/6/19.
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
        VStack(spacing: 40) {
            Spacer()
           
            ForEach(self.myControls, id: \.id) { control in
                VStack(spacing: 8) {
                    control
                    Spacer()
                    HStack(spacing: 8) {
                        ExampleButton(label: "0%", font: .body) { withAnimation(.easeInOut(duration: 1.0)) { control.params.progress = 0.0 } }

                        ExampleButton(label: "35%", font: .body) { withAnimation(.easeInOut(duration: 1.0)) { control.params.progress = CGFloat(0.35) } }

                        ExampleButton(label: "100%", font: .body) { withAnimation(.easeInOut(duration: 1.0)) { control.params.progress = CGFloat(1.0) } }
                        
                        ExampleButton(label: "Random", font: .body) { withAnimation(.easeInOut(duration: 1.0)) { control.params.progress = CGFloat(Float.random(in: 0...1)) } }
                    }
                }
            }
            
           
        }.navigationBarTitle("Example")
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
