//
//  CustomTabBarController.swift
//  Cafe-iOS-Anton
//
//  Created by Антон Абалуев on 13.12.2025.
//

//import UIKit
//
//class CustomTabBarController: UITabBarController, UITabBarDelegate {
//    private let customButton = UIButton()
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        setupCustomButton()
//        self.delegate = self
//    }
//    
//    private func setupCustomButton() {
//        let activeImage = Shark.I.customImage.withRenderingMode(.alwaysOriginal)
//        let inactiveImage = Shark.I.inactiveCustomImage.withRenderingMode(.alwaysOriginal)
//
//        // Устанавливаем начальное состояние как неактивное
//        customButton.setImage(inactiveImage, for: .normal)
//        customButton.isSelected = false
//            
//        customButton.frame = CGRect(x: 0, y: 0, width: 70, height: 70)
//        customButton.layer.cornerRadius = 35
//        customButton.layer.masksToBounds = false
//        customButton.layer.shadowColor = UIColor.black.cgColor
//        customButton.layer.shadowOffset = CGSize(width: 0, height: 2)
//        customButton.layer.shadowOpacity = 0.3
//        customButton.layer.shadowRadius = 4
//        customButton.addTarget(self, action: #selector(customButtonTapped), for: .touchUpInside)
//        view.addSubview(customButton)
//    }
//    
//    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
//        if let inactiveImage = UIImage(named: "tasknetDesktop2")?.withRenderingMode(.alwaysOriginal) {
//            customButton.setImage(inactiveImage, for: .normal)
//            customButton.isSelected = false
//        }
//        
//    }
//}
//
