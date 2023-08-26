//
//  TTSSentences.swift
//  hackerton
//
//  Created by sei on 2023/08/26.
//

import Foundation

enum TTSSentences {
    static var initialGuide: String {
        "원하는 상품을 말씀해주세요. 혹은 추천이 필요하시다면 “추천해주세요” 라고 말씀해주세요."
    }

    static var needMore: String {
        "더 필요하신 것이 있나요?"
    }

    static func productList(of menuType: MenuModel.ProductType) -> String {
        " \(menuType.inKorean) 상품목록입니다."
    }

    typealias Order = (menu: MenuModel.Menu, count: Int)

    static func checkOrder(with orders: [Order]) -> String {
        let menuString = orders.reduce("") { (partial, current) in
            return partial + "\(current.menu.name) \(current.count)개,"
        }
        return menuString + "맞으신가요?"
    }

    static var bye: String {
        "이용해주셔서 감사합니다."
    }
}
