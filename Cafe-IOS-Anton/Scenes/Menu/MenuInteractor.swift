//
//  MenuInteractor.swift
//  Cafe-iOS-Anton
//
//  Created by Антон Абалуев on 06.12.2025.
//

import Foundation
import UIKit

protocol MenuInteractorProtocol {
    
}

class MenuInteractor: MenuInteractorProtocol {
    var presenter: MenuPresenterProtocol
    var router: MenuRouterProtocol
    
    init(presenter: MenuPresenterProtocol, router: MenuRouterProtocol) {
        self.presenter = presenter
        self.router = router
    }
}
