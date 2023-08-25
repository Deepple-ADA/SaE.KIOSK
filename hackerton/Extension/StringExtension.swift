//
//  StringExtension.swift
//  hackerton
//
//  Created by sei on 2023/08/26.
//

import Foundation

extension String{
    func checkMatch(regex: String) throws -> Bool {
        guard let regex = try? NSRegularExpression(pattern: regex) else {
            return false
        }
        let result = regex.matches(
            in: self,
            range: NSRange(self.startIndex..., in: self)
        )
        let matchedResult = result.map {
            String(self[Range($0.range, in: self)!])
        }

        return matchedResult.first == self
    }

    var firstDigitsOnly: Int? {
        guard let regex = try? NSRegularExpression(pattern: #"\d+"#),
              let result = regex.firstMatch(in: self, range: NSRange(self.startIndex..., in: self)),
              let range = Range(result.range, in: self),
              let result = Int(self[range]) else {
            return nil
        }
        return result
    }
}
