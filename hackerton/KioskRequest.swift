//
//  KioskRequest.swift
//  hackerton
//
//  Created by Cho Chaewon on 2023/08/26.
//

import Foundation
import Alamofire

class APIUrls {
//    private static let BASE_URL = "https://soc06212.iptime.org:8812"
    private static let BASE_URL = "http://127.0.0.1:8812"
    static let fetchOrderList = "\(BASE_URL)/api/order"
    static func fetchOrderDetail(orderId: Int) -> String {
        return "\(BASE_URL)/api/order/\(orderId)"
    }
    static let placeOrder = "\(BASE_URL)/api/order"
    static func cancelOrder(orderId: Int) -> String {
        return "\(BASE_URL)/api/order/\(orderId)/cancel"
    }
}

fileprivate extension String {
    var url: URL {
        return URL(string: self)!
    }
}

class KioskRequest {
    static let shared = KioskRequest()
    
    private init() {}
    
    func fetchOrderList(before: (() -> Void)? = nil, success: @escaping ([OrderVO]) -> Void, error: ((Error) -> Void)? = nil) {
        if let before = before {
            before()
        }
        
        AF.request(APIUrls.fetchOrderList.url, method: .get, encoding: URLEncoding.default)
            .validate(statusCode: 200..<300)
            .responseDecodable { (response: DataResponse<Array<OrderVO>, AFError>) in
                switch (response.result) {
                case .success(let data):
                    success(data)
                    break
                    
                case .failure(let e):
                    print(#function, e.localizedDescription)
                    if let error = error {
                        error(e)
                    }
                    break
                }
            }
    }
    
    func fetchOrderDetail(_ orderId: Int, before: (() -> Void)? = nil, success: @escaping ([OrderDetailVO]) -> Void, error: ((Error) -> Void)? = nil) {
        if let before = before {
            before()
        }
        
        AF.request(APIUrls.fetchOrderDetail(orderId: orderId).url, method: .get, encoding: URLEncoding.default)
            .validate(statusCode: 200..<300)
            .responseDecodable { (response: DataResponse<Array<OrderDetailVO>, AFError>) in
                switch (response.result) {
                case .success(let data):
                    success(data)
                    break
                    
                case .failure(let e):
                    print(#function, e.localizedDescription)
                    if let error = error {
                        error(e)
                    }
                    break
                }
            }
    }
    
    func placeOrder(_ menu: [MenuVO], before: (() -> Void)? = nil, success: @escaping (Bool) -> Void, error: ((Error) -> Void)? = nil) {
        if let before = before {
            before()
        }
        
        guard let data = try? JSONEncoder().encode(menu) else {
            print("data not encodable")
            return
        }
        
        let parameters: Dictionary<String, Any> = ["order" : menu.map({ m in
            m.dictionary
        })]
        
        AF.request(APIUrls.placeOrder.url, method: .post, parameters: parameters, encoding: URLEncoding.default)
            .validate(statusCode: 200..<300)
            .responseDecodable { (response: DataResponse<Bool, AFError>) in
                switch (response.result) {
                case .success(let data):
                    success(data)
                    break
                    
                case .failure(let e):
                    print(#function, e.localizedDescription)
                    if let error = error {
                        error(e)
                    }
                    break
                }
            }
    }
    
    func cancelOrder(_ orderId: Int, before: (() -> Void)? = nil, success: @escaping (Bool) -> Void, error: ((Error) -> Void)? = nil) {
        if let before = before {
            before()
        }
        
        AF.request(APIUrls.cancelOrder(orderId: orderId).url, method: .post, encoding: URLEncoding.default)
            .validate(statusCode: 200..<300)
            .responseDecodable { (response: DataResponse<Bool, AFError>) in
                switch (response.result) {
                case .success(let data):
                    success(data)
                    break
                    
                case .failure(let e):
                    print(#function, e.localizedDescription)
                    if let error = error {
                        error(e)
                    }
                    break
                }
            }
    }
    
}
