//
//  ContentView.swift
//  SolidDSCatalog
//
//  Created by NIKOLAI BORISOV on 14.03.2026.
//

import SwiftUI
import SolidDS

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
            
            SolidProgress(value: 0.77, progressStyle: .linear)
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
