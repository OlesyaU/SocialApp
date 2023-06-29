//
//  ConfirmViewController.swift
//  SocialApp
//
//  Created by Олеся on 18.06.2023.
//

import UIKit

class ConfirmViewController: UIViewController {
    private enum Constants {
        static let confirmLabelTitle = "Подтверждение регистрации"
        static let pushNumberUserTitle = "Мы отправили SMS с кодом на номер"
        static let numberLabelTitle = "+7 999 999 99 99"
        static let putNumberLabelTitle = "Введите код из SMS"
        static let placeholderString = "  _ _ _ - _ _ _ - _ _ "
        static let buttonTitle = "ЗАРЕГИСТРИРОВАТЬСЯ"
        static let sideInset: CGFloat = 16
    }

    private let confirmLabel: UILabel = {
        let label = UILabel().forAutolayout()
        label.text = Constants.confirmLabelTitle
        label.font = UIFont(name: "AvenirNextCondensed-Bold", size: 18)
        label.textAlignment = .center
        label.textColor = .systemOrange
        return label
    }()

    private let pushVerificationCodeLabel: UILabel = {
        let label = UILabel().forAutolayout()
        label.text = Constants.pushNumberUserTitle
        label.font = UIFont(name: "AvenirNextCondensed-Regular", size: 16)
        label.textColor = . gray
        label.textAlignment = .center
        return label
    }()

    private let numberLabel: UILabel = {
        let label = UILabel().forAutolayout()
        label.text = Constants.numberLabelTitle
        label.font = UIFont(name: "AvenirNextCondensed-Bold", size: 18)
        label.textColor = .darkGray
        label.textAlignment = .center
        label.numberOfLines = 1
        return label
    }()

    private let putNumberLabel: UILabel = {
        let label = UILabel().forAutolayout()
        label.text = Constants.putNumberLabelTitle
        label.font = UIFont(name: "AvenirNextCondensed-Regular", size: 12)
        label.textColor = .gray
        label.textAlignment = .left
        label.numberOfLines = 1
        return label
    }()

    private lazy var phoneNumberField: UITextField = {
        let field = UITextField().forAutolayout()
        field.cornerRadius()
        field.layer.borderWidth = 0.8
        field.layer.borderColor = UIColor.black.cgColor
        field.pinTop(to: numberLabel.bottomAnchor, inset: 8)
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
        field.clearButtonMode = .whileEditing
        return field
    }()

