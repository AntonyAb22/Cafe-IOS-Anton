//
//  MoreInteractor.swift
//  Cafe-iOS-Anton
//
//  Created by Антон Абалуев on 06.12.2025.
//

import Foundation
import UIKit

protocol MoreInteractorProtocol {
    
}

class MoreInteractor: MoreInteractorProtocol {
    var presenter: MorePresenterProtocol
    var router: MoreRouterProtocol
    
    init(presenter: MorePresenterProtocol, router: MoreRouterProtocol) {
        self.presenter = presenter
        self.router = router
    }
}
