//
//  ColorExtension.swift
//  hackerton
//
//  Created by Greed on 2023/08/24.
//

import SwiftUI

extension Color {
    static let BackgroundPrimary = Color(hex: "ffffff")
    static let BackgroundSecondary = Color(hex: "EFF1F6")
    static let BackgroundTertiary = Color(hex: "E1E3E8")
    static let Textprimary = Color(hex: "000000")
    static let TextSecondary = Color(.black).opacity(0.6)
    static let TextTertiary = Color(.black).opacity(0.4)
    static let AccentPrimary = Color(hex: "FF5A26")
    static let AccentSecondary = Color(hex: "FF7A50")
    static let OnAccent = Color(hex: "FFFFFF")
    static let PointPrimary = Color(hex: "1D44D0")
    static let PointSecondary = Color(hex: "355FF3")
    static let OnPoint = Color(hex: "FFFFFF")
}

extension Color {
  init(hex: String) {
    let scanner = Scanner(string: hex)
    _ = scanner.scanString("#")
    
    var rgb: UInt64 = 0
    scanner.scanHexInt64(&rgb)
    
    let r = Double((rgb >> 16) & 0xFF) / 255.0
    let g = Double((rgb >>  8) & 0xFF) / 255.0
    let b = Double((rgb >>  0) & 0xFF) / 255.0
    self.init(red: r, green: g, blue: b)
  }
}
