//
//  CartViewController.swift
//  Cafe-iOS-Anton
//
//  Created by Антон Абалуев on 06.12.2025.
//

import UIKit

protocol CartViewControllerProtocol: AnyObject {

}

class CartViewController: UIViewController, CartViewControllerProtocol  {
    var interactor: CartInteractorProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
