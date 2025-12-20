//
//  AuthViewController.swift
//  Cafe-ios
//
//  Created by Антон Абалуев on 29.11.2025.
//

import UIKit
import SnapKit

class AuthViewController: UIViewController, UITextFieldDelegate {
    
    private let logoImageView = UIImageView()
    private let loginLabel = UILabel()
    private let loginTF = UITextField()
    private let passwordLabel = UILabel()
    private let passwordTF = UITextField()
    private let errorLabel = UILabel()
    private let loginButton = UIButton(type: .system)
    private let forgotPasswordButton = UIButton(type: .system)
    private let registrationLabel = UILabel()
    private let registrButton = UIButton(type: .system)
    private let passwordToggleButton = UIButton(type: .custom)
    
    var interactor: AuthInteractorProtocol?
    var router: AuthRouterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        router = AuthRouter(viewController: self) // исправить
        setupUI()
        setupKeyboardObservers()
    }
    
    private func setupUI(){
        // view.backgroundColor = .red
        
        view.backgroundColor = UIColor(red: 231/255.0, green: 235/255.0, blue: 241/255.0, alpha: 1.0)
        
        loginTF.text = ""
        passwordTF.text = ""
        loginTF.delegate = self
        passwordTF.delegate = self
        //interactor?.loginDidtap(text: loginTF.text ?? "")
        //interactor?.passwordDidtap(text: passwordTF.text ?? "")
        
        logoImageView.tap {
            view.addSubview($0)
            $0.image = Shark.I.logoImage
            $0.contentMode = .scaleAspectFit
            $0.snp.makeConstraints {
                $0.centerX.equalToSuperview()
                $0.centerY.equalToSuperview().offset(-200)
            }
        }
        loginLabel.tap {
            view.addSubview($0)
            $0.text = "Логин"
            $0.textColor = UIColor(red: 144/255.0, green: 164/255.0, blue: 174/255.0, alpha: 1.0)
            $0.font = UIFont(name: "SF Pro Display", size: 15)
            $0.font = UIFont.preferredFont(forTextStyle: .subheadline)
            $0.snp.makeConstraints {
                $0.top.equalTo(logoImageView.snp.bottom).offset(65)
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
        passwordLabel.tap {
            view.addSubview($0)
            $0.text = "Пароль"
            $0.textColor = UIColor(red: 144/255.0, green: 164/255.0, blue: 174/255.0, alpha: 1.0)
            $0.font = UIFont(name: "SF Pro Display", size: 15)
            $0.font = UIFont.preferredFont(forTextStyle: .subheadline)
            $0.snp.makeConstraints {
                $0.leading.equalTo(loginLabel)
                $0.top.equalTo(loginTF.snp.bottom).offset(16)
            }
        }
        // Настройка кнопки переключения видимости пароля
        passwordToggleButton.tap {
            $0.setImage(UIImage(systemName: "eye.slash"), for: .normal)
            $0.tintColor = UIColor(red: 144/255.0, green: 164/255.0, blue: 174/255.0, alpha: 1.0)
            $0.addTarget(self, action: #selector(togglePasswordVisibility), for: .touchUpInside)
            $0.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
        }
        passwordTF.tap {
            view.addSubview($0)
            $0.placeholder = "Введите пароль"
            $0.font = UIFont(name: "SF Pro Display", size: 15)
            $0.backgroundColor = UIColor.clear
            $0.layer.cornerRadius = 10.0
            $0.layer.borderWidth = 1.0
            $0.layer.borderColor = UIColor(red: 207/255.0, green: 216/255.0, blue: 220/255.0, alpha: 1.0).cgColor
            $0.isSecureTextEntry = true
            
            // Добавляем правый view с кнопкой глазка
            $0.rightView = passwordToggleButton
            $0.rightViewMode = .always
            
            let paddingView2 = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: loginTF.frame.height))
            $0.leftView = paddingView2
            $0.leftViewMode = .always
            $0.addTarget(self, action: #selector(passwordTextFiledDidTapped(_:)), for: .editingChanged)
            $0.snp.makeConstraints {
                $0.left.right.equalToSuperview().inset(16)
                $0.top.equalTo(passwordLabel.snp.bottom).offset(4)
                $0.height.equalTo(50)
            }
        }
        errorLabel.tap {
            view.addSubview($0)
            $0.text = "Неверный логин или пароль."
            $0.font = UIFont.systemFont(ofSize: 12)
            $0.textColor = .red
            $0.isHidden = true
            errorLabel.snp.makeConstraints {
                $0.left.right.equalToSuperview().inset(16)
                $0.top.equalTo(passwordTF.snp.bottom).offset(4)
            }
        }
        forgotPasswordButton.tap {
            view.addSubview($0)
            $0.setTitle("Забыли пароль?", for: .normal)
            $0.setTitleColor(UIColor(named: "#0065FF"), for: .normal)
            $0.titleLabel?.font = UIFont(name: "SF Pro Display", size: 15)
            $0.titleLabel?.font = UIFont.preferredFont(forTextStyle: .subheadline)
            $0.backgroundColor = .clear
            $0.contentHorizontalAlignment = .left
            $0.addTarget(self, action: #selector(forgotPasswordButtonTapped), for: .touchUpInside)
            $0.snp.makeConstraints {
                $0.top.equalTo(errorLabel.snp.bottom).offset(8)
                $0.leading.equalToSuperview().offset(16)
                $0.trailing.equalToSuperview().inset(16)
                
            }
        }
        loginButton.tap {
            view.addSubview($0)
            $0.setTitle("Войти в систему", for: .normal)
            $0.titleLabel?.font = UIFont(name: "SF Pro Display", size: 15)
            $0.backgroundColor = .systemBlue
            $0.layer.cornerRadius = 10.0
            $0.setTitleColor(.white, for: .normal)
            $0.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
            $0.snp.makeConstraints {
                $0.left.right.equalToSuperview().inset(16)
                $0.top.equalTo(forgotPasswordButton.snp.bottom).offset(24)
                $0.height.equalTo(50)
            }
        }
        registrationLabel.tap {
            view.addSubview($0)
            $0.text = "Нет аккаунта в системе?"
            $0.textColor = UIColor(named: "#546E7A")
            $0.font = UIFont(name: "SF Pro Display", size: 17)
            $0.font = UIFont.preferredFont(forTextStyle: .subheadline)
            $0.snp.makeConstraints {
                $0.top.equalTo(loginButton.snp.bottom).offset(28)
                $0.centerX.equalToSuperview()
            }
        }
        registrButton.tap {
            view.addSubview($0)
            $0.setTitle("Регистрация", for: .normal)
            $0.tintColor = UIColor(named: "#0065FF")
            $0.titleLabel?.font = UIFont(name: "SF Pro Display", size: 15)
            $0.setTitleColor(.systemBlue, for: .normal)
            $0.layer.cornerRadius = 10.0
            $0.backgroundColor = UIColor(red: 0/255, green: 122/255, blue: 255/255, alpha: 0.15)
            $0.setTitleColor(UIColor(red: 0/255, green: 101/255, blue: 255/255, alpha: 1), for: .normal)
            $0.addTarget(self, action: #selector(registrButtonTapped), for: .touchUpInside)
            $0.snp.makeConstraints {
                $0.top.equalTo(registrationLabel.snp.bottom).offset(28)
                $0.leading.equalToSuperview().offset(16)
                $0.trailing.equalToSuperview().inset(16)
                $0.height.equalTo(50)
            }
        }
    }
}

extension AuthViewController {
    
    func setupKeyboardObservers() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc private func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            let bottomInset = keyboardSize.height
            let buttonFrame = loginButton.frame.origin.y + loginButton.frame.height
            let distanceToKeyboard = self.view.frame.height - bottomInset - buttonFrame
            
            if distanceToKeyboard < 10 {
                self.view.frame.origin.y = -(10 - distanceToKeyboard)
            }
        }
    }
    
    @objc private func keyboardWillHide(notification: NSNotification) {
        self.view.frame.origin.y = 0
    }
    
    @objc func loginTextFiledDidTapped(_ textField: UITextField){
        //  interactor?.loginDidtap(text: textField.text ?? "")
        resetAoutorizationError()
    }
    
    // сбросить отображение ошибки авторизации
    func resetAoutorizationError() {
        loginTF.layer.borderColor = UIColor(red: 207/255.0, green: 216/255.0, blue: 220/255.0, alpha: 1.0).cgColor
        passwordTF.layer.borderColor = UIColor(red: 207/255.0, green: 216/255.0, blue: 220/255.0, alpha: 1.0).cgColor
        errorLabel.isHidden = true
    }
    
    @objc func passwordTextFiledDidTapped(_ textField: UITextField){
        //  interactor?.passwordDidtap(text: textField.text ?? "")
        resetAoutorizationError()
    }
    
    @objc private func forgotPasswordButtonTapped(){
        router?.navigateToForgotPassword()
    }
    
    @objc func loginButtonTapped() {
        interactor?.login()
    }
    
    @objc private func registrButtonTapped(){
        router?.navigateToRegistration()
    }
    
    // Функция для переключения видимости пароля
    @objc private func togglePasswordVisibility() {
        passwordTF.isSecureTextEntry.toggle()
        
        // Меняем иконку в зависимости от состояния
        let imageName = passwordTF.isSecureTextEntry ? "eye.slash" : "eye"
        passwordToggleButton.setImage(UIImage(systemName: imageName), for: .normal)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == loginTF {
            passwordTF.becomeFirstResponder()
        } else if textField == passwordTF {
            textField.resignFirstResponder()
        }
        
        return true
    }
    
    func showAuthtorisationError() {
        loginTF.layer.borderColor = UIColor.red.cgColor
        passwordTF.layer.borderColor = UIColor.red.cgColor
        errorLabel.isHidden = false
    }
}
