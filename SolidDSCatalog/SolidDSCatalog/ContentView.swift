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
        NavigationStack {
            List {
                HStack {
                    Spacer()
                    Text("SolidProgress")
                    Spacer()
                }
                NavigationLink {
                    SolidProgressDemoView(controlType: .buttons)
                } label: {
                    Text("Progress (Buttons)")
                        .foregroundColor(.accentColor)
                }
                NavigationLink {
                    SolidProgressDemoView(controlType: .slider)
                } label: {
                    Text("Progress (Slider)")
                        .foregroundColor(.accentColor)
                }
                NavigationLink {
                    SolidProgressAllTypesDemoView()
                } label: {
                    Text("All Progress Types")
                        .foregroundColor(.accentColor)
                }
            }
            .padding(.top)
            .navigationTitle("SolidDS Catalog")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
