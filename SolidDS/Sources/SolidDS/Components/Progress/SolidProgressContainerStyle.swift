//
//  SolidProgressContainerStyle.swift
//  SolidDS
//
//  Created by NIKOLAI BORISOV on 15.03.2026.
//

import SwiftUI

public struct SolidProgressContainerStyle {
    
    public var background: AnyShapeStyle
    public var cornerRadius: CGFloat
    public var borderColor: Color?
    public var borderWidth: CGFloat
    
    public init(
        background: AnyShapeStyle = AnyShapeStyle(.clear),
        cornerRadius: CGFloat = 0,
        borderColor: Color? = nil,
        borderWidth: CGFloat = 0
    ) {
        self.background = background
        self.cornerRadius = cornerRadius
        self.borderColor = borderColor
        self.borderWidth = borderWidth
    }
}
