//
//  CompletedOrdersInteractor.swift
//  Cafe-iOS-Anton
//
//  Created by Антон Абалуев on 08.02.2026.
//


import Foundation
import UIKit

protocol CompletedOrdersInteractorProtocol {
    
}

class CompletedOrdersInteractor: CompletedOrdersInteractorProtocol {
    
    let service = 
    
    func loadCompletedOrders() {
        
    }
    
    func currentLoad(completion: @escaping ([Order]?, Error?) -> Void) {
        
        service.getCurrentLoad { workLoads, error in
            completion(workLoads, error)
        }
    }
}
