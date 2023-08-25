//
//  OrderDetailVO.swift
//  hackerton
//
//  Created by Cho Chaewon on 2023/08/26.
//

import Foundation

struct OrderDetailVO: Codable {
    var orderListId: Int
    var orderId: Int
    var menu: String
    var price: Int
    var amount: Int
}
