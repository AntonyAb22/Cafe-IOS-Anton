//
//  MenuPresenter.swift
//  Cafe-iOS-Anton
//
//  Created by Антон Абалуев on 06.12.2025.
//

import Foundation
import UIKit

protocol MenuPresenterProtocol {
    
}

class MenuPresenter: TablePresenter, MenuPresenterProtocol {
    var viewController: MenuViewControllerProtocol
    
    init(viewController: MenuViewControllerProtocol) {
        self.viewController = viewController
    }
}
