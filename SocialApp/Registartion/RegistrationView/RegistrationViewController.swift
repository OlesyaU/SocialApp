//
//  ViewController.swift
//  SocialApp
//
//  Created by Олеся on 14.06.2023.
//

import UIKit

class RegistrationViewController: UIViewController {
    private enum Constants {
        static let registerButtonTitle = "ЗАРЕГИСТРИРОВАТЬСЯ"
        static let alreadyButtonTitle = "Уже есть аккаунт"
        static let sideInset: CGFloat = 16
    }

    // MARK: - Properties

    private let startScreenImage: UIImageView = {
        let image = UIImageView().forAutolayout()
        image.image = UIImage(named: "WelcomeLogo")
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    private lazy var registerButton: UIButton = {
        let button = UIButton(
            primaryAction: UIAction { [unowned self] _ in
                self.createUser()
            }
        ).forAutolayout()
        button.setTitle(Constants.registerButtonTitle, for: .normal)
        button.setBackgroundImage(.buttonBackgroundImageNormal, for: .normal)
        button.setBackgroundImage(.buttonBackgroundImageSelected, for: .highlighted)
        button.setBackgroundImage(.buttonBackgroundImageSelected, for: .disabled)
        button.cornerRadius()
        return button
    }()
    
    private lazy var alreadyButton: UIButton = {
        let button = UIButton(
            primaryAction: UIAction { [unowned self] _ in
                self.buttonTapped()
            }
        ).forAutolayout()
        button.setTitle(Constants.alreadyButtonTitle, for: .normal)
        button.cornerRadius()
        return button
    }()

    private var landscapeConstraints: [NSLayoutConstraint] = []
    private var portraitConstraints: [NSLayoutConstraint] = []
    private var commonConstraints: [NSLayoutConstraint] = []

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        setupConstraints()
        setColor()
    }

    // MARK: - Helpers

    private func addSubviews() {
        startScreenImage.placed(on: view)
        registerButton.placed(on: view)
        alreadyButton.placed(on: view)
    }

    private func buttonTapped() {
        let confirmViewController = CombackViewController()
        navigationController?.pushViewController(confirmViewController, animated: true)
//        navigationController?.setViewControllers([confirmViewController], animated: false)
    }

    func createUser(){
        let enterNunberViewController = EnterPhoneNumberViewController()
        navigationController?.pushViewController(enterNunberViewController, animated: true)
    }
}

// MARK: - Constraints

extension RegistrationViewController {
    private func setupConstraints() {
        commonConstraints.append(
            contentsOf: [
                startScreenImage.pinHeight(equalTo: view, multiplier: 0.3),
                startScreenImage.pinLeading(to: view.safeAreaLayoutGuide.leadingAnchor, inset: Constants.sideInset),
                startScreenImage.pinTrailing(to: view.safeAreaLayoutGuide.trailingAnchor, inset: Constants.sideInset),

                registerButton.pinHeight(equalTo: 56),
                registerButton.pinLeading(to: view.safeAreaLayoutGuide.leadingAnchor, inset: Constants.sideInset),
                registerButton.pinTrailing(to: view.safeAreaLayoutGuide.trailingAnchor, inset: Constants.sideInset),

                alreadyButton.pinHeight(equalTo: 44),
                alreadyButton.pinLeading(to: registerButton.leadingAnchor, inset: Constants.sideInset),
                alreadyButton.pinTrailing(to: registerButton.trailingAnchor, inset: Constants.sideInset)
            ]
        )

        landscapeConstraints.append(
            contentsOf: [
                startScreenImage.pinTop(to: view.safeAreaLayoutGuide.topAnchor, inset: 32),
                registerButton.pinTop(to: startScreenImage.bottomAnchor, inset: 24),
                alreadyButton.pinTop(to: registerButton.bottomAnchor, inset: 20)
            ]
        )

        portraitConstraints.append(
            contentsOf: [
                startScreenImage.pinTop(to: view.safeAreaLayoutGuide.topAnchor, inset: 100),
                registerButton.pinTop(to: startScreenImage.bottomAnchor, inset: 56),
                alreadyButton.pinTop(to: registerButton.bottomAnchor, inset: 56)
            ]
        )

        if Orientation.isLandscape {
            NSLayoutConstraint.activate(landscapeConstraints)
        } else {
            NSLayoutConstraint.activate(portraitConstraints)
        }
        NSLayoutConstraint.activate(commonConstraints)
    }
}

// MARK: - View Will Transition

extension RegistrationViewController {
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

// MARK: - SetThemeColorProtocol

extension RegistrationViewController: SetThemeColorProtocol {
    func setColor() {
        view.backgroundColor = .backgroundPrimary
        registerButton.setTitleColor(.contentColor, for: .normal)
        alreadyButton.tintColor = .textPrimary
    }
}
