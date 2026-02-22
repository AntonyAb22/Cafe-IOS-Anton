//
//  CompletedOrdersTableViewCell.swift
//  Cafe-iOS-Anton
//
//  Created by Антон Абалуев on 15.02.2026.
//

import UIKit
import Foundation

class CompletedOrdersTableViewCell: TableViewCell {
    private let timeLabel = UILabel()
    private let priceLabel = UILabel()
    private let cakeNameLabel = UILabel()
    private let deliveryDateLabel = UILabel()
    private let addressLabel = UILabel()// адрес доставки
    private let idLabel = UILabel()// адрес доставки
    
    override func fill(_ tableViewModel: TableViewModel?) {
        guard let model = tableViewModel as? OrderViewModel else {
            print("Model not found")
            return
        }
        timeLabel.text = model.time
        priceLabel.text = String(model.price)
        cakeNameLabel.text = model.cakeName
        deliveryDateLabel.text = DateHelper.formatDateString(model.deliveryDate)
        addressLabel.text = model.address
        idLabel.text = model.id
    }
    
    override init(style: CompletedOrdersTableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        cakeNameLabel.tap {
            contentView.addSubview($0)
            $0.font = UIFont.boldSystemFont(ofSize: 16)
            $0.textColor = UIColor(hex: "#0D47A1")
            $0.text = "cake name"
            $0.snp.makeConstraints {
                $0.top.equalToSuperview().offset(6)
                $0.leading.equalToSuperview().offset(16)
            }
        }
    }
}


