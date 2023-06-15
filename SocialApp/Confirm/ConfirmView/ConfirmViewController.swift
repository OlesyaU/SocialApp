//
//  ConfirmViewController.swift
//  SocialApp
//
//  Created by Олеся on 14.06.2023.
//

import UIKit

class ConfirmViewController: UIViewController {
    private enum Constants {
        static let welcomeLabelTitle = "С возвращением"
        static let welcomeNewUserTitle = "Добро пожаловать !"
        static let secondLabelTitle = "Введите номер телефона \n для входа в приложение"
        static let placeholderString = " + 38 _ _ _ + _ _ _ + _ _ "
        static let buttonTitle = "ПОДТВЕРДИТЬ"
        static let constraint: CGFloat = 16
    }

    private lazy var welcomeLabel: UILabel = {
        let label = UILabel().forAutolayout()
        label.text = Constants.welcomeLabelTitle
        label.font = UIFont(name: "AvenirNextCondensed-Bold", size: 18)
        label.textAlignment = .center
        label.placed(on: view)
        label.cornerRadius()
        return label
    }()

    private lazy var secondLabel: UILabel = {
        let label = UILabel().forAutolayout()
        let text = Constants.secondLabelTitle
        let shadow = NSShadow()
        shadow.shadowColor = UIColor.gray
        shadow.shadowBlurRadius = 5
        shadow.shadowOffset = CGSize(width: 3, height: 3)
        let attrs: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: 16),
            .foregroundColor: UIColor.gray,
            .shadow: shadow
        ]
        let attributedText = NSAttributedString(string: text, attributes: attrs)
        label.attributedText = attributedText
        label.textAlignment = .center
        label.placed(on: view)
        label.numberOfLines = 2
        label.cornerRadius()
        return label
    }()

    private lazy var phoneNumberField: UITextField = {
        let field = UITextField().forAutolayout()
        field.placed(on: view)
        field.cornerRadius()
        field.layer.borderWidth = 0.8
        field.layer.borderColor = UIColor.black.cgColor
        field.pinHeight(constant: 50)
        field.pinTop(to: secondLabel.bottomAnchor, inset: 8)
        field.pinLeading(to: view, inset: Constants.constraint * 4)
        field.pinTrailing(to: view, inset: Constants.constraint * 4)
        field.keyboardType = .phonePad
        let centeredParagraphStyle = NSMutableParagraphStyle()
        centeredParagraphStyle.alignment = .center
        field.attributedPlaceholder = NSAttributedString(
            string: Constants.placeholderString,
            attributes: [.paragraphStyle: centeredParagraphStyle]
        )
        return field
    }()

    private lazy var confirmButton: UIButton = {
        let button = UIButton(
            primaryAction: UIAction { [unowned self] _ in

            }
        ).forAutolayout()
        button.setTitle(Constants .buttonTitle, for: .normal)
        button.placed(on: view)
        button.cornerRadius()
        button.setBackgroundImage(.buttonBackgroundImageSelected, for: .normal)
        button.setBackgroundImage(.buttonBackgroundImageNormal, for: .highlighted)
        button.setBackgroundImage(.buttonBackgroundImageNormal, for: .disabled)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpLayout()
        setColor()
    }

    override func viewWillAppear(_ animated: Bool){
        super.viewWillAppear(animated)
        navigationItem.setHidesBackButton(true, animated: false)
    }
}

extension ConfirmViewController: SetThemeColorProtocol {
    func setColor() {
        view.backgroundColor = .backgroundPrimary
        phoneNumberField.backgroundColor = .textFieldColor
        confirmButton.tintColor = .contentColor
    }

    private func setUpLayout(){
        welcomeLabel.pinHeight(constant: 50)
        welcomeLabel.pinTop(to: view.safeAreaLayoutGuide.topAnchor, inset: 120)
        welcomeLabel.pinLeading(to: view, inset: Constants.constraint * 4)
        welcomeLabel.pinTrailing(to: view, inset: Constants.constraint * 4)
        secondLabel.pinHeight(constant: 50)
        secondLabel.pinTop(to: welcomeLabel.bottomAnchor, inset: 8)
        secondLabel.pinLeading(to: view, inset: Constants.constraint * 4)
        secondLabel.pinTrailing(to: view, inset: Constants.constraint * 4)
        confirmButton.pinHeight(constant: 50)
        confirmButton.pinTop(to: phoneNumberField.bottomAnchor, inset: 100)
        confirmButton.pinLeading(to: view, inset: Constants.constraint * 6)
        confirmButton.pinTrailing(to: view, inset: Constants.constraint * 6)
    }
}
