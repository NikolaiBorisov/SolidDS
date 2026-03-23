//
//  SolidDecimalSeparator.swift
//  SolidDS
//
//  Created by NIKOLAI BORISOV on 15.03.2026.
//

import SwiftUI

/// Defines the decimal separator used when formatting values.
///
/// Use `.locale` to follow the current system locale, or specify `.dot` / `.comma` for a fixed separator.
public enum SolidDecimalSeparator {
    case locale
    case dot
    case comma
}
