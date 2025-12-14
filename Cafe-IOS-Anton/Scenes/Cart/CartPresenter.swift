//
//  CartPresenter.swift
//  Cafe-iOS-Anton
//
//  Created by Антон Абалуев on 06.12.2025.
//

import Foundation
import UIKit

protocol CartPresenterProtocol {
    
}

class CartPresenter: TablePresenter, CartPresenterProtocol {
    var viewController: CartViewControllerProtocol
    
    init(viewController: CartViewControllerProtocol) {
        self.viewController = viewController
    }
}
