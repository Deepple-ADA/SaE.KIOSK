//
//  MenuVO.swift
//  hackerton
//
//  Created by Cho Chaewon on 2023/08/26.
//

import Foundation

struct MenuVO: Codable, Hashable{
    var productName: String
    var price: Int
    var amount: Int
    
    var dictionary: [String : Any] {
        ["productName": productName, "price": price, "amount": amount]
    }
}
