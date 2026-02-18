//
//  OrdersSevice.swift
//  Cafe-iOS-Anton
//
//  Created by Антон Абалуев on 15.02.2026.
//
import Foundation

class OrdersService: NetworkService<OrdersEndpoint> {
    
    func getOrder(completion: @escaping ([Order]?, Error?) -> Void) {
        _ = self.executeRequest(to: OrdersEndpoint.getOrders, completion: { (resultData: Data?, error) in
            let serializer = Serializer()
            do {
                let ordersResponse = try serializer.serialize(type: OrdersList.self, from: resultData)
                completion(ordersResponse?.list, error)
            } catch {
                completion(nil, error)
            }
        })
    }
    
    func createNewOrder(order: Order, completion: @escaping (Error?) -> Void) {
        _ = self.executeRequest(to: OrdersEndpoint.createNewOrder(order: order), completion: { (resultData: Data?, error) in
            completion(error)
        })
    }
}
