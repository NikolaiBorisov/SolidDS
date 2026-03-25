//
//  SolidBorder.swift
//  SolidDS
//
//  Created by NIKOLAI BORISOV on 20.03.2026.
//

import SwiftUI

/// Simple wrapper for SwiftUI border settings
public struct SolidBorder {
    public var color: AnyShapeStyle
    public var width: CGFloat
    
    public init(
        color: AnyShapeStyle = AnyShapeStyle(Color.accentColor.opacity(0.3)),
        width: CGFloat = 1
    ) {
        self.color = color
        self.width = width
    }
}
