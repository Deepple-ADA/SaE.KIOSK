//
//  MenuCorrector.swift
//  hackerton
//
//  Created by sei on 2023/08/26.
//

import Foundation
import WordCorrector

struct MenuCreator {
    static let countNumberDictionary = [
        1: ["하나", "일", "한"],
        2: ["둘", "이", "두"],
        3: ["셋", "삼", "세"],
        4: ["넷", "사", "네"],
        5: ["다섯", "오"],
        6: ["여섯", "육"],
        7: ["일곱", "칠"],
        8: ["여덟", "팔"],
        9: ["아홉", "구"],
        10: ["열", "십"],
        20: ["스물", "이십"],
        30: ["서른", "삼십"]
    ].sorted { $0.key > $1.key }

    var corrector: WordCorrector

    typealias Order = (menu: MenuModel.Menu, count: Int)

    func convert(predictions: [[String]]) -> [Order] {
        predictions.compactMap { convert(prediction: $0) }
    }

    func convert(prediction: [String]) -> Order? {
        guard prediction.count == 2,
            let menuString = corrector.correct(word: prediction[0]),
              let menu = menuString.asMenu else {
            return nil
        }

        if let count = prediction[1].firstDigitsOnly {
            return (menu, count)
        }

        return (menu, extractDigits(from: prediction[1]))
    }

    private func extractDigits(from countString: String) -> Int {
        // 스물 세 잔 -> 23
        // 스물세개 -> 23
        var countString = countString
        var numberBucket = [Int]()
        for (num, words) in Self.countNumberDictionary where numberBucket.count < 3 {
            for word in words {
                if false == countString.contains(word) { continue }
                // replace
                countString = countString.replacingOccurrences(of: word, with: "")
                // array 추가를 해야됨
                numberBucket.append(num)
                break
            }
        }
        return numberBucket.reduce(0, +)
    }
}
