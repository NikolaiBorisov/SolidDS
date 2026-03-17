//
//  LinearProgressTrack.swift
//  SolidDS
//
//  Created by NIKOLAI BORISOV on 17.03.2026.
//

import SwiftUI

struct LinearProgressTrack: View {
    
    var progress: Double
    var height: CGFloat
    var tint: Color
    var trackColor: Color
    
    var body: some View {
        
        GeometryReader { geo in
            
            Capsule()
                .fill(trackColor)
                .overlay(alignment: .leading) {
                    Capsule()
                        .fill(tint)
                        .frame(width: geo.size.width * progress)
                }
            
        }
        .frame(maxWidth: .infinity)
        .frame(height: height)
        .clipped()
    }
}
