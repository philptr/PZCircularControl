//
//  PZExampleButton.swift
//  PZCircularControl
//
//  Created by Phil Zet on 12/6/19.
//

import SwiftUI

public struct PZExampleButton: View {
    public let label: String
    public var font: Font = .title
    public var textColor: Color = .white
    public let action: () -> ()
    
    public init(label: String, font: Font, action: @escaping () -> ()) {
        self.label = label
        self.font = font
        self.action = action
    }
    
    public var body: some View {
        Button(action: {
            self.action()
        }, label: {
            Text(label)
                .font(font)
                .padding(10)
                .frame(width: 70)
                .background(RoundedRectangle(cornerRadius: 10).foregroundColor(Color.blue).shadow(radius: 2))
                .foregroundColor(textColor)
            
        })
    }
}
