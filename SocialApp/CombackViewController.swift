//
//  ConfirmViewController.swift
//  SocialApp
//
//  Created by Олеся on 14.06.2023.
//

import UIKit

protocol ComebackViewModelProtocol {
    func checkUser(by phone: String) -> Profile?
}

class CombackViewController: UIViewController {
    private var viewModel = CombackViewModel()
    private enum Constants {
        static let welcomeLabelTitle = "С возвращением"
        static let welcomeNewUserTitle = "Добро пожаловать !"
        static let secondLabelTitle = "Введите номер телефона \n для входа в приложение"
        static let placeholderString = " +7 _ _ _  _ _ _  _ _  _ _"
        static let buttonTitle = "ПОДТВЕРДИТЬ"
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

    private let secondLabel: UILabel = {
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
        field.textAlignment = .center
        let centeredParagraphStyle = NSMutableParagraphStyle()
        centeredParagraphStyle.alignment = .center
        field.attributedPlaceholder = NSAttributedString(
            string: Constants.placeholderString,
            attributes: [.paragraphStyle: centeredParagraphStyle]
        )
        field.delegate = self
        field.clearButtonMode = .always
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
        navigationItem.setHidesBackButton(true, animated: false)
    }

    // MARK: - Helpers

    private func addSubviews() {
        welcomeLabel.placed(on: view)
        secondLabel.placed(on: view)
        phoneNumberField.placed(on: view)
        confirmButton.placed(on: view)
    }

    private func buttonTapped() {
        guard let numberFromTextField = phoneNumberField.text else { return }
        if viewModel.checkUser(by: numberFromTextField) != nil {
            let confirmViewController = FeedTableViewController()
            navigationController?.pushViewController(confirmViewController, animated: true)
        } else {
            showAleart()
        }
    }
}

// MARK: - Constraints

extension CombackViewController {
    private func setupConstraints() {
        commonConstraints.append(
            contentsOf: [
                welcomeLabel.pinLeading(to: view.safeAreaLayoutGuide.leadingAnchor, inset: Constants.sideInset),
                welcomeLabel.pinTrailing(to: view.safeAreaLayoutGuide.trailingAnchor, inset: Constants.sideInset),

                secondLabel.pinLeading(to: view.safeAreaLayoutGuide.leadingAnchor, inset: Constants.sideInset),
                secondLabel.pinTrailing(to: view.safeAreaLayoutGuide.trailingAnchor, inset: Constants.sideInset),

                confirmButton.pinHeight(equalTo: 44),

            ]
        )

        landscapeConstraints.append(
            contentsOf: [
                welcomeLabel.pinTop(to: view, inset: 32),
                secondLabel.pinTop(to: welcomeLabel.bottomAnchor, inset: 8),
                phoneNumberField.pinHeight(equalTo: 44),
                phoneNumberField.pinTop(to: secondLabel.bottomAnchor, inset: 16),
                phoneNumberField.pinCenterX(to: view),
                phoneNumberField.pinWidth(constant: view.frame.width / 2, multiplier: 1),
                confirmButton.pinTop(to: phoneNumberField.bottomAnchor, inset: 80),
                confirmButton.pinWidth(constant: view.frame.width / 2, multiplier: 1),
                confirmButton.pinCenterX(to: view)
            ]
        )

        portraitConstraints.append(
            contentsOf: [
                welcomeLabel.pinTop(to: view.safeAreaLayoutGuide.topAnchor, inset: 100),
                secondLabel.pinTop(to: welcomeLabel.bottomAnchor, inset: 8),
                phoneNumberField.pinHeight(equalTo: 56),
                phoneNumberField.pinTop(to: secondLabel.bottomAnchor, inset: 24),
                phoneNumberField.pinLeading(to: secondLabel.leadingAnchor, inset: Constants.sideInset),
                phoneNumberField.pinTrailing(to: secondLabel.trailingAnchor, inset: Constants.sideInset),
                confirmButton.pinTop(to: phoneNumberField.bottomAnchor, inset: 100),
                confirmButton.pinLeading(to: phoneNumberField.leadingAnchor, inset: Constants.sideInset),
                confirmButton.pinTrailing(to: phoneNumberField.trailingAnchor, inset: Constants.sideInset)
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

extension CombackViewController {
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

extension CombackViewController: SetThemeColorProtocol {
    func setColor() {
        view.backgroundColor = .backgroundPrimary
        phoneNumberField.backgroundColor = .textFieldColor
        confirmButton.tintColor = .contentColor
    }
}

extension CombackViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let text = textField.text else { return  false}
        textField.text = text.applyPatternOnNumbers(pattern: "+# ### ### ## ##", replacementCharacter: "#")
        let newLength = text.count - 3
        return newLength <= 12 || string.isEmpty
    }
}

extension CombackViewController {
    private func showAleart () {
        let aleart = UIAlertController(title: "OOPPPSS", message: "The pass is wrong", preferredStyle: .alert)
        let action = UIAlertAction(title:  "OMG", style: .destructive, handler: { [weak self ] _ in
            self?.navigationController?.popViewController(animated: true)
        })
        aleart.addAction(action)
        present(aleart, animated: true)
    }
}
