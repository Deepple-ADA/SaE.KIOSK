//
//  MenuVO.swift
//  hackerton
//
//  Created by Cho Chaewon on 2023/08/26.
//

import Foundation

struct MenuVO: Codable, Hashable {
    var productName: String
    var price: Int
    var amount: Int
    
    var dictionary: [String : Any] {
        ["productName": productName, "price": price, "amount": amount]
    }
    
}

extension MenuVO {
    var optionalImage: String? {
        let array: [any Menuable] = MenuModel.Snack.allCases + MenuModel.Beverage.allCases + MenuModel.Coffee.allCases
        return array.map { $0.description }
            .filter { $0.name == self.productName }.first?.image
    }
    
    var optionalPrice: Int? {
        let array: [any Menuable] = MenuModel.Snack.allCases + MenuModel.Beverage.allCases + MenuModel.Coffee.allCases
        return array.map { $0.description }
            .filter { $0.name == self.productName }.first?.price
    }
    
}
