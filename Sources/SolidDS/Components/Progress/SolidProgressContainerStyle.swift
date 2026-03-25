//
//  SolidProgressContainerStyle.swift
//  SolidDS
//
//  Created by NIKOLAI BORISOV on 15.03.2026.
//

import SwiftUI

/// Defines the visual styling of the progress container.
///
/// Controls background, corner radius, border, and optional glass effects.
public struct SolidProgressContainerStyle {
    
    public var background: AnyShapeStyle
    public var backgroundImage: Image?
    public var cornerRadius: CGFloat
    public var borderColor: Color?
    public var borderWidth: CGFloat
    public var glassStyle: SolidProgressGlassStyle
    public var glassColors: [Color]?
    public var shadow: SolidShadow?
    
    public init(
        background: AnyShapeStyle = AnyShapeStyle(.clear),
        backgroundImage: Image? = nil,
        cornerRadius: CGFloat = 0,
        borderColor: Color? = nil,
        borderWidth: CGFloat = 0,
        glassStyle: SolidProgressGlassStyle = .none,
        glassColors: [Color]? = nil,
        shadow: SolidShadow? = nil
    ) {
        self.background = background
        self.backgroundImage = backgroundImage
        self.cornerRadius = cornerRadius
        self.borderColor = borderColor
        self.borderWidth = borderWidth
        self.glassStyle = glassStyle
        self.glassColors = glassColors
        self.shadow = shadow
    }
}

// MARK: - 🧠 Code for Thought
/*
 `SolidProgressContainerStyle` encapsulates all container-related styling
 into a reusable configuration.
 
 - Keeps `SolidProgress` focused on layout and logic (SRP)
 - Allows extending container visuals without modifying core implementation (OCP)
 
 Benefits:
 - Encapsulated styling
 - Cleaner API
 - Better scalability
 - Improved readability and reuse
 */
