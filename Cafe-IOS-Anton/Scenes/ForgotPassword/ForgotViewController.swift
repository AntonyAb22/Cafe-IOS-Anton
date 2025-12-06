//
//  ForgotViewController.swift
//  Cafe-iOS-Anton
//
//  Created by Антон Абалуев on 06.12.2025.
//

import UIKit

protocol ForgotViewControllerDelegate: AnyObject {
    func forgotViewControllerDidGoBack()
}

class ForgotViewController: UIViewController {
    weak var delegate: ForgotViewControllerDelegate?
    var presenter: ForgotPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
        setupPresenter()
        setupUI()
    }
}

extension ForgotViewController {
    func forgotViewControllerDidGoBack() {
        
    }
    
    private func setupPresenter() {
        let root = UINavigationController()
        let interactor = ForgotInteractor()
        let router = ForgotRouter(rootViewController: root)
        self.presenter = ForgotPresenter(view: self, interactor: interactor, router: router)
    }
    
    private func setupUI() {
        
    }
}
