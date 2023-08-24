//
//  MenuModel.swift
//  hackerton
//
//  Created by Greed on 2023/08/24.
//

import Foundation

struct MenuModel {
    enum product {
        enum type : String {
            case Snack = "스낵"
            case Drink = "음료"
            case Coffee = "커피"
        }
        enum snack {
            case 새우깡
            case 초코파이
            case 참쌀설병
            case 멘토스
            case 마가렛드
            case 후레쉬베리
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
    }
    let menuType : product.type
    let menuName : product
    let menuPrice : Int
    let menuInfo : String
    
    }

