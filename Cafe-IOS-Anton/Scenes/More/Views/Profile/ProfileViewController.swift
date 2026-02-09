//
//  ProfileViewController.swift
//  Cafe-iOS-Anton
//
//  Created by Антон Абалуев on 06.12.2025.
//

import UIKit

class ProfileViewController: TableView  {
    var presenter: ProfilePresenter?
    var router: ProfileRouter?
    
    private var scrollView = UIScrollView()
    private var contentView = UIView()
    private var titleLabel = UILabel()
    private let profileView = UIView()
    private let stackContainer = UIStackView()
    private let changePasswordButton = UIButton()
    var avatarView = UIView()
    var profileFirstNameField = ValidatedTextField()
    var profileLastNameField = ValidatedTextField()
    var profileMailField = ValidatedTextField()
    var usernameField = ValidatedTextField()
    var phoneNumberField = ValidatedTextField()
    private let saveSettingsButton = UIButton()
    private let container = UIView()
    private let showPasswordButton = UIButton()
    private let fieldsContainer = UIView()
    private let deleteAccountButton = UIButton(type: .system)
    private let initials = UILabel()
    private let lastNameLabel = UILabel()
    private let firstNameLabel = UILabel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    private func setupUI() {
        view.backgroundColor = UIColor(red: 231/255.0, green: 235/255.0, blue: 241/255.0, alpha: 1.0)
        //navigationItem.hidesBackButton = true
        
        titleLabel.tap {
            view.addSubview($0)
            $0.text = "Профиль"
            $0.font = UIFont.boldSystemFont(ofSize: 30)
            $0.snp.makeConstraints {
                $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(10)
                $0.leading.equalToSuperview().offset(16)
                $0.height.equalTo(45)
            }
        }
        contentView.tap {
            view.addSubview($0)
            $0.snp.makeConstraints {
                $0.top.equalTo(titleLabel.snp.bottom).offset(10)
                $0.leading.equalToSuperview().offset(16)
                $0.trailing.equalToSuperview().inset(16)
                $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(16)
            }
        }
        scrollView.tap {
            contentView.addSubview($0)
            $0.snp.makeConstraints {
                $0.edges.equalToSuperview()
                $0.width.equalTo(view)
            }
        }
        profileView.tap {
            scrollView.addSubview($0)
            $0.layer.cornerRadius = 10
            $0.backgroundColor = .white
            $0.clipsToBounds = true
            $0.snp.makeConstraints {
                $0.top.equalToSuperview()
                $0.leading.equalToSuperview()
                $0.trailing.equalToSuperview()
                $0.width.equalTo(contentView)
                $0.bottom.equalToSuperview().inset(20)
            }
        }
        stackContainer.tap {
            profileView.addSubview($0)
            $0.axis = .vertical
            $0.spacing = 24
            $0.distribution = .equalSpacing
            $0.snp.makeConstraints {
                $0.trailing.equalToSuperview().inset(16)
                $0.top.leading.equalToSuperview().offset(20)
                $0.bottom.equalToSuperview().inset(20)
            }
        }
        container.tap {
            stackContainer.addArrangedSubview($0)
            $0.snp.makeConstraints {
                $0.height.equalTo(100)
            }
        }
        avatarView.tap {
            container.addSubview($0)
            $0.layer.cornerRadius = 50
            $0.layer.masksToBounds = true
            $0.layer.borderWidth = 2.0
            $0.layer.borderColor = UIColor.lightGray.cgColor

            // ✅ РАНДОМНЫЙ ФОН
            $0.backgroundColor = UIColor(
                red: .random(in: 0.4...0.9),
                green: .random(in: 0.4...0.9),
                blue: .random(in: 0.4...0.9),
                alpha: 1.0
            )

            $0.snp.makeConstraints {
                $0.leading.top.bottom.equalToSuperview()
                $0.width.height.equalTo(100)
            }
        }
        initials.tap {
            avatarView.addSubview($0)
            $0.text = "AA"                 // сюда подставишь инициалы
            $0.textColor = .black
            $0.font = .systemFont(ofSize: 36, weight: .semibold)
            $0.textAlignment = .center
            $0.numberOfLines = 1
            $0.snp.makeConstraints {
                $0.center.equalToSuperview()
                $0.width.height.lessThanOrEqualToSuperview().inset(12)
            }
        }
        changePasswordButton.tap {
            container.addSubview($0)
            $0.isUserInteractionEnabled = true
            $0.addTarget(self, action: #selector(changePasswordButtonTapped), for: .touchUpInside)
            $0.setImage(.changePasswordButton, for: .normal)
            $0.snp.makeConstraints {
                $0.trailing.equalToSuperview()
                $0.bottom.equalTo(avatarView.snp.bottom)
            }
        }
        profileFirstNameField.tap {
            stackContainer.addArrangedSubview($0)
            $0.title = "Имя"
            $0.text = "Имя"
        }
        profileLastNameField.tap {
            stackContainer.addArrangedSubview($0)
            $0.title = "Фамилия"
            $0.text = "Фамилия"
        }
        usernameField.tap {
            stackContainer.addArrangedSubview($0)
            $0.title = "Никнейм"
            $0.text = "Никнейм"
        }
        phoneNumberField.tap {
            stackContainer.addArrangedSubview($0)
            $0.title = "Телефон"
            $0.text = "Телефон"
        }
        saveSettingsButton.tap {
            stackContainer.addArrangedSubview($0)
            $0.addTarget(self, action: #selector(saveSettingsButtonTapped), for: .touchUpInside)
            $0.setTitle("Сохранить настройки", for: .normal)
            $0.backgroundColor = .systemBlue
            $0.layer.cornerRadius = 10.0
            $0.snp.makeConstraints {
                $0.height.equalTo(50)
            }
        }
        deleteAccountButton.tap {
            stackContainer.addArrangedSubview($0)
            $0.addTarget(self, action: #selector(deleteAccountButtonTapped), for: .touchUpInside)
            $0.setTitle("Удалить аккаунт", for: .normal)
            $0.setTitleColor(.red, for: .normal)
            $0.layer.borderWidth = 1
            $0.layer.borderColor = UIColor.red.cgColor
            $0.layer.cornerRadius = 10.0
            $0.snp.makeConstraints {
                $0.height.equalTo(50)
            }
        }
    }
}

extension ProfileViewController {
    @objc func changePasswordButtonTapped() {
        
    }
    @objc func saveSettingsButtonTapped() {
        
    }
    @objc func deleteAccountButtonTapped() {
        // добавление предупреждающего алерта(warning); по нажатию на кнопку ДА показать системное сообщение : "В ближайшее время ваш аккаунт будет удален службой поддержки"
    }
}
