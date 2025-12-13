//
//  RegistrationViewController.swift
//  Cafe-ios
//
//  Created by Антон Абалуев on 29.11.2025.
//

import UIKit
import SnapKit

protocol RegistrationViewControllerDelegate: AnyObject {
    func registrationViewControllerDidGoBack()
}

class RegistrationViewController: UIViewController, UITextFieldDelegate {
    
    weak var delegate: RegistrationViewControllerDelegate?
    
    private let newAccountRegistrationLabel = UILabel()
    private let emailLabel = UILabel()
    private let emailTF = UITextField()
    private let loginLabel = UILabel()
    private let loginTF = UITextField()
    private let firstNameLabel = UILabel()
    private let firstNameTF = UITextField()
    private let lastNameLabel = UILabel()
    private let lastNameTF = UITextField()
    private let passwordLabel = UILabel()
    private let passwordTF = UITextField()
    private let errorLabel = UILabel()
    private let signInButton = UIButton(type: .system)
    private let attentionMessageLabel = UILabel()
    private let backButton = UIButton(type: .system)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
}


private extension RegistrationViewController {
    
    private func setupUI() {
        view.backgroundColor = UIColor(red: 231/255.0, green: 235/255.0, blue: 241/255.0, alpha: 1.0)
        
        newAccountRegistrationLabel.tap {
            view.addSubview($0)
            $0.text = "Регистрация нового\nаккаунта"
            $0.font = UIFont.boldSystemFont(ofSize: 28)
            $0.numberOfLines = 2
            $0.snp.makeConstraints {
                $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(10)
                $0.leading.equalToSuperview().offset(16)
            }
        }
        
        emailLabel.tap {
            view.addSubview($0)
            $0.text = "Email"
            $0.textColor = UIColor(red: 144/255.0, green: 164/255.0, blue: 174/255.0, alpha: 1.0)
            $0.font = UIFont(name: "SF Pro Display", size: 15)
            $0.font = UIFont.preferredFont(forTextStyle: .subheadline)
            $0.snp.makeConstraints {
                $0.top.equalTo(newAccountRegistrationLabel.snp.bottom).offset(30)
                $0.leading.equalToSuperview().offset(16)
            }
        }
        
        emailTF.tap {
            view.addSubview($0)
            $0.placeholder = "Введите почту"
            $0.font = UIFont(name: "SF Pro Display", size: 15)
            $0.backgroundColor = UIColor.clear
            $0.layer.cornerRadius = 10.0
            $0.layer.borderWidth = 1.0
            $0.layer.borderColor = UIColor(red: 207/255.0, green: 216/255.0, blue: 220/255.0, alpha: 1.0).cgColor
            let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: emailTF.frame.height))
            $0.leftView = paddingView
            $0.returnKeyType = .done
            $0.leftViewMode = .always
            $0.addTarget(self, action: #selector(loginTextFiledDidTapped(_:)), for: .editingChanged)
            $0.snp.makeConstraints {
                $0.left.right.equalToSuperview().inset(16)
                $0.top.equalTo(emailLabel.snp.bottom).offset(4)
                $0.height.equalTo(50)
            }
        }
        
        errorLabel.tap {
            view.addSubview($0)
            $0.text = "Почта не найдена"
            $0.font = UIFont.systemFont(ofSize: 12)
            $0.textColor = .red
            $0.isHidden = true
            $0.snp.makeConstraints {
                $0.leading.equalToSuperview().offset(18)
                $0.top.equalTo(emailTF.snp.bottom).offset(4)
            }
        }
        
