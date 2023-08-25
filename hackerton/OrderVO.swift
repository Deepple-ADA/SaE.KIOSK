//
//  OrderVO.swift
//  hackerton
//
//  Created by Cho Chaewon on 2023/08/26.
//

import Foundation

struct OrderVO: Codable {
    
    var orderId: Int
    @available(*, deprecated, renamed: "orderId", message: "서버가 초기화될 때 마다 1부터 다시 시작하므로, 주문번호를 표시해야 하는 경우 orderId를 대신 사용하십시오.")
    var orderNumber: Int
    var date: String
    var orderPlaced: Int
    var timestamp: String
    
    var wrappedOrderPlaced: Bool {
        orderPlaced > 0
    }
    
}
