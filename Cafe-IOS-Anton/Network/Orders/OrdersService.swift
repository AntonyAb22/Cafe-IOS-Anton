//
//  OrdersSevice.swift
//  Cafe-iOS-Anton
//
//  Created by Антон Абалуев on 15.02.2026.
//
import Foundation

class OrdersService: NetworkService<OrdersEndpoint> {
    
    func getOrder(completion: @escaping ([Order]?, Error?) -> Void) {
        _ = executeRequest(to: .getOrders) { (resultData: Data?, networkError) in
            if let networkError = networkError {
                completion(nil, networkError)
                return
            }
            do {
                let serializer = Serializer()
                let ordersResponse = try serializer.serialize(type: OrdersList.self, from: resultData)
                completion(ordersResponse?.list ?? [], nil)
            } catch {
                completion(nil, error)
            }
        }
    }

    func createNewOrder(order: Order, completion: @escaping (Error?) -> Void) {
        _ = self.executeRequest(to: OrdersEndpoint.createNewOrder(order: order), completion: { (resultData: Data?, error) in
            completion(error)
        })
    }
}
