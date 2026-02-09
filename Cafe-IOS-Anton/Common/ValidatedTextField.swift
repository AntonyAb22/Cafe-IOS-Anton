//
//  ValidatedTextField.swift
//  Cafe-iOS-Anton
//
//  Created by Антон Абалуев on 31.01.2026.
//
import UIKit

class ValidatedTextField: UIView, UITextViewDelegate {
    
    var buttonAction: (() -> Void)?
    private var titleLabel = UILabel()
    private var isRequiredLabel = UILabel()
    private var titleContainer = UIView()
    private var errorLabel = UILabel()
    public var textView = UITextView()
    private var stackContainer = UIStackView()
    private var fieldContainer = UIView()
    private var actionButton = UIButton()
    private var placeholderText: String?
    
    public var backgroundColorTF: UIColor = .white {
        didSet {
            backgroundColor = UIColor.white
        }
    }
    
    public var keyboardType: UIKeyboardType = .default {
        didSet {
            textView.keyboardType = keyboardType
        }
    }
    
    public var textFieldDelegate: UITextViewDelegate? {
        didSet {
            textView.delegate = textFieldDelegate
        }
    }
    
    public var cornerRadius: CGFloat = 4 {
        didSet {
            actionButton.layer.cornerRadius = cornerRadius
        }
    }
    
    public var fieldHeight: Int? {
        didSet {
            textView.snp.updateConstraints {
                $0.top.bottom.leading.trailing.equalToSuperview()
                $0.height.equalTo(fieldHeight ?? 50)
            }
        }
    }
    
    public var title: String? {
        didSet {
            titleLabel.text = title
        }
    }
    
    public var placeholder: String? {
            didSet {
                placeholderText = placeholder
                if text.isEmpty {
                    textView.text = placeholder
                    textView.textColor = Shark.C.blueGreyLighten3
                }
            }
        }
    
    public var errorText: String? {
        didSet {
            errorLabel.isHidden = errorText == nil
            errorLabel.text = errorText
            titleLabel.textColor = errorText == nil ? Shark.C.blueGreyDarken4 : Shark.C.customError
            textView.layer.borderWidth = errorText == nil ? 1 : 2
            textView.layer.borderColor = errorText == nil ? Shark.C.blueGreyLighten3.cgColor : Shark.C.customError.cgColor
        }
    }
    
    public var hasRefresh: Bool = false {
        didSet {
            actionButton.isHidden = !hasRefresh
        }
    }
    
    public var hasValidation: Bool = false {
        didSet {
            isRequiredLabel.isHidden = !hasValidation
        }
    }
    
    public var text: String {
        set {
            textView.text = newValue
        }
        get {
            textView.text
        }
    }
    
    public var actionButtonImage: UIImage? {
        didSet {
            actionButton.setImage(actionButtonImage, for: .normal)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
        textView.delegate = self
    }
    
    func textViewDidChange(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.textColor = Shark.C.blueGreyLighten3
        } else {
            textView.textColor = Shark.C.blueGreyDarken4
        }
    }
    
    func setupUI() {
        
        stackContainer.tap {
            addSubview($0)
            $0.axis = .vertical
            $0.distribution = .equalSpacing
            $0.spacing = 4
            $0.snp.makeConstraints {
                $0.top.bottom.leading.trailing.equalToSuperview()
            }
        }
        titleContainer.tap {
            stackContainer.addArrangedSubview($0)
            $0.backgroundColor = .clear
        }
        titleLabel.tap {
            titleContainer.addSubview($0)
            $0.textColor = .black
            $0.font = .systemFont(ofSize: 15)
            $0.snp.makeConstraints {
                $0.top.leading.bottom.equalToSuperview()
            }
        }
        isRequiredLabel.tap {
            titleContainer.addSubview($0)
            $0.isHidden = !hasValidation
            $0.textColor = Shark.C.customError
            $0.text = "*"
            $0.snp.makeConstraints {
                $0.bottom.top.equalToSuperview()
                $0.leading.equalTo(titleLabel.snp.trailing)
            }
        }
        fieldContainer.tap {
            stackContainer.addArrangedSubview($0)
        }
        textView.tap {
            fieldContainer.addSubview($0)
            $0.textContainerInset = UIEdgeInsets(top: 14, left: 14, bottom: 14, right: 14)
            $0.textColor = Shark.C.blueGreyDarken3
            $0.delegate = self
            $0.font = .systemFont(ofSize: 15)
            $0.layer.cornerRadius = 4
            $0.layer.borderWidth = 1
            $0.layer.borderColor = Shark.C.blueGreyLighten3.cgColor
            $0.backgroundColor = Shark.C.greyLighten5
            $0.snp.makeConstraints {
                $0.top.bottom.leading.trailing.equalToSuperview()
                $0.height.equalTo(fieldHeight ?? 50)
            }
        }
        errorLabel.tap {
            stackContainer.addArrangedSubview($0)
            $0.font = .systemFont(ofSize: 12, weight: .medium)
            $0.textColor = Shark.C.customError
            $0.numberOfLines = 0
        }
        actionButton.tap {
            fieldContainer.addSubview($0)
            $0.setImage(actionButtonImage, for: .normal)
            $0.setBackgroundImage(actionButtonImage, for: .normal)
            $0.isHidden = !hasRefresh
            $0.clipsToBounds = true
            $0.addTarget(self, action: #selector(actionButtonTapped), for: .touchUpInside)
            $0.snp.makeConstraints {
                $0.top.equalToSuperview().offset(14)
                $0.bottom.equalToSuperview().inset(14)
                $0.trailing.equalToSuperview().inset(18)
            }
        }
    }
    
    @objc func actionButtonTapped() {
        actionButton.setImage(actionButtonImage, for: .normal)
        buttonAction?()
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
            if textView.text == placeholderText {
                textView.text = ""
                textView.textColor = Shark.C.blueGreyDarken4
            }
        }
        
        func textViewDidEndEditing(_ textView: UITextView) {
            if textView.text.isEmpty {
                textView.text = placeholderText
                textView.textColor = Shark.C.blueGreyLighten3
            }
        }
}
