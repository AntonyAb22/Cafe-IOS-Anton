//
//  OrdersViewController.swift
//  Cafe-iOS-Anton
//
//  Created by Антон Абалуев on 08.02.2026.
//

import UIKit

class OrdersViewController: TableView  {
    
    private let ordersTitleLabel = UILabel()
    private let segmentControl = UISegmentedControl(items: ["Завершенные", "Актуальные"])
    private let countLabel = UILabel() // колво завершенных закзазов
    private var totalOrdersCount: OrdersList?
    
    var presenter: OrdersPresenter?
    
    
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
                $0.trailing.equalToSuperview().offset(-16)
                $0.height.equalTo(30)
            }
        }
        countLabel.tap {
            segmentControl.addSubview($0)
            //            $0.text = "\(totalOrdersCount?.total)"
            $0.text = "0"
            $0.font = .systemFont(ofSize: 12, weight: .semibold)
            $0.textAlignment = .center
            $0.textColor = .white
            $0.clipsToBounds = true
            $0.layer.cornerRadius = 10
            $0.layer.masksToBounds = true
            if let firstSegment = segmentControl.subviews.first {
                $0.snp.makeConstraints {
                    $0.trailing.equalTo(firstSegment.snp.leading).offset(-10)
                    $0.height.equalTo(20)
                    $0.width.equalTo(34)
                    $0.centerY.equalToSuperview()
                }
            }
        }
        segmentedControlValueChanged(segmentControl)
    }
}

extension OrdersViewController {
    @objc func segmentedControlValueChanged(_ sender: UISegmentedControl) {
        let selectedSegmentIndex = sender.selectedSegmentIndex
        countLabel.backgroundColor = (selectedSegmentIndex == 0) ? Shark.C.lightBlueDarken4 : UIColor(hex: "#78909C")
        
        let defaultTextAtributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
        let selectedTextAtributes = [NSAttributedString.Key.foregroundColor: UIColor.systemBlue]
        sender.setTitleTextAttributes(defaultTextAtributes, for: .normal)
        sender.setTitleTextAttributes(selectedTextAtributes, for: .selected)
        
        switch selectedSegmentIndex {
        case 0: presenter?.showСompletedOrders()
        case 1: presenter?.showActualOrders()
        default: break
        }
    }
}
