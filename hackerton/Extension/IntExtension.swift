//
//  IntExtension.swift
//  hackerton
//
//  Created by Greed on 2023/08/25.
//

import Foundation
extension Int {
    public var decimal: String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = NumberFormatter.Style.decimal
        numberFormatter.locale = Locale(identifier: "ko_KR")
        return (numberFormatter.string(from: NSNumber(value: Double(self) ?? 0.0)) ?? "")
    }
}
