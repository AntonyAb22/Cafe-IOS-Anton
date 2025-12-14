//
//  ChatsInteractor.swift
//  Cafe-iOS-Anton
//
//  Created by Антон Абалуев on 06.12.2025.
//

import Foundation
import UIKit

protocol ChatsInteractorProtocol {
    
}

class ChatsInteractor: ChatsInteractorProtocol {
    var presenter: ChatsPresenterProtocol
    var router: ChatsRouterProtocol
    
    init(presenter: ChatsPresenterProtocol, router: ChatsRouterProtocol) {
        self.presenter = presenter
        self.router = router
    }
}
