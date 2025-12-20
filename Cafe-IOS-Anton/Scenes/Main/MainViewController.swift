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
    var presenter: MainPresenterProtocol?
    var router: MainRouterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .yellow
    }
}
