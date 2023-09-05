//
//  StringExtension.swift
//  hackerton
//
//  Created by sei on 2023/08/26.
//

import Foundation

extension String{
    var firstDigitsOnly: Int? {
        guard let regex = try? NSRegularExpression(pattern: #"\d+"#),
              let result = regex.firstMatch(in: self, range: NSRange(self.startIndex..., in: self)),
              let range = Range(result.range, in: self),
              let result = Int(self[range]) else {
            return nil
        }
        return result
    }

    var asMenu: MenuModel.Menu? {
        let array: [any Menuable] = MenuModel.Snack.allCases + MenuModel.Beverage.allCases + MenuModel.Coffee.allCases
        return array.map { $0.description }
            .filter { $0.name == self }
            .first
    }
}
