//
//  SolidProgressTrack.swift
//  SolidDS
//
//  Created by NIKOLAI BORISOV on 17.03.2026.
//

import SwiftUI

/// A linear progress track that visually represents progress as a filled bar.
///
/// Uses a background track with a leading-aligned fill based on the current progress
struct SolidProgressTrack: View {
    
    public var progress: Double
    public var height: CGFloat
    public var tint: Color
    public var trackColor: Color
    public var shadow: SolidShadow?
    
    init(
        progress: Double,
        height: CGFloat,
        tint: Color,
        trackColor: Color,
        shadow: SolidShadow? = nil
    ) {
        self.progress = progress
        self.height = height
        self.tint = tint
        self.trackColor = trackColor
        self.shadow = shadow
    }
    
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
        .clipShape(Capsule())
        .shadow(
            color: shadow?.color ?? .clear,
            radius: shadow?.radius ?? 0,
            x: shadow?.x ?? 0,
            y: shadow?.y ?? 0
        )
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
