//
//  MenuModel.swift
//  hackerton
//
//  Created by Greed on 2023/08/24.
//

import Foundation
import SwiftUI

enum product {
    case 새우깡
    case 참쌀설병
//    case 멘토스
//    case 마가렛드
//    case 후레쉬베리
    
    struct Menu {
        var name: String
        var price: Int
        var desc: String
        var image: Image
    }
    
    
    var item: Menu {
        switch self {
        case .새우깡:
            return Menu(name: "새우깡", price: 1000, desc: "새우새우새우깡", image: Image("snack1"))
        case .참쌀설병:
            return Menu(name: "참쌀설병", price: 1500, desc: "인간사료 참쌀설병", image: Image("snack1"))
        }
    }
    
    
}

enum drink {
    case 콜라
    case 물
    case 핫식스
    case 제로콜라
    case 오렌지주스
    case 초코우유
}

enum coffee {
    case 캔커피
    case 라떼
    case 아이스아메리카노
}
