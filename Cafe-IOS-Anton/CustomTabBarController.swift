//
//  CustomTabBarController.swift
//  Cafe-iOS-Anton
//
//  Created by Антон Абалуев on 13.12.2025.
//

import UIKit

class CustomTabBarController: UITabBarController, UITabBarControllerDelegate {
    
    private let customButton = UIButton()
    private let inactiveImage = Shark.I.inactiveCustomImage
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCustomButton()
        self.delegate = self
    }
    
    private func setupCustomButton() {
        let activeImage = Shark.I.activeCustomImage.withRenderingMode(.alwaysOriginal)
        let inactiveImage = Shark.I.inactiveCustomImage.withRenderingMode(.alwaysOriginal)

        // Устанавливаем начальное состояние как неактивное
        customButton.setImage(activeImage, for: .normal)
        customButton.isSelected = true
            
        customButton.frame = CGRect(x: 0, y: 0, width: 70, height: 70)
        customButton.layer.cornerRadius = 35
        customButton.layer.masksToBounds = false
        customButton.layer.shadowColor = UIColor.black.cgColor
        customButton.layer.shadowOffset = CGSize(width: 0, height: 2)
        customButton.layer.shadowOpacity = 0.3
        customButton.layer.shadowRadius = 4
        customButton.addTarget(self, action: #selector(customButtonTapped), for: .touchUpInside)
        view.addSubview(customButton)
    }
    
    @objc func customButtonTapped() {
        selectedViewController = viewControllers?.first(where: { ($0 as? UINavigationController)?.viewControllers.first is MainViewController })
       
        let activeImage = Shark.I.activeCustomImage.withRenderingMode(.alwaysOriginal)
        let inactiveImage = Shark.I.inactiveCustomImage.withRenderingMode(.alwaysOriginal)

        customButton.isSelected.toggle()
        customButton.setImage(
            customButton.isSelected ? activeImage : inactiveImage,
            for: .normal
        )
    }
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        customButton.setImage(
            inactiveImage.withRenderingMode(.alwaysOriginal),
            for: .normal
        )
        customButton.isSelected = false
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        let height = tabBar.frame.size.height
        customButton.center = CGPoint(x: tabBar.center.x, y: view.bounds.height - height + 24)
    }
}

