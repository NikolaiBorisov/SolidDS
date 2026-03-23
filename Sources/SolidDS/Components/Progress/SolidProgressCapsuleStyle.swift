//
//  SolidProgressCapsuleStyle.swift
//  SolidDS
//
//  Created by NIKOLAI BORISOV on 20.03.2026.
//

import SwiftUI

/// A style struct that defines the visual appearance of a capsule in `SolidProgress`.
/// 
/// Encapsulates background, border, glass effect, and padding.
public struct SolidProgressCapsuleStyle {
    
    // MARK: - Defaults
    public static let defaultPadding = EdgeInsets(
        top: 4,
        leading: 8,
        bottom: 4,
        trailing: 8
    )
    
    public var background: AnyShapeStyle
    public var backgroundImage: Image?
    
    public var border: SolidBorder
    
    public var glassStyle: SolidProgressGlassStyle
    public var glassColors: [Color]?
    
    public var padding: EdgeInsets
    
    public init(
        background: AnyShapeStyle = AnyShapeStyle(.secondary.opacity(0.15)),
        backgroundImage: Image? = nil,
        
        border: SolidBorder = .init(),
        
        glassStyle: SolidProgressGlassStyle = .none,
        glassColors: [Color]? = nil,
        
        padding: EdgeInsets = SolidProgressCapsuleStyle.defaultPadding
    ) {
        self.background = background
        self.backgroundImage = backgroundImage
        
        self.border = border
        
        self.glassStyle = glassStyle
        self.glassColors = glassColors
        
        self.padding = padding
    }
}

// MARK: - 🧠 Code for Thought
/*
 MARK: - Architecture: Capsule Styling
 
 `SolidProgressCapsuleStyle` is designed using core object-oriented
 principles and SOLID guidelines.
 
 ### Encapsulation
 Groups all capsule-related properties into a single cohesive unit,
 hiding internal styling details from `SolidProgress`.
 
 ### Single Responsibility Principle (SRP)
 - `SolidProgress` → handles layout and progress logic
 - `SolidProgressCapsuleStyle` → handles visual styling only
 
 ### Open/Closed Principle (OCP)
 New styling features (e.g. shadow, gradients, animations) can be added
 without modifying existing `SolidProgress` implementation.
 
 ### Benefits
 - Cleaner and more scalable API
 - Improved readability and maintainability
 - Easier testing and reuse across components
 */
