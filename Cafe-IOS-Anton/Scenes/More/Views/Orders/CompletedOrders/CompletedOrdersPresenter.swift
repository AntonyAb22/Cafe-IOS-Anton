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
    private var orders = [Order]()
    
    init(input: CompletedOrdersViewController, interactor: CompletedOrdersInteractorProtocol) {
        self.input = input
        self.interactor = interactor
        
        super.init()
        self.view = input
    }
    
    func loadCompletedOrders() {
        
    }
    
    func fillCompletedOrdersItem() {
        DispatchQueue.main.async {
            var completedOrdersViewModels = []
            
        }
    }

    func selectItem(atIndex index: Int) {
        
    }
}
