//
//  MenuModel.swift
//  hackerton
//
//  Created by Greed on 2023/08/24.
//

import Foundation

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
    enum Snack: String, CaseIterable, Identifiable, Menuable {
        case 새우깡
        case 초코파이
        case 참쌀설병
        case 멘토스
        case 마가렛드
        case 후레쉬베리 = "후레쉬 베리"
        case 오트밀과자 = "오트밀 과자"
        
        var description: MenuModel.Menu {
            switch self {
            case .마가렛드:
                return Menu(name: rawValue, price: 4000, desc: "핳하ㅏ하", image: "snack")
            case .새우깡:
                return Menu(name: rawValue, price: 1000, desc: "asd", image: "snack")
            case .초코파이:
                return Menu(name: rawValue, price: 2000, desc: "asdd", image: "snack")
            case .참쌀설병:
                return Menu(name: rawValue, price: 3000, desc: "asdfd", image: "snack")
            case .멘토스:
                return Menu(name: rawValue, price: 2000, desc: "qwerd", image: "snack")
            case .후레쉬베리:
                return Menu(name: rawValue, price: 1000, desc: "werd", image: "snack")
            case .오트밀과자:
                return Menu(name: rawValue, price: 1000, desc: "werd", image: "snack")
            }
        }
        var id: String {
            rawValue
        }
    }
    enum Beverage: String, CaseIterable, Identifiable, Menuable {
        case 콜라
        case 물
        case 핫식스
        case 제로콜라
        case 오렌지주스
        case 초코우유
        case 사과주스 = "사과 주스"
        
        var description: MenuModel.Menu {
            switch self {
            case .콜라:
                return Menu(name: rawValue, price: 1500, desc: "coke", image: "snack")
            case .물:
                return Menu(name: rawValue, price: 500, desc: "water", image: "snack")
            case .핫식스:
                return Menu(name: rawValue, price: 1500, desc: "hot6", image: "snack")
            case .제로콜라:
                return Menu(name: rawValue, price: 1700, desc: "zero", image: "snack")
            case .오렌지주스:
                return Menu(name: rawValue, price: 8500, desc: "O", image: "snack")
            case .초코우유:
                return Menu(name: rawValue, price: 2000, desc: "choco", image: "snack")
            case .사과주스:
                return Menu(name: rawValue, price: 1000, desc: "werd", image: "snack")
            }
        }
        var id: String {
            rawValue
        }
    }
    enum Coffee: String, CaseIterable, Identifiable, Menuable {
        case 캔커피
        case 라떼
        case 아메리카노
        var description: MenuModel.Menu {
            switch self {
            case .캔커피:
                return Menu(name: rawValue, price: 2000, desc: "wer", image: "snack")
            case .라떼:
                return Menu(name: rawValue, price: 2500, desc: "라떼는 말이야..", image: "snack")
            case .아메리카노:
                return Menu(name: rawValue, price: 1800, desc: "American5", image: "snack")
            }
        }
        var id: String {
            rawValue
        }
    }
    
    struct Menu {
        var name : String
        var price : Int
        var desc : String
        var image : String
    }
    
}

