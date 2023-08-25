//
//  MenuModel.swift
//  hackerton
//
//  Created by Greed on 2023/08/24.
//

import Foundation
import SwiftUI

struct MenuModel {
    enum ProductType: String, CaseIterable, Identifiable {
        case snack = "Snack"
        case coffee = "Coffee"
        case beverage = "Beverage"
        
        var inKorean: String {
            switch self {
            case .snack:
                return "과자"
            case .coffee:
                return "커피"
            case .beverage:
                return "음료"
            }
        }
        
        var id: String {
            rawValue
        }
        var imageName: String {
            switch self {
            case .snack:
                return "snack"
            case .coffee:
                return "coffee"
            case .beverage:
                return "beverage"
            }
        }
    }
    enum Snack: String, CaseIterable, Menuable {
        case 새우깡
        case 초코파이
        case 참쌀설병
        case 멘토스
        case 마가렛드
        case 후레쉬베리
        
        var description: MenuModel.Menu {
            switch self {
            case .마가렛드:
                return Menu(name: self.rawValue, price: 4000, desc: "핳하ㅏ하", image: "히히")
            case .새우깡:
                return Menu(name: self.rawValue, price: 1000, desc: "asd", image: "asdf")
            case .초코파이:
                return Menu(name: self.rawValue, price: 2000, desc: "asdd", image: "asdf")
            case .참쌀설병:
                return Menu(name: self.rawValue, price: 3000, desc: "asdfd", image: "asdf")
            case .멘토스:
                return Menu(name: self.rawValue, price: 2000, desc: "qwerd", image: "asdf")
            case .후레쉬베리:
                return Menu(name: self.rawValue, price: 1000, desc: "werd", image: "asdf")
            }
        }
    }
    enum Beverage: String, CaseIterable, Menuable {
        case 콜라
        case 물
        case 핫식스
        case 제로콜라
        case 오렌지주스
        case 초코우유
        
        var description: MenuModel.Menu {
            switch self {
            case .콜라:
                return Menu(name: rawValue, price: 1500, desc: "coke", image: "dd")
            case .물:
                return Menu(name: rawValue, price: 500, desc: "water", image: "dd")
            case .핫식스:
                return Menu(name: rawValue, price: 1500, desc: "hot6", image: "dd")
            case .제로콜라:
                return Menu(name: rawValue, price: 1700, desc: "zero", image: "dd")
            case .오렌지주스:
                return Menu(name: rawValue, price: 8500, desc: "O", image: "dd")
            case .초코우유:
                return Menu(name: rawValue, price: 2000, desc: "choco", image: "dd")
            }
        }
    }
    enum Coffee: String, CaseIterable, Menuable {
        case 캔커피
        case 라떼
        case 아메리카노
        var description: MenuModel.Menu {
            switch self {
            case .캔커피:
                return Menu(name: rawValue, price: 2000, desc: "wer", image: "1sdg")
            case .라떼:
                return Menu(name: rawValue, price: 2500, desc: "라떼는 말이야..", image: "1sdg")
            case .아메리카노:
                return Menu(name: rawValue, price: 1800, desc: "American5", image: "1sdg")
            }
        }
    }
    
    struct Menu {
        var name : String
        var price : Int
        var desc : String
        var image : String
    }
    
}

