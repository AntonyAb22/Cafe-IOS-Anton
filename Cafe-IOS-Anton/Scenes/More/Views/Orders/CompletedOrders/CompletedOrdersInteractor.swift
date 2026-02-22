//
//  CompletedOrdersInteractor.swift
//  Cafe-iOS-Anton
//
//  Created by Антон Абалуев on 08.02.2026.
//


import Foundation
import UIKit

protocol CompletedOrdersInteractorProtocol {
    func loadCompletedOrders(completion: @escaping ([Order]?, Error?) -> Void)
}

class CompletedOrdersInteractor: CompletedOrdersInteractorProtocol {
    
    let service: OrdersService
    
    init(service: OrdersService) {
        self.service = service
    }
    
    func loadCompletedOrders(completion: @escaping ([Order]?, Error?) -> Void) {
        service.getOrder { orders, error in
            completion(orders, error)
        }
    }
}
