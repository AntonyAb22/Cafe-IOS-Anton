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
    
    private let logoImageView = UIImageView()
    private let passwordRecoveryLabel = UILabel()
    private let loginLabel = UILabel()
    private let loginTF = UITextField()
    private let errorLabel = UILabel()
    private let passwordRecoveryButton = UIButton(type: .system)
    private let attentionMessageLabel2 = UILabel()
    private let attentionMessageLabel = UILabel()
    private let backButton = UIButton(type: .system)

    override func viewDidLoad() {
        super.viewDidLoad()
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
        view.backgroundColor = UIColor(red: 231/255.0, green: 235/255.0, blue: 241/255.0, alpha: 1.0)
        
        logoImageView.tap {
            view.addSubview($0)
            $0.image = Shark.I.logoImage
            $0.contentMode = .scaleAspectFit
            $0.snp.makeConstraints {
                $0.centerX.equalToSuperview()
                $0.centerY.equalToSuperview().offset(-200)
            }
        }
        
        passwordRecoveryLabel.tap {
            view.addSubview($0)
            $0.text = "Восстановление\nпароля"
            $0.font = UIFont.boldSystemFont(ofSize: 28)
            $0.numberOfLines = 2
            $0.snp.makeConstraints {
                $0.top.equalTo(logoImageView.snp.bottom).offset(60)
                $0.leading.equalToSuperview().offset(16)
            }
        }
        
        loginLabel.tap {
            view.addSubview($0)
            $0.text = "Логин"
            $0.textColor = UIColor(red: 144/255.0, green: 164/255.0, blue: 174/255.0, alpha: 1.0)
            $0.font = UIFont(name: "SF Pro Display", size: 15)
            $0.font = UIFont.preferredFont(forTextStyle: .subheadline)
            $0.snp.makeConstraints {
                $0.top.equalTo(passwordRecoveryLabel.snp.bottom).offset(30)
                $0.leading.equalToSuperview().offset(16)
            }
        }
        
        loginTF.tap {
            view.addSubview($0)
            $0.placeholder = "Введите логин"
            $0.font = UIFont(name: "SF Pro Display", size: 15)
            $0.backgroundColor = UIColor.clear
            $0.layer.cornerRadius = 10.0
            $0.layer.borderWidth = 1.0
            $0.layer.borderColor = UIColor(red: 207/255.0, green: 216/255.0, blue: 220/255.0, alpha: 1.0).cgColor
            let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: loginTF.frame.height))
            $0.leftView = paddingView
            $0.returnKeyType = .done
            $0.leftViewMode = .always
            $0.addTarget(self, action: #selector(loginTextFiledDidTapped(_:)), for: .editingChanged)
            $0.snp.makeConstraints {
                $0.left.right.equalToSuperview().inset(16)
                $0.top.equalTo(loginLabel.snp.bottom).offset(4)
                $0.height.equalTo(50)
            }
        }
        errorLabel.tap {
            view.addSubview($0)
            $0.text = "Пользователь не найден"
            $0.font = UIFont.systemFont(ofSize: 12)
            $0.textColor = .red
            $0.isHidden = true
            errorLabel.snp.makeConstraints {
                $0.left.right.equalToSuperview().inset(18)
                $0.top.equalTo(loginTF.snp.bottom).offset(4)
            }
        }
        passwordRecoveryButton.tap {
            view.addSubview($0)
            $0.setTitle("Восстановить пароль", for: .normal)
            $0.titleLabel?.font = UIFont(name: "SF Pro Display", size: 15)
            $0.backgroundColor = UIColor(red: 0/255, green: 122/255, blue: 255/255, alpha: 0.5)
            $0.isEnabled = false
            $0.layer.cornerRadius = 10.0
            $0.setTitleColor(.white, for: .normal)
            $0.addTarget(self, action: #selector(passwordRecoveryButtonTapped), for: .touchUpInside)
            $0.snp.makeConstraints {
                $0.left.right.equalToSuperview().inset(16)
                $0.top.equalTo(errorLabel.snp.bottom).offset(24)
                $0.height.equalTo(50)
            }
        }
        attentionMessageLabel2.tap {
            view.addSubview($0)
            $0.text = "Ссылка для сброса пароля \nотправлено на указанную почту"
            $0.textColor = UIColor(named: "#000000")
            $0.isHidden = true
            $0.numberOfLines = 2
            $0.font = UIFont.boldSystemFont(ofSize: 19)
            $0.snp.makeConstraints {
                $0.top.equalTo(errorLabel.snp.bottom).offset(20)
                $0.leading.equalToSuperview().offset(16)
                $0.trailing.equalToSuperview().inset(16)
            }
        }
        attentionMessageLabel.tap {
            view.addSubview($0)
            $0.text = "Мы пришлем на указанную вами почту ссылку на сброс пароля.\nПосле сброса, вы сможете указать новый пароль и авторизоваться"
            $0.textColor = UIColor(hex: "#546E7A")
            $0.numberOfLines = 2
            $0.font = UIFont(name: "SF Pro Display", size: 13)
            $0.snp.makeConstraints {
                $0.top.equalTo(passwordRecoveryButton.snp.bottom).offset(30)
                $0.leading.equalToSuperview().offset(16)
                $0.trailing.equalToSuperview().inset(16)
            }
        }
        backButton.tap {
            view.addSubview($0)
            $0.setTitle("Вернуться к авторизации", for: .normal)
            $0.tintColor = UIColor(hex: "#0065FF")
            $0.titleLabel?.font = UIFont(name: "SF Pro Display", size: 15)
            $0.setTitleColor(.systemBlue, for: .normal)
            $0.layer.cornerRadius = 10.0
            $0.backgroundColor = UIColor(red: 0/255, green: 122/255, blue: 255/255, alpha: 0.15)
            $0.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
            $0.snp.makeConstraints {
                $0.top.equalTo(attentionMessageLabel.snp.bottom).offset(28)
                $0.leading.equalToSuperview().offset(16)
                $0.trailing.equalToSuperview().inset(16)
                $0.height.equalTo(50)
            }
        }
    }
}

