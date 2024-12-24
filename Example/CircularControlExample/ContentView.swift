//
//  ContentView.swift
//  CircularControlExample
//
//  Created by Phil Zakharchenko on 12/23/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationSplitView {
            List {
                NavigationLink("Simple Progress") {
                    SimpleDemoView()
                        .navigationTitle("Simple Progress")
                        .toolbarTitleDisplayMode(.inline)
                }
                
                NavigationLink("Editable Control") {
                    EditableDemoView()
                        .navigationTitle("Editable Control")
                        .toolbarTitleDisplayMode(.inline)
                }
            }
#if os(macOS)
            .navigationSplitViewColumnWidth(min: 180, ideal: 200)
#endif
        } detail: {
            Text("Select an item")
        }
    }
}
