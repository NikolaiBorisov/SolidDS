//
//  SolidProgressValueConfiguration.swift
//  SolidDS
//
//  Created by NIKOLAI BORISOV on 24.03.2026.
//

import SwiftUI

/// Configuration for displaying a progress value in a UI.
///
/// `SolidProgressValueConfiguration` defines how a progress value is positioned, styled, colored, and optionally what font to use when rendering it.
public struct SolidProgressValueConfiguration {
    public let position: SolidProgressValuePosition
    public let style: SolidProgressValueStyle
    public let color: Color
    public let font: Font?
    
    public init(
        position: SolidProgressValuePosition = .trailing,
        style: SolidProgressValueStyle = .simple,
        color: Color = .primary,
        font: Font? = nil
    ) {
        self.position = position
        self.style = style
        self.color = color
        self.font = font
    }
}

// MARK: - 🧠 Code for Thought
/*
 SolidProgressValueConfiguration focuses solely on defining how a progress value is displayed.
 - Single Responsibility: stores only display-related settings
 - Separation of concerns: independent from progress calculation or formatting logic
 - Readability & maintainability: configuration grouped in one struct
 - Reusability: can be passed to any progress bar or view component
 Benefits:
 - Clear, predictable configuration
 - Easy to extend with new styles, positions, or fonts
 - Decoupled from layout and core data
 */
