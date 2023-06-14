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
        static let secondLabelTitle = "Введите номер телефона \n для входа в приложение"
        static let constraint: CGFloat = 16
        static let placeholderString = " + 38 _ _ _ + _ _ _ + _ _ "
        static let buttonTitle = " ПОДТВЕРДИТЬ"
    }

    private lazy var welcomeLabel: UILabel = {
        let label = UILabel().forAutolayout()
        label.text = Constants.welcomeLabelTitle
        label.font = UIFont(name: "AvenirNextCondensed-Bold", size: 18)
        label.textAlignment = .center
        label.placed(on: view)
        label.pinHeight(constant: 50)
        label.pinTop(to: view.safeAreaLayoutGuide.topAnchor, inset: 120)
        label.pinLeading(to: view, inset: Constants.constraint * 4)
        label.pinTrailing(to: view, inset: Constants.constraint * 4)
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
        label.pinHeight(constant: 50)
        label.pinTop(to: welcomeLabel.bottomAnchor, inset: 8)
        label.numberOfLines = 2
        label.pinLeading(to: view, inset: Constants.constraint * 4)
        label.pinTrailing(to: view, inset: Constants.constraint * 4)
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
        let button = UIButton().forAutolayout()
        button.setTitle(Constants .buttonTitle, for: .normal)
        button.placed(on: view)
        button.pinHeight(constant: 50)
        button.pinTop(to: phoneNumberField.bottomAnchor, inset: 100)
        button.pinLeading(to: view, inset: Constants.constraint * 6)
        button.pinTrailing(to: view, inset: Constants.constraint * 6)
        button.cornerRadius()
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setColor()
        navigationController?.navigationBar.isHidden = true

    }
}

extension ConfirmViewController: SetThemeColorProtocol {
    func setColor() {
        view.backgroundColor = .themeColor
        welcomeLabel.backgroundColor = .labelColor
        welcomeLabel.textColor = .buttonColor
        secondLabel.backgroundColor = .labelColor
        phoneNumberField.backgroundColor = .white
        confirmButton.backgroundColor = .buttonColor
    }
}
