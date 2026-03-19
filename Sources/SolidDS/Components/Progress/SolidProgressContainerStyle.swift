//
//  SolidProgressContainerStyle.swift
//  SolidDS
//
//  Created by NIKOLAI BORISOV on 15.03.2026.
//

import SwiftUI

public struct SolidProgressContainerStyle {
    
    public var background: AnyShapeStyle
    public var backgroundImage: Image?
    public var cornerRadius: CGFloat
    public var borderColor: Color?
    public var borderWidth: CGFloat
    public var glassStyle: SolidProgressGlassStyle
    public var glassColors: [Color]?
    
    public init(
        background: AnyShapeStyle = AnyShapeStyle(.clear),
        backgroundImage: Image? = nil,
        cornerRadius: CGFloat = 0,
        borderColor: Color? = nil,
        borderWidth: CGFloat = 0,
        glassStyle: SolidProgressGlassStyle = .none,
        glassColors: [Color]? = nil
    ) {
        self.background = background
        self.backgroundImage = backgroundImage
        self.cornerRadius = cornerRadius
        self.borderColor = borderColor
        self.borderWidth = borderWidth
        self.glassStyle = glassStyle
        self.glassColors = glassColors
    }
}
