//
//  MenuViewController.swift
//  Cafe-iOS-Anton
//
//  Created by Антон Абалуев on 06.12.2025.
//

import UIKit

protocol MenuViewControllerProtocol: AnyObject {

}

class MenuViewController: UIViewController, MenuViewControllerProtocol  {
    var interactor: MenuInteractorProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .purple
    }
}
