//
//  ActualOrdersPresenter.swift
//  Cafe-iOS-Anton
//
//  Created by Антон Абалуев on 08.02.2026.
//

import Foundation
import UIKit

protocol ActualOrdersPresenterProtocol {
    
}

class ActualOrdersPresenter: TablePresenter, ActualOrdersPresenterProtocol {
    var input: ActualOrdersViewController
    private var interactor: ActualOrdersInteractorProtocol
    
    init(input: ActualOrdersViewController, interactor: ActualOrdersInteractorProtocol) {
        self.input = input
        self.interactor = interactor
        
        super.init()
        self.view = input
    }
    
    func selectItem(atIndex index: Int) {
        
    }
}
