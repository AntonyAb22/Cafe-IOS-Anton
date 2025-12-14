//
//  ChatsPresenter.swift
//  Cafe-iOS-Anton
//
//  Created by Антон Абалуев on 06.12.2025.
//

import Foundation
import UIKit

protocol ChatsPresenterProtocol {
    
}

class ChatsPresenter: TablePresenter, ChatsPresenterProtocol {
    var viewController: ChatsViewControllerProtocol
    
    init(viewController: ChatsViewControllerProtocol) {
        self.viewController = viewController
    }
}
