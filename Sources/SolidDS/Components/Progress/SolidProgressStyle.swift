//
//  SolidProgressStyle.swift
//  SolidDS
//
//  Created by NIKOLAI BORISOV on 23.03.2026.
//

import SwiftUI

/// Defines the visual styling of a `SolidProgress` view.
/// 
/// Includes colors, track size, and padding shared across all progress types.
public struct SolidProgressStyle {
    
    // MARK: - Defaults
    public enum ProgressDefaults {
        public static let progressPadding = EdgeInsets(
            top: 6,
            leading: 8,
            bottom: 6,
            trailing: 8
        )
    }
    
    public var type: SolidProgressType
    public var tint: Color
    public var trackColor: Color
    public var trackHeight: CGFloat
    public var padding: EdgeInsets
    
    public init(
        type: SolidProgressType = .linear,
        tint: Color = .accentColor,
        trackColor: Color = Color.secondary.opacity(0.2),
        trackHeight: CGFloat = 4,
        padding: EdgeInsets = ProgressDefaults.progressPadding
    ) {
        self.type = type
        self.tint = tint
        self.trackColor = trackColor
        self.trackHeight = trackHeight
        self.padding = padding
    }
}

// MARK: - 🧠 Code for Thought
/*
 `SolidProgressStyle` encapsulates all progress-related styling
 into a single, reusable configuration.
 
 - Keeps `SolidProgress` focused on layout and logic (SRP)
 - Enables easy extension without modifying core implementation (OCP)
 
 Benefits:
 - Encapsulated styling
 - Cleaner API
 - Better scalability
 - Improved readability and reuse
 */
