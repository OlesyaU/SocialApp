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
    
    private lazy var startScreenImage: UIImageView = {
        let image = UIImageView().forAutolayout()
        image.placed(on: view)
        image.image = UIImage(named: "WelcomeLogo")
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    private lazy var registerButton: UIButton = {
        let button = UIButton().forAutolayout()
        button.setTitle(Constants.registerButtonTitle, for: .normal)
        button.setBackgroundImage(.buttonBackgroundImageNormal, for: .normal)
        button.setBackgroundImage(.buttonBackgroundImageSelected, for: .highlighted)
        button.setBackgroundImage(.buttonBackgroundImageSelected, for: .disabled)
        button.placed(on: view)
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
        button.placed(on: view)
        button.cornerRadius()
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpLayout()
        setColor()
    }
    
    private func buttonTapped() {
        let confirmViewController = ConfirmViewController()
        navigationController?.pushViewController(confirmViewController, animated: true)
        navigationController?.setViewControllers([confirmViewController], animated: false)
    }
}

extension RegistrationViewController: SetThemeColorProtocol {
    func setColor() {
        view.backgroundColor = .backgroundPrimary
        registerButton.setTitleColor(.contentColor, for: .normal)
        alreadyButton.tintColor = .textPrimary
    }
    
    private func setUpLayout() {
        startScreenImage.pinTop(to: view.safeAreaLayoutGuide.topAnchor, inset: 100)
        startScreenImage.pinHeight(constant: 300)
        startScreenImage.pinLeading(to: view, inset: Constants.sideInset)
        startScreenImage.pinTrailing(to: view, inset: Constants.sideInset)
        registerButton.pinHeight(constant: 50)
        registerButton.pinTop(to: startScreenImage.bottomAnchor, inset: 100)
        registerButton.pinLeading(to: view, inset: Constants.sideInset)
        registerButton.pinTrailing(to: view, inset: Constants.sideInset)
        alreadyButton.pinHeight(constant: 50)
        alreadyButton.pinTop(to: registerButton.bottomAnchor, inset: 20)
        alreadyButton.pinLeading(to: view, inset: Constants.sideInset)
        alreadyButton.pinTrailing(to: view, inset: Constants.sideInset)
    }
}
