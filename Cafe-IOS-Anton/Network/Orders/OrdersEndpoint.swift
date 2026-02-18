//
//  OrdersEndpoint.swift
//  Cafe-iOS-Anton
//
//  Created by Антон Абалуев on 15.02.2026.
//

enum OrdersEndpoint {
    case getOrders
    case createNewOrder(order: Order)
}



extension OrdersEndpoint: Endpoint {
    
    var requestEndpoint: String {
        switch self {
        case .getOrders:      return "/orders"
        case .createNewOrder: return "/orders"
        }
    }
    
    var httpMethod: HTTPMethod {
        switch self {
        case .getOrders:      return .get
        case .createNewOrder: return .post
        }
    }
    
    public var body: EndpointBody? {
        switch self {
        case .getOrders: return nil
        case .createNewOrder(let order): let requestBody: [String: Any] = [
            "address": order.address,
            "cakeName": order.cakeName,
            "count": order.count,
            "deliveryDate": order.deliveryDate,
            "id":order.id ,
            "payment": order.payment,
            "time": order.time,
            "totalPrice": order.totalPrice
        ]
            return EndpointBody(requestBody: requestBody)
        }
    }
}
