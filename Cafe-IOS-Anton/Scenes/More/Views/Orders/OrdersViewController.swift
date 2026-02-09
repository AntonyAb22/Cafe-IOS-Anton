//
//  OrdersViewController.swift
//  Cafe-iOS-Anton
//
//  Created by Антон Абалуев on 08.02.2026.
//

import UIKit

class OrdersViewController: TableView  {
    
    private let ordersTitleLabel = UILabel()
    private let segmentControl = UISegmentedControl(items: ["Актуальные", "Завершенные"])
    private let countLabel = UILabel() // колво завершенных закзазов
    private var totalOrdersCount: OrdersList?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        view.backgroundColor = UIColor(red: 231/255.0, green: 235/255.0, blue: 241/255.0, alpha: 1.0)
        
        navigationController?.navigationBar.tintColor = .black
        
        ordersTitleLabel.tap {
            view.addSubview($0)
            $0.text = "Мои заказы"
            $0.font = UIFont.boldSystemFont(ofSize: 30)
            $0.snp.makeConstraints {
                $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(10)
                $0.leading.equalToSuperview().offset(16)
                $0.height.equalTo(45)
            }
        }
        segmentControl.tap {
            view.addSubview($0)
            $0.selectedSegmentIndex = 0
            $0.setTitleTextAttributes([NSAttributedString.Key.font: UIFont.systemFont(ofSize: 13)], for: .normal)
            $0.tintColor = UIColor.gray
            $0.addTarget(self, action: #selector(segmentedControlValueChanged(_:)), for: .valueChanged)
            $0.snp.makeConstraints {
                $0.top.equalTo(ordersTitleLabel.snp.bottom).offset(20)
                $0.leading.equalToSuperview().offset(16)
                $0.trailing.equalToSuperview().inset(16)
                $0.height.equalTo(30)
            }
        }
        countLabel.tap {
            segmentControl.addSubview($0)
//            $0.text = "\(totalOrdersCount?.total)"
            $0.text = "2"
            $0.font = .systemFont(ofSize: 12, weight: .semibold)
            $0.textAlignment = .center
            $0.textColor = .white
            $0.clipsToBounds = true
            $0.layer.cornerRadius = 10
            $0.layer.masksToBounds = true
            if let secondSegment = segmentControl.subviews.second {
                $0.snp.makeConstraints {
                    $0.trailing.equalTo(secondSegment.snp.leading).inset(10)
                    $0.height.equalTo(20)
                    $0.width.equalTo(34)
                }
            }
        }
    }
}

extension OrdersViewController {
    @objc func segmentedControlValueChanged(_ sender: UISegmentedControl) {
        let selectedSegmentIndex = sender.selectedSegmentIndex
        
    }
}
