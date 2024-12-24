//
//  DynamicView.swift
//  CircularControlExample
//
//  Created by Phil Zakharchenko on 12/24/24.
//

import SwiftUI

/// A view that switches between horizontal and vertical layouts depending on the horizontal size class and fitting size.
struct DynamicView<Content: View>: View {
    @ViewBuilder let contentView: Content
    
#if !os(macOS)
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
#else
    enum SizeClass {
        case compact
        case regular
    }
    
    private let horizontalSizeClass: SizeClass = .regular
#endif
    
    var body: some View {
        ViewThatFits {
            switch horizontalSizeClass {
            case .regular:
                HStack {
                    contentView
                }
                .padding()
                
                VStack {
                    contentView
                }
                .padding()
            default:
                VStack {
                    contentView
                }
                .padding()
                
                HStack {
                    contentView
                }
                .padding()
            }
        }
    }
}
