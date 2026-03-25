//
//  SolidShadow.swift
//  SolidDS
//
//  Created by NIKOLAI BORISOV on 25.03.2026.
//

import SwiftUI

/// Simple wrapper for SwiftUI shadow settings
public struct SolidShadow {
    public var color: Color
    public var radius: CGFloat
    public var x: CGFloat
    public var y: CGFloat
    
    public init(
        color: Color = .black.opacity(0.25),
        radius: CGFloat = 4,
        x: CGFloat = 0,
        y: CGFloat = 2
    ) {
        self.color = color
        self.radius = radius
        self.x = x
        self.y = y
    }
}
