//
//  MoreViewController.swift
//  Cafe-iOS-Anton
//
//  Created by Антон Абалуев on 06.12.2025.
//

import UIKit

class MoreViewController: TableView  {
    var presenter: MorePresenter?
    
    private let titleSectionsLabel = UILabel()
    private let profileButton = UIButton()
    private let myOrdersButton = UIButton()
    private let supportButton = UIButton()
    private let privacyAndAgreementButton = UIButton()
    private let settingsButton = UIButton()
    private let logoutButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    private func setupUI() {
        view.backgroundColor = UIColor(red: 231/255.0, green: 235/255.0, blue: 241/255.0, alpha: 1.0)
        
        titleSectionsLabel.tap {
            view.addSubview($0)
            $0.text = "Разделы"
            $0.textColor = Shark.C.blueGreyLighten3
            $0.font = UIFont.systemFont(ofSize: 30)
            $0.snp.makeConstraints {
                $0.top.equalToSuperview().offset(65)
                $0.leading.equalToSuperview().offset(16)
                $0.height.equalTo(45)
            }
        }
        profileButton.tap {
            view.addSubview($0)
            $0.addTarget(self,action: #selector(profileButtonTapped), for: .touchUpInside)
            configureMenuButton(
                $0,
                title: "Профиль",
                systemImageName: "person.crop.circle"
            )
            $0.snp.makeConstraints {
                $0.top.equalTo(titleSectionsLabel.snp.bottom).offset(12)
                $0.leading.trailing.equalToSuperview().inset(16)
                $0.height.equalTo(52)
            }
        }
        myOrdersButton.tap {
            view.addSubview($0)
            $0.addTarget(self,action: #selector(myOrdersButtonTapped), for: .touchUpInside)
            configureMenuButton($0, title: "Мои заказы", systemImageName: "bag")
            $0.snp.makeConstraints {
                $0.top.equalTo(profileButton.snp.bottom).offset(6)
                $0.leading.trailing.equalToSuperview().inset(16)
                $0.height.equalTo(52)
            }
        }
        supportButton.tap {
            view.addSubview($0)
            $0.addTarget(self, action: #selector(supportButtonTapped), for: .touchUpInside)
            configureMenuButton($0, title: "Поддержка", systemImageName: "questionmark.circle")
            $0.snp.makeConstraints {
                $0.top.equalTo(myOrdersButton.snp.bottom).offset(6)
                $0.leading.trailing.equalToSuperview().inset(16)
                $0.height.equalTo(52)
            }
        }
        privacyAndAgreementButton.tap {
            view.addSubview($0)
            $0.addTarget(self, action: #selector(privacyAndAgreementButtonTapped), for: .touchUpInside)
            configureMenuButton($0, title: "Политика и соглашения", systemImageName: "doc.text")
            $0.snp.makeConstraints {
                $0.top.equalTo(supportButton.snp.bottom).offset(6)
                $0.leading.trailing.equalToSuperview().inset(16)
                $0.height.equalTo(52)
            }
        }
        settingsButton.tap {
            view.addSubview($0)
            $0.addTarget(self, action: #selector(settingsButtonTapped), for: .touchUpInside)
            configureMenuButton($0, title: "Настройки", systemImageName: "gearshape")
            $0.snp.makeConstraints {
                $0.top.equalTo(privacyAndAgreementButton.snp.bottom).offset(6)
                $0.leading.trailing.equalToSuperview().inset(16)
                $0.height.equalTo(52)
            }
        }

//        logoutButton.tap {
//            view.addSubview($0)
//            $0.addTarget(self, action: #selector(logoutButtonTapped), for: .touchUpInside)
//            $0.setImage(Shark.I.profile, for: .normal)
//            $0.snp.makeConstraints {
//                $0.top.equalTo(titleSectionsLabel.snp.bottom).offset(12)
//                $0.leading.equalToSuperview().offset(16)
//                
//            }
//        }
    }
}

extension MoreViewController {
    private func configureMenuButton(
        _ button: UIButton,
        title: String,
        systemImageName: String
    ) {
        var config = UIButton.Configuration.plain()
        
        config.title = title
        config.image = UIImage(systemName: systemImageName)
        config.imagePlacement = .leading
        config.imagePadding = 12
        
        config.baseForegroundColor = UIColor(hex: "#0057FF")
        config.titleTextAttributesTransformer =
             UIConfigurationTextAttributesTransformer { attributes in
                 var attrs = attributes
                 attrs.font = .systemFont(ofSize: 17, weight: .semibold)
                 return attrs
             }
        config.contentInsets = NSDirectionalEdgeInsets(
            top: 12,
            leading: 0,
            bottom: 12,
            trailing: 0
        )
        
        button.configuration = config
        button.contentHorizontalAlignment = .leading
    }
    @objc func profileButtonTapped() {
        
    }
    
    @objc func myOrdersButtonTapped() {
        
    }
    
    @objc func supportButtonTapped() {
        
    }
    
    @objc func privacyAndAgreementButtonTapped() {
        
    }
    
    @objc func settingsButtonTapped() {
        
    }
    
    @objc func logoutButtonTapped() {
        
    }
}
