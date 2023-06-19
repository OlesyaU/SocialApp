//
//  EnterNumberViewController.swift
//  SocialApp
//
//  Created by Олеся on 18.06.2023.
//

import UIKit

class EnterPhoneNumberViewController: UIViewController {
    private enum Constants {
        static let welcomeLabelTitle = "ЗАРЕГИСТРИРОВАТЬСЯ"
        static let pushNumberUserTitle = "Введите номер"
        static let secondLabelTitle = "Ваш номер телефона  будет использоваться \n для входа в приложение"
        static let placeholderString = " + 38 _ _ _ + _ _ _ + _ _ "
        static let buttonTitle = "ДАЛЕЕ"
        static let privacyLabelTitle = "Нажимая кнопку \"Далее\"  Вы принимаете \n пользовательское Соглашение и политику конфиденциальности"
        static let sideInset: CGFloat = 16
    }

    private let welcomeLabel: UILabel = {
        let label = UILabel().forAutolayout()
        label.text = Constants.welcomeLabelTitle
        label.font = UIFont(name: "AvenirNextCondensed-Bold", size: 18)
        label.textAlignment = .center
        label.cornerRadius()
        return label
    }()

    private let pushNumberLabel: UILabel = {
        let label = UILabel().forAutolayout()
        label.text = Constants.pushNumberUserTitle
        label.font = UIFont(name: "AvenirNextCondensed-Regular", size: 16)
        label.textColor = .lightGray
        label.textAlignment = .center
        return label
    }()

    private let secondLabel: UILabel = {
        let label = UILabel().forAutolayout()
        label.text = Constants.secondLabelTitle
        label.font = UIFont(name: "AvenirNextCondensed-Regular", size: 14)
        label.textColor = .gray
        label.textAlignment = .center
        label.numberOfLines = 2
        label.cornerRadius()
        return label
    }()

