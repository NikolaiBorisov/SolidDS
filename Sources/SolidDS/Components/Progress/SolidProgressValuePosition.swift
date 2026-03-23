//
//  SolidProgressValuePosition.swift
//  SolidDS
//
//  Created by NIKOLAI BORISOV on 17.03.2026.
//

import SwiftUI

/// Defines the position of the progress value relative to the progress view.
///
/// Supports both external (leading, trailing, top, bottom) and overlay (inside the progress container) placements.
public enum SolidProgressValuePosition {
    case leading
    case trailing
    case top
    case bottom
    case overlayLeading
    case overlayTrailing
    case overlayCenter
}
