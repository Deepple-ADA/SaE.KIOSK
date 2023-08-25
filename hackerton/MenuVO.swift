//
//  MenuVO.swift
//  hackerton
//
//  Created by Cho Chaewon on 2023/08/26.
//

import Foundation

struct MenuVO: Codable {
    var menu: String
    var price: Int
    var amount: Int
    
    var dictionary: [String : Any] {
        ["menu": menu, "price": price, "amount": amount]
    }
}