    private lazy var phoneNumberField: UITextField = {
        let field = UITextField().forAutolayout()
        field.cornerRadius()
        field.layer.borderWidth = 0.8
        field.layer.borderColor = UIColor.black.cgColor
        field.pinTop(to: secondLabel.bottomAnchor, inset: 8)
        field.pinLeading(to: view, inset: Constants.sideInset * 4)
        field.pinTrailing(to: view, inset: Constants.sideInset * 4)
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
                self.buttonTapped()
            }
        ).forAutolayout()
        button.setTitle(Constants .buttonTitle, for: .normal)
        button.cornerRadius()
        button.setBackgroundImage(.buttonBackgroundImageSelected, for: .normal)
        button.setBackgroundImage(.buttonBackgroundImageNormal, for: .highlighted)
        button.setBackgroundImage(.buttonBackgroundImageNormal, for: .disabled)
        return button
    }()

    private let privacyLabel: UILabel = {
        let label = UILabel().forAutolayout()
        label.text = Constants.privacyLabelTitle
        label.font = UIFont(name: "AvenirNextCondensed-Regular", size: 12)
        label.textColor = .lightGray
        label.textAlignment = .center
        label.numberOfLines = 3
        return label
    }()

    private var landscapeConstraints: [NSLayoutConstraint] = []
    private var portraitConstraints: [NSLayoutConstraint] = []
    private var commonConstraints: [NSLayoutConstraint] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        setupConstraints()
        setColor()
    }

    override func viewWillAppear(_ animated: Bool){
        super.viewWillAppear(animated)
        navigationController?.navigationBar.tintColor = .black
        navigationItem.leftBarButtonItem?.image = UIImage(systemName: "arrow.left")
        navigationItem.setLeftBarButton(UIBarButtonItem(image: UIImage(systemName: "arrow.left"), style: .plain, target: self, action: #selector(backItemAction)), animated: true)
    }

    // MARK: - Helpers

    private func addSubviews() {
        welcomeLabel.placed(on: view)
        pushNumberLabel.placed(on: view)
        secondLabel.placed(on: view)
        phoneNumberField.placed(on: view)
        confirmButton.placed(on: view)
        privacyLabel.placed(on: view)
    }

    private func buttonTapped() {
        let confirmViewController = ConfirmViewController()
        navigationController?.pushViewController(confirmViewController, animated: true)
    }

    @objc private func backItemAction(){
        navigationController?.popViewController(animated: true)
    }
}

// MARK: - Constraints

extension EnterPhoneNumberViewController {
    private func setupConstraints() {
        commonConstraints.append(
            contentsOf: [
                welcomeLabel.pinLeading(to: view.safeAreaLayoutGuide.leadingAnchor, inset: Constants.sideInset),
                welcomeLabel.pinTrailing(to: view.safeAreaLayoutGuide.trailingAnchor, inset: Constants.sideInset),
                pushNumberLabel.pinLeading(to: view.safeAreaLayoutGuide.leadingAnchor, inset: Constants.sideInset),
                pushNumberLabel.pinTrailing(to: view.safeAreaLayoutGuide.trailingAnchor, inset: Constants.sideInset),
                secondLabel.pinLeading(to: view.safeAreaLayoutGuide.leadingAnchor, inset: Constants.sideInset),
                secondLabel.pinTrailing(to: view.safeAreaLayoutGuide.trailingAnchor, inset: Constants.sideInset),

                confirmButton.pinHeight(equalTo: 44),
                privacyLabel.pinLeading(to: view.safeAreaLayoutGuide.leadingAnchor, inset: Constants.sideInset),
                privacyLabel.pinTrailing(to: view.safeAreaLayoutGuide.trailingAnchor, inset: Constants.sideInset)
            ]
        )

        landscapeConstraints.append(
            contentsOf: [
                welcomeLabel.pinTop(to: view, inset: 32),
                pushNumberLabel.pinTop(to: welcomeLabel.bottomAnchor, inset: 32),
                secondLabel.pinTop(to: pushNumberLabel.bottomAnchor, inset: 8),
                phoneNumberField.pinHeight(equalTo: 44),
                phoneNumberField.pinTop(to: secondLabel.bottomAnchor, inset: 16),
                phoneNumberField.pinCenterX(to: view),
                phoneNumberField.pinWidth(constant: view.frame.width / 2, multiplier: 1),
                confirmButton.pinTop(to: phoneNumberField.bottomAnchor, inset: 72),
                confirmButton.pinWidth(constant: view.frame.width / 2, multiplier: 1),
                confirmButton.pinCenterX(to: view),
                privacyLabel.pinTop(to: confirmButton.bottomAnchor,inset: 8)
            ]
        )

        portraitConstraints.append(
            contentsOf: [
                welcomeLabel.pinTop(to: view.safeAreaLayoutGuide.topAnchor, inset: 80),
                pushNumberLabel.pinTop(to: welcomeLabel.bottomAnchor, inset: 80),
                secondLabel.pinTop(to: pushNumberLabel.bottomAnchor, inset: 8),
                phoneNumberField.pinHeight(equalTo: 56),
                phoneNumberField.pinTop(to: secondLabel.bottomAnchor, inset: 24),
                phoneNumberField.pinLeading(to: secondLabel.leadingAnchor, inset: Constants.sideInset),
                phoneNumberField.pinTrailing(to: secondLabel.trailingAnchor, inset: Constants.sideInset),
                confirmButton.pinTop(to: phoneNumberField.bottomAnchor, inset: 100),
                confirmButton.pinLeading(to: phoneNumberField.leadingAnchor, inset: Constants.sideInset),
                confirmButton.pinTrailing(to: phoneNumberField.trailingAnchor, inset: Constants.sideInset),
                privacyLabel.pinTop(to: confirmButton.bottomAnchor,inset: 8)
            ]
        )

        if Orientation.isLandscape {
            NSLayoutConstraint.deactivate(portraitConstraints)
            NSLayoutConstraint.activate(landscapeConstraints)
        } else {
            NSLayoutConstraint.deactivate(landscapeConstraints)
            NSLayoutConstraint.activate(portraitConstraints)
        }

        NSLayoutConstraint.activate(commonConstraints)
    }
}

// MARK: - View Will Transition

extension EnterPhoneNumberViewController {
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)

        coordinator.animate { _ in
            if UIDevice.current.orientation.isLandscape {
                NSLayoutConstraint.deactivate(self.portraitConstraints)
                NSLayoutConstraint.activate(self.landscapeConstraints)
            } else {
                NSLayoutConstraint.deactivate(self.landscapeConstraints)
                NSLayoutConstraint.activate(self.portraitConstraints)
            }
        }
    }
}

extension EnterPhoneNumberViewController: SetThemeColorProtocol {
    func setColor() {
        view.backgroundColor = .backgroundPrimary
        phoneNumberField.backgroundColor = .textFieldColor
        confirmButton.tintColor = .contentColor
    }
}



