//
//  SolidProgressValueConfiguration.swift
//  SolidDS
//
//  Created by NIKOLAI BORISOV on 24.03.2026.
//

import SwiftUI

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
