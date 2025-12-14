//
//  CategoryViewController.swift
//  Cafe-iOS-Anton
//
//  Created by Антон Абалуев on 06.12.2025.
//

import UIKit

protocol CategoryViewControllerProtocol: AnyObject {

}

class CategoryViewController: UIViewController, CategoryViewControllerProtocol  {
    var interactor: CategoryInteractorProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
