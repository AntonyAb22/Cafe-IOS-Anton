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
}

extension ForgotViewController {
    func forgotViewControllerDidGoBack() {
        
    }
}
