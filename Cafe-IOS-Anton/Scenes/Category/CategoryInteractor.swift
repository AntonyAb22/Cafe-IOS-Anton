//
//  CategoryInteractor.swift
//  Cafe-iOS-Anton
//
//  Created by Антон Абалуев on 06.12.2025.
//

import Foundation
import UIKit

protocol CategoryInteractorProtocol {
    
}

class CategoryInteractor: CategoryInteractorProtocol {
    var presenter: CategoryPresenterProtocol
    var router: CategoryRouterProtocol
    
    init(presenter: CategoryPresenterProtocol, router: CategoryRouterProtocol) {
        self.presenter = presenter
        self.router = router
    }
}
