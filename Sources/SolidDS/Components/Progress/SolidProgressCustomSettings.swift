//
//  SolidProgressCustomSettings.swift
//  SolidDS
//
//  Created by NIKOLAI BORISOV on 25.03.2026.
//

import SwiftUI

/// Encapsulates optional customizations for layout and circular variants
public struct SolidProgressCustomSettings {
    public let contentSpacing: CGFloat?
    public let progressContainerHeight: CGFloat?
    public let circularScale: CGFloat?
    public let circularContainerSize: CGFloat?
    
    public init(
        contentSpacing: CGFloat? = nil,
        progressContainerHeight: CGFloat? = nil,
        circularScale: CGFloat? = 1,
        circularContainerSize: CGFloat? = nil
    ) {
        self.contentSpacing = contentSpacing
        self.progressContainerHeight = progressContainerHeight
        self.circularScale = circularScale
        self.circularContainerSize = circularContainerSize
    }
}
