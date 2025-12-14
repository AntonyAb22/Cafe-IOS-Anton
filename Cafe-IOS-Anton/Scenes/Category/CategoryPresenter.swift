//
//  CategoryPresenter.swift
//  Cafe-iOS-Anton
//
//  Created by Антон Абалуев on 06.12.2025.
//

import Foundation
import UIKit

protocol CategoryPresenterProtocol {
    
}

class CategoryPresenter: TablePresenter, CategoryPresenterProtocol {
    var viewController: CategoryViewControllerProtocol
    
    init(viewController: CategoryViewControllerProtocol) {
        self.viewController = viewController
    }
}
