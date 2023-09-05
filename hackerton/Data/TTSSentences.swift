//
//  TTSSentences.swift
//  hackerton
//
//  Created by sei on 2023/08/26.
//

import Foundation

enum TTSSentences {
    // menu view
    static var initialGuide: String {
        "원하는 상품을 말씀해주세요. 혹은 추천이 필요하시다면 “추천해주세요” 라고 말씀해주세요."
    }

    // STT에서 추가할 때마다 :)
    static func needMore(check orders:[MenuVO]) -> String {
        let menuString = orders.reduce("") { (partial, current) in
            partial + "\(current.productName) \(current.amount)개, "
        }
        return menuString + " 더 필요하신 것이 있다면 버튼을 눌러서 주문해주세요."
    }

    static func recommend(items: [MenuModel.Menu]) -> String {
        let menuString = items.reduce("") { (partial, current) in
            partial + "\(current.name), "
        }
        return menuString + "는 어떠세요?"
    }

//    // recommend 시작할 때
//    static var recommend: String {
//        "원하시는 제품에 대해 말해주세요."
//    }
}
