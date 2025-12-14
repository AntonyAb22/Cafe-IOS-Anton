//
//  CartInteractor.swift
//  Cafe-iOS-Anton
//
//  Created by Антон Абалуев on 06.12.2025.
//

import Foundation
import UIKit

protocol CartInteractorProtocol {
    
}

class CartInteractor: CartInteractorProtocol {
    var presenter: CartPresenterProtocol
    var router: CartRouterProtocol
    
    init(presenter: CartPresenterProtocol, router: CartRouterProtocol) {
        self.presenter = presenter
        self.router = router
    }
}
