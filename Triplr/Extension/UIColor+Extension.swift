//
//  UIColor+Extension.swift
//  Triplr
//
//  Created by Marasy Phi on 30/1/21.
//

import SwiftUI

extension Color {
    
    static let primaryColor = Color.init(hex: 0x7365FF)
    static let primaryLight = Color.init(hex: 0xE6E6FB)
    static let primaryBackground = Color.white
    static let secondaryColor = Color.init(hex: 0xD8D8D8)
    static let primaryRed = Color.init(hex: 0xFC6B6B)
    static let lightText = Color.init(hex: 0x7A7A7A)
    static let lightGrey = Color.init(hex: 0xF5F5F5)
    static let darkText = Color.init(hex: 0x474747)
    static let primaryGreen = Color.init(hex: 0x4DC992)
    
    init(hex: UInt, alpha: Double = 1) {
        self.init(
            .sRGB,
            red: Double((hex >> 16) & 0xff) / 255,
            green: Double((hex >> 08) & 0xff) / 255,
            blue: Double((hex >> 00) & 0xff) / 255,
            opacity: alpha
        )
    }
    
}


