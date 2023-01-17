//
//  PZExampleButton.swift
//  PZCircularControl
//
//  Created by Zetegy on 12/6/19.
//

import SwiftUI

public struct ExampleButton: View {
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
        Button(label, action: action)
            .foregroundColor(textColor)
            .font(font)
            .buttonStyle(.borderedProminent)
    }
}
