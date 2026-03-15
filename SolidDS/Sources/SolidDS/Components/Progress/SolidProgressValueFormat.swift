//
//  SolidProgressValueFormat.swift
//  SolidDS
//
//  Created by NIKOLAI BORISOV on 15.03.2026.
//

import SwiftUI

public enum SolidProgressValueFormat {
    
    case none
    
    case integer(percent: Bool)
    
    case decimal(
        places: Int,
        percent: Bool,
        separator: SolidDecimalSeparator = .dot
    )
    
    case custom((Double) -> String)
}
