//
//  SolidProgressDemoView.swift
//  SolidDSCatalog
//
//  Created by NIKOLAI BORISOV on 16.03.2026.
//

import SwiftUI
import SolidDS

struct SolidProgressDemoView: View {
    
    enum ControlType {
        case buttons
        case slider
    }
    
    let controlType: ControlType
    
    @State private var progress: Double = 0.05
    
    var body: some View {
        
        VStack(spacing: 20) {
            
            SolidProgress(
                value: progress,
                valueFormat: .decimal(places: 1, percent: true),
                style: .capsule,
                progressStyle: .linear
            )
            
            controls
                .padding(.horizontal)
        }
    }
    
    @ViewBuilder
    private var controls: some View {
        
        switch controlType {
            
        case .buttons:
            
            HStack(spacing: 20) {
                
                Button {
                    progress = max(progress - 0.05, 0)
                } label: {
                    Image(systemName: "minus")
                        .frame(width: 20, height: 20)
                }
                .buttonStyle(.borderedProminent)
                
                Button {
                    progress = min(progress + 0.05, 1)
                } label: {
                    Image(systemName: "plus")
                        .frame(width: 20, height: 20)
                }
                .buttonStyle(.borderedProminent)
            }
            
        case .slider:
            
            Slider(value: $progress, in: 0...1)
        }
    }
}
