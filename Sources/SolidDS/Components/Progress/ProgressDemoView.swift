//
//  ProgressDemoView.swift
//  SolidDS
//
//  Created by NIKOLAI BORISOV on 27.03.2026.
//

import SwiftUI

public struct ProgressDemoView: View {
    
    @State var animation: Animation?
    
    @State private var progress: Double = 0.3
    
    public var body: some View {
        VStack(spacing: 20) {
            
            SolidProgress(
                progress: .init(
                    value: progress,
                    format: .decimal(places: 3, percent: false)
                ),
                animation: animation
            )
            .padding(.vertical)
            
            Button("Animate") {
                progress = Double.random(in: 0...1)
            }
            
            Spacer()
        }
        .padding()
    }
}