    private lazy var registrationButton: UIButton = {
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

    private let readyImage: UIImageView = {
        let image = UIImageView().forAutolayout()
        image.image = UIImage(named: "Ready")
        image.contentMode = .scaleAspectFit
        return image
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
        confirmLabel.placed(on: view)
        pushVerificationCodeLabel.placed(on: view)
        numberLabel.placed(on: view)
        putNumberLabel.placed(on: view)
        phoneNumberField.placed(on: view)
        registrationButton.placed(on: view)
        readyImage.placed(on: view)
    }

    private func buttonTapped() {
        let confirmViewController = MainTabBarController()
        navigationController?.setViewControllers([confirmViewController], animated: false)
    }

    @objc private func backItemAction(){
        navigationController?.popViewController(animated: true)
    }
}

// MARK: - Constraints

extension ConfirmViewController {
    private func setupConstraints() {
        commonConstraints.append(
            contentsOf: [
                numberLabel.pinTop(to: pushVerificationCodeLabel.bottomAnchor, inset: 0),
                phoneNumberField.pinLeading(to: registrationButton.leadingAnchor, inset: Constants.sideInset),
                phoneNumberField.pinTrailing(to: view.safeAreaLayoutGuide.trailingAnchor, inset: Constants.sideInset),
                registrationButton.pinHeight(equalTo: 44),
            ]
        )

        landscapeConstraints.append(
            contentsOf: [
                confirmLabel.pinTop(to: view, inset: 32),
                confirmLabel.pinLeading(to: readyImage.trailingAnchor, inset: Constants.sideInset),
                confirmLabel.pinTrailing(to: view.trailingAnchor, inset: Constants.sideInset),
                pushVerificationCodeLabel.pinTop(to: confirmLabel.bottomAnchor, inset: 32),
                pushVerificationCodeLabel.pinLeading(to: phoneNumberField.leadingAnchor, inset: 0),
                pushVerificationCodeLabel.pinTrailing(to: view.safeAreaLayoutGuide.trailingAnchor, inset: Constants.sideInset),

                putNumberLabel.pinBottom(to: phoneNumberField.topAnchor, inset: 0),
                putNumberLabel.pinLeading(to: phoneNumberField.leadingAnchor, inset: Constants.sideInset),
                phoneNumberField.pinHeight(equalTo: 44),
                phoneNumberField.pinTop(to: numberLabel.bottomAnchor, inset: 24),
                numberLabel.pinLeading(to: readyImage.trailingAnchor, inset: Constants.sideInset),
                numberLabel.pinTrailing(to: phoneNumberField.trailingAnchor, inset: Constants.sideInset),
                phoneNumberField.pinWidth(constant: view.frame.width / 2, multiplier: 1),
                registrationButton.pinTop(to: phoneNumberField.bottomAnchor, inset: 56),
                registrationButton.pinWidth(constant: view.frame.width / 2, multiplier: 1),
                registrationButton.pinLeading(to: phoneNumberField.leadingAnchor, inset: 0),
                registrationButton.pinTrailing(to: phoneNumberField.trailingAnchor, inset: 0),
                readyImage.pinTop(to: view.topAnchor,inset: 32),
                readyImage.pinLeading(to: view.safeAreaLayoutGuide.leadingAnchor,inset: Constants.sideInset),
                readyImage.pinTop(to: confirmLabel.topAnchor),
                readyImage.pinBottom(to: view.bottomAnchor, inset: Constants.sideInset),
                readyImage.pinWidth(constant: 200, multiplier: 1)
            ]
        )

        portraitConstraints.append(
            contentsOf: [
                confirmLabel.pinTop(to: view.safeAreaLayoutGuide.topAnchor, inset: 80),
                confirmLabel.pinLeading(to: view.safeAreaLayoutGuide.leadingAnchor, inset: Constants.sideInset),
                confirmLabel.pinTrailing(to: view.safeAreaLayoutGuide.trailingAnchor, inset: Constants.sideInset),
                pushVerificationCodeLabel.pinTop(to: confirmLabel.bottomAnchor, inset: Constants.sideInset),
                pushVerificationCodeLabel.pinLeading(to: confirmLabel.leadingAnchor, inset: 0),
                pushVerificationCodeLabel.pinTrailing(to: confirmLabel.trailingAnchor, inset: 0),
                numberLabel.pinTop(to: pushVerificationCodeLabel.bottomAnchor, inset: 0),
                numberLabel.pinLeading(to: pushVerificationCodeLabel.leadingAnchor),
                putNumberLabel.pinBottom(to: phoneNumberField.topAnchor, inset: 0),
                putNumberLabel.pinLeading(to: phoneNumberField.leadingAnchor, inset: 0),
                putNumberLabel.pinLeading(to: phoneNumberField.trailingAnchor, inset: 0),
                phoneNumberField.pinHeight(equalTo: 56),
                phoneNumberField.pinTop(to: numberLabel.bottomAnchor, inset: 56),
                phoneNumberField.pinLeading(to: numberLabel.leadingAnchor, inset: Constants.sideInset),
                phoneNumberField.pinTrailing(to: numberLabel.trailingAnchor, inset: Constants.sideInset),
                registrationButton.pinTop(to: phoneNumberField.bottomAnchor, inset: 100),
                registrationButton.pinLeading(to: phoneNumberField.leadingAnchor),
                registrationButton.pinTrailing(to: phoneNumberField.trailingAnchor),
                readyImage.pinTop(to: registrationButton.bottomAnchor, inset: 32),
                readyImage.pinLeading(to: registrationButton.leadingAnchor, inset: 0),
                readyImage.pinTrailing(to: registrationButton.trailingAnchor, inset: 0),
                readyImage.pinHeight(equalTo: 200)
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

extension ConfirmViewController {
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

extension ConfirmViewController: SetThemeColorProtocol {
    func setColor() {
        view.backgroundColor = .backgroundPrimary
        phoneNumberField.backgroundColor = .textFieldColor
        registrationButton.tintColor = .contentColor
    }
}

extension ConfirmViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let text = textField.text else { return  false}
        textField.text = text.applyPatternOnNumbers(pattern: "###-##-##", replacementCharacter: "#")
        let newLength = text.count
        return newLength <= 8
    }
}
