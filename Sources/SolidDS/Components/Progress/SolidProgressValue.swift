//
//  SolidProgressValue.swift
//  SolidDS
//
//  Created by NIKOLAI BORISOV on 24.03.2026.
//

import Foundation
import SwiftUI

/// A model that represents the progress value and its display format.
///
/// `SolidProgressValue` encapsulates the raw numeric progress and how it should be
/// presented (e.g., as a percentage or decimal value).
///
/// The value is automatically clamped to the range `0...1`.
public struct SolidProgressValue {
    /// The raw progress value. Typically expected to be in the range `0...1`.
    public let value: Double
    /// Defines how the value should be formatted for display.
    public let format: SolidProgressValueFormat
    
    private static let formatter: NumberFormatter = {
        let f = NumberFormatter()
        f.numberStyle = .decimal
        return f
    }()
    
    public init(
        value: Double,
        format: SolidProgressValueFormat = .integer(percent: true)
    ) {
        // Clamp progress value to valid range 0...1
        self.value = min(max(value, 0), 1)
        self.format = format
    }
}

public extension SolidProgressValue {
    
    var formatted: String {
        
        switch format {
            
        case .none:
            return ""
            
        case .integer(let percent):
            
            let number = Int(value * 100)
            return percent ? "\(number)%" : "\(number)"
            
        case .decimal(let places, let percent, let separator):
            
            let formatter = Self.formatter
            formatter.minimumFractionDigits = places
            formatter.maximumFractionDigits = places
            
            switch separator {
                
            case .locale:
                break
                
            case .dot:
                formatter.locale = Locale(identifier: "en_US_POSIX")
                
            case .comma:
                formatter.locale = Locale(identifier: "fr_FR")
            }
            
            let number = value * 100
            let string = formatter
                .string(from: NSNumber(value: number)) ?? "\(number)"
            
            return percent ? "\(string)%" : string
            
        case .custom(let formatter):
            
            return formatter(value)
        }
    }
}

// MARK: - 🧠 Code for Thought
/*
 SolidProgressValue + formatted extension focuses solely on handling progress data and formatting logic.
 - Single Responsibility: struct stores raw progress; extension formats it
 - Separation of concerns: formatting logic decoupled from storage/initialization
 - Readability & maintainability: computed properties and formatting grouped in extension
 - Reusability: any view or component can use formatted without modifying the struct
 Benefits:
 - Predictable, easy-to-test formatting logic
 - Easy to extend with new formats
 - Keeps the data model clean and focused
 */
