//
//  LinearProgressTrack.swift
//  SolidDS
//
//  Created by NIKOLAI BORISOV on 17.03.2026.
//

import SwiftUI

/// A linear progress track that visually represents progress as a filled bar.
///
/// Uses a background track with a leading-aligned fill based on the current progress
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

// MARK: - 🧠 Code for Thought
/*
 `LinearProgressTrack` focuses solely on rendering the progress bar.

 - Uses `GeometryReader` to adapt fill width dynamically
 - Separates track (background) and fill (foreground) for clarity
 - Keeps logic minimal and purely visual (SRP)

 Benefits:
 - Simple and predictable rendering
 - Easy to customize and reuse
 - Decoupled from layout and higher-level components
 */
