//
//  ContentView.swift
//  XCAFootballStats
//
//  Created by Davide Castaldi on 07/05/24.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct ContentView: View {
    var body: some View {
        NavigationSplitView {
            List {
                Text ("Item")
            }
            .navigationTitle ("Sidebar")
        } detail: {
            VStack {
                Model3D(named: "Scene", bundle: realityKitContentBundle)
                    .padding (.bottom, 50)
                
                Text ("Hello, world!")
            }
            .navigationTitle ("Content")
            .padding()
        }
    }
}

#Preview(windowStyle: .automatic) {
    ContentView()
}
