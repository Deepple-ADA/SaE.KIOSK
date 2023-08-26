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
                return Menu(name: rawValue, price: 2000, desc: "", image: "chocopi")
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
        
        var image: String {
            switch self {
            case .초콜릿:
                return "choco"
            case .소시지:
                return "Sosiji"
            case .초코파이:
                return "chochpi"
            case .스키틀즈:
                return "skittles"
            case .후레쉬베리:
                return "Freshberry"
            case .오트밀과자:
                return "oatmeal"
            case .왕뚜껑:
                return "kingcap"
            case .육개장:
                return "ukgaejang"
            case .진라면:
                return "jinramen"
            case .튀김우동:
                return "udong"
            case .약과:
                return "yakka"
            }
        }
    }
    enum Beverage: String, CaseIterable, Identifiable, Menuable {
        case 콜라
        case 핫식스
        case 오렌지주스 = "오렌지 주스"
        case 초코우유 = "초코 우유"
        case 사과주스 = "사과 주스"
        case 레몬주스 = "레몬 주스"
        case 딸기우유 = "딸기 우유"
        case 사이다 = "사이다"
        case 비타민
        case 갈아만든배 = "갈아만든 배"
        case 식혜
        case 게토레이
        

        var description: MenuModel.Menu {
            switch self {
            case .콜라:
                return Menu(name: rawValue, price: 1000, desc: "", image: "pepsi")
            case .핫식스:
                return Menu(name: rawValue, price: 1000, desc: "", image: "hotsix")
            case .오렌지주스:
                return Menu(name: rawValue, price: 1000, desc: "", image: "orangeade")
            case .초코우유:
                return Menu(name: rawValue, price: 1000, desc: "", image: "hersheys")
            case .사과주스:
                return Menu(name: rawValue, price: 1000, desc: "", image: "appleade")
            case .레몬주스:
                return Menu(name: rawValue, price: 1000, desc: "", image: "lemonJuice")
            case .딸기우유:
                return Menu(name: rawValue, price: 1000, desc: "", image: "BRstrawberry")
            case .사이다:
                return Menu(name: rawValue, price: 1000, desc: "", image: "cider")
            case .비타민:
                return Menu(name: rawValue, price: 1000, desc: "", image: "vitamindrink")
            case .갈아만든배:
                return Menu(name: rawValue, price: 1000, desc: "", image: "idh")
            case .식혜:
                return Menu(name: rawValue, price: 1000, desc: "", image: "sikhye")
            case .게토레이:
                return Menu(name: rawValue, price: 1000, desc: "", image: "gatorade")
            }
        }
        var id: String {
            rawValue
        }
    }
    enum Coffee: String, CaseIterable, Identifiable, Menuable {
        case 레쓰비
        case 아메리카노
        case 믹스커피 = "믹스 커피"
        
        var description: MenuModel.Menu {
            switch self {
            case .레쓰비:
                return Menu(name: rawValue, price: 1500, desc: "", image: "mocalatte")
            case .아메리카노:
                return Menu(name: rawValue, price: 2500, desc: "", image: "americano")
            case .믹스커피:
                return Menu(name: rawValue, price: 1000, desc: "", image: "maxim")
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

