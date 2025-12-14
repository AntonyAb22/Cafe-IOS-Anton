//
//  MainViewController.swift
//  Cafe-iOS-Anton
//
//  Created by Антон Абалуев on 06.12.2025.
//

import UIKit

protocol MainViewControllerProtocol: AnyObject {

}

class MainViewController: UIViewController, MainViewControllerProtocol  {
    var interactor: MainInteractorProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
