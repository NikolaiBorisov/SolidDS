//
//  SolidProgressValueFormat.swift
//  SolidDS
//
//  Created by NIKOLAI BORISOV on 15.03.2026.
//

import SwiftUI

/// Defines how the progress value is formatted for display.
/// 
/// Supports built-in formats (integer, decimal, percent) or a fully custom formatter.
public enum SolidProgressValueFormat {
    
    // Hides the value
    case none
    
    // Displays an integer value. Parameter percent: Whether to show as percentage (0...100).
    case integer(percent: Bool)
    
    // places: Number of decimal places.
    // percent: Whether to show as percentage (0...100).
    // separator: Decimal separator style.
    case decimal(
        places: Int,
        percent: Bool,
        separator: SolidDecimalSeparator = .dot
    )
    
    // Uses a custom formatter closure
    case custom((Double) -> String)
}
