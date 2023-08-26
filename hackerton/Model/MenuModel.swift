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
        case 초콜릿
        case 소시지
        case 초코파이
        case 스키틀즈
        case 후레쉬베리 = "후레쉬 베리"
        case 오트밀과자 = "오트밀 과자"
        case 왕뚜껑
        case 육개장
        case 진라면
        case 튀김우동
        case 약과
        
        var description: MenuModel.Menu {
            switch self {
            case .초콜릿:
                return Menu(name: rawValue, price: 500, desc: "", image: "choco")
            case .소시지:
                return Menu(name: rawValue, price: 1000, desc: "", image: "Sosiji")
            case .초코파이:
                return Menu(name: rawValue, price: 2000, desc: "", image: "chochpi")
            case .스키틀즈:
                return Menu(name: rawValue, price: 1500, desc: "", image: "skittles")
            case .후레쉬베리:
                return Menu(name: rawValue, price: 1200, desc: "", image: "Freshberry")
            case .오트밀과자:
                return Menu(name: rawValue, price: 700, desc: "", image: "oatmeal")
            case .왕뚜껑:
                return Menu(name: rawValue, price: 1700, desc: "", image: "kingcap")
            case .진라면:
                return Menu(name: rawValue, price: 1200, desc: "", image: "jinramen")
            case .진라면:
                return Menu(name: rawValue, price: 1300, desc: "", image: "snack")
            case .튀김우동:
                return Menu(name: rawValue, price: 1100, desc: "", image: "udong")
            case .약과:
                return Menu(name: rawValue, price: 900, desc: "", image: "yakka")
            case .육개장:
                return Menu(name: rawValue, price: 1250, desc: "", image: "ukgaejang")
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

