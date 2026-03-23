//
//  SolidProgressDivider.swift
//  SolidDS
//
//  Created by NIKOLAI BORISOV on 15.03.2026.
//

import SwiftUI

/// Defines a divider used within `SolidProgress`.
///
/// Allows customization of color, thickness, and spacing.
public struct SolidProgressDivider {
    public var color: Color
    public var height: CGFloat
    public var padding: EdgeInsets
    
    public init(
        color: Color = Color(.separator),
        height: CGFloat = 1,
        padding: EdgeInsets = .init()
    ) {
        self.color = color
        self.height = height
        self.padding = padding
    }
}