extension ForgotViewController {
    @objc func loginTextFiledDidTapped(_ textField: UITextField) {
        resetAuthorizationError()
        updatePasswordRecoveryButtonState()
    }
    
    func resetAuthorizationError() {
        loginTF.layer.borderColor = UIColor(red: 207/255.0, green: 216/255.0, blue: 220/255.0, alpha: 1.0).cgColor
        loginTF.layer.borderColor = UIColor(red: 207/255.0, green: 216/255.0, blue: 220/255.0, alpha: 1.0).cgColor
        errorLabel.isHidden = true
    }
    
    private func updatePasswordRecoveryButtonState() {
        let isEmpty = loginTF.text?.isEmpty ?? true
        passwordRecoveryButton.isEnabled = !isEmpty
        
        if isEmpty {
            passwordRecoveryButton.backgroundColor = UIColor(red: 0/255, green: 122/255, blue: 255/255, alpha: 0.5)
        } else {
            passwordRecoveryButton.backgroundColor = UIColor.systemBlue
        }
    }
    
    @objc func passwordRecoveryButtonTapped() {
        if let email = loginTF.text, !email.isEmpty {
            resetAuthorizationError()
            presenter?.resetPassword(email: email)
        } else {
            showAuthorizationError()
        }
    }
    
    func showAuthorizationError() {
        loginTF.layer.borderColor = UIColor.red.cgColor
        errorLabel.isHidden = false
    }
    
    func showSuccess() {
        attentionMessageLabel2.isHidden = false
        loginTF.isHidden = true
        loginLabel.isHidden = true
    }
    
    @objc func backButtonTapped() {
        delegate?.forgotViewControllerDidGoBack()
        dismiss(animated: true)
    }
}
