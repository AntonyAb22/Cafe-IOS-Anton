//
//  CompletedOrdersPresenter.swift
//  Cafe-iOS-Anton
//
//  Created by Антон Абалуев on 08.02.2026.
//

import Foundation
import UIKit

protocol CompletedOrdersPresenterProtocol {
    
}

class CompletedOrdersPresenter: TablePresenter, CompletedOrdersPresenterProtocol {
    var input: CompletedOrdersViewController
    private var interactor: CompletedOrdersInteractorProtocol
    
    init(input: CompletedOrdersViewController, interactor: CompletedOrdersInteractorProtocol) {
        self.input = input
        self.interactor = interactor
        
        super.init()
        self.view = input
    }
}
