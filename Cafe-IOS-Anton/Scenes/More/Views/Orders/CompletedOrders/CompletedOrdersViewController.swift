//
//  CompletedOrdersViewController.swift
//  Cafe-iOS-Anton
//
//  Created by Антон Абалуев on 08.02.2026.
//

import UIKit

class CompletedOrdersViewController: TableView  {
    
    var presenter: CompletedOrdersPresenter?
    var router: CompletedOrdersRouter?
    private let stackContainer = UIStackView()
    private let contentView = UIView()
    private let scrollView = UIScrollView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        view.backgroundColor = UIColor(red: 231/255.0, green: 235/255.0, blue: 241/255.0, alpha: 1.0)
        scrollView.tap {
            view.addSubview($0)
            $0.snp.makeConstraints {
                $0.top.bottom.leading.trailing.equalToSuperview()
            }
        }
        contentView.tap {
            scrollView.addSubview($0)
            $0.snp.makeConstraints {
                $0.top.bottom.leading.trailing.equalToSuperview()
                $0.width.height.equalTo(view)
            }
        }
        stackContainer.tap {
            contentView.addSubview($0)
            $0.axis = .vertical
            $0.spacing = 24
            $0.distribution = .equalSpacing
            $0.snp.makeConstraints {
                $0.bottom.trailing.equalToSuperview().inset(18)
                $0.top.leading.equalToSuperview().offset(18)
            }
        }
        tableView = UITableView()
        tableView?.tap {
            stackContainer.addArrangedSubview($0)
            $0.delegate = self
            $0.dataSource = self
            $0.allowsSelection = true
            $0.layer.cornerRadius = 12
            $0.rowHeight = UITableView.automaticDimension
            $0.separatorStyle = .singleLine
            $0.separatorColor = .lightGray
        }
    }
}

extension CompletedOrdersViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter?.items.count ?? 0 // 10 исправить на 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let item = presenter?.tableCellItem(atIndex: indexPath.row) else { return UITableViewCell() }
        let cell = tableView.dequeueReusableCell(withIdentifier: item.model.identifier, for: indexPath)
        cell.selectionStyle = .default
        if let tableViewCell = cell as? TableViewCell {
            tableViewCell.fill(item.model)
            tableViewCell.model = item.model
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 69
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        presenter?.selectItem(atIndex: indexPath.row)
    }
}