        loginLabel.tap {
            view.addSubview($0)
            $0.text = "Логин"
            $0.textColor = UIColor(red: 144/255.0, green: 164/255.0, blue: 174/255.0, alpha: 1.0)
            $0.font = UIFont(name: "SF Pro Display", size: 15)
            $0.font = UIFont.preferredFont(forTextStyle: .subheadline)
            $0.snp.makeConstraints {
                $0.top.equalTo(errorLabel.snp.bottom).offset(16)
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
        
        firstNameLabel.tap {
            view.addSubview($0)
            $0.text = "Имя"
            $0.textColor = UIColor(red: 144/255.0, green: 164/255.0, blue: 174/255.0, alpha: 1.0)
            $0.font = UIFont(name: "SF Pro Display", size: 15)
            $0.font = UIFont.preferredFont(forTextStyle: .subheadline)
            $0.snp.makeConstraints {
                $0.top.equalTo(loginTF.snp.bottom).offset(16)
                $0.leading.equalToSuperview().offset(16)
            }
        }
        
        firstNameTF.tap {
            view.addSubview($0)
            $0.placeholder = "Введите имя"
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
                $0.top.equalTo(firstNameLabel.snp.bottom).offset(4)
                $0.height.equalTo(50)
            }
        }
        
        lastNameLabel.tap {
            view.addSubview($0)
            $0.text = "Фамилия"
            $0.textColor = UIColor(red: 144/255.0, green: 164/255.0, blue: 174/255.0, alpha: 1.0)
            $0.font = UIFont(name: "SF Pro Display", size: 15)
            $0.font = UIFont.preferredFont(forTextStyle: .subheadline)
            $0.snp.makeConstraints {
                $0.top.equalTo(firstNameTF.snp.bottom).offset(16)
                $0.leading.equalToSuperview().offset(16)
            }
        }
        
        lastNameTF.tap {
            view.addSubview($0)
            $0.placeholder = "Введите фамилию"
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
                $0.top.equalTo(lastNameLabel.snp.bottom).offset(4)
                $0.height.equalTo(50)
            }
        }
        
        passwordLabel.tap {
            view.addSubview($0)
            $0.text = "Пароль"
            $0.textColor = UIColor(red: 144/255.0, green: 164/255.0, blue: 174/255.0, alpha: 1.0)
            $0.font = UIFont(name: "SF Pro Display", size: 15)
            $0.font = UIFont.preferredFont(forTextStyle: .subheadline)
            $0.snp.makeConstraints {
                $0.top.equalTo(lastNameTF.snp.bottom).offset(16)
                $0.leading.equalToSuperview().offset(16)
            }
        }
        
        passwordTF.tap {
            view.addSubview($0)
            $0.placeholder = "Введите пароль"
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
                $0.top.equalTo(passwordLabel.snp.bottom).offset(4)
                $0.height.equalTo(50)
            }
        }
        
        signInButton.tap {
            view.addSubview($0)
            $0.setTitle("Войти в систему", for: .normal)
            $0.titleLabel?.font = UIFont(name: "SF Pro Display", size: 15)
            $0.backgroundColor = UIColor(red: 0/255, green: 122/255, blue: 255/255, alpha: 0.5)
            $0.isEnabled = false
            $0.layer.cornerRadius = 10.0
            $0.setTitleColor(.white, for: .normal)
            $0.addTarget(self, action: #selector(signInButtonTapped), for: .touchUpInside)
            $0.snp.makeConstraints {
                $0.left.right.equalToSuperview().inset(16)
                $0.top.equalTo(passwordTF.snp.bottom).offset(24)
                $0.height.equalTo(50)
            }
        }
        
        attentionMessageLabel.tap {
            view.addSubview($0)
            $0.text = "Уже есть аккаунт в системе?"
            $0.textColor = UIColor(hex: "#546E7A")
            $0.numberOfLines = 2
            $0.font = UIFont(name: "SF Pro Display", size: 13)
            $0.snp.makeConstraints {
                $0.top.equalTo(signInButton.snp.bottom).offset(20)
                $0.centerX.equalToSuperview()
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

private extension RegistrationViewController {
    
    @objc private func loginTextFiledDidTapped(_ textField: UITextField){
        updateSignInButton()
        resetAuthorizationError()
    }
    
    private func updateSignInButton() {
        let isEmpty = emailTF.text?.isEmpty ?? true
        signInButton.isEnabled = !isEmpty
        
        if isEmpty {
            signInButton.backgroundColor =  UIColor(red: 0/255, green: 122/255, blue: 255/255, alpha: 0.5)
        } else {
            signInButton.backgroundColor = UIColor.systemBlue
        }
    }
    
    func resetAuthorizationError() {
        emailTF.layer.borderColor = UIColor(red: 207/255.0, green: 216/255.0, blue: 220/255.0, alpha: 1.0).cgColor
        emailTF.layer.borderColor = UIColor(red: 207/255.0, green: 216/255.0, blue: 220/255.0, alpha: 1.0).cgColor
        errorLabel.isHidden = true
    }
    
    func showAuthorizationError() {
        emailTF.layer.borderColor = UIColor.red.cgColor
        errorLabel.isHidden = false
    }
    
    @objc private func signInButtonTapped() {
        
    }
    
    @objc private func backButtonTapped() {
        delegate?.registrationViewControllerDidGoBack()
        dismiss(animated: true)
    }
}
