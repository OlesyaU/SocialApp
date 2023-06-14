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
        static let constraint: CGFloat = 16
    }

    private lazy var startScreenImage: UIImageView = {
        let image = UIImageView().forAutolayout()
        image.image = UIImage(named: "Welcome-PNG")
        image.placed(on: view)
        image.pinTop(to: view.safeAreaLayoutGuide.topAnchor, inset: 100)
        image.pinHeight(constant: 300)
        image.pinLeading(to: view, inset: Constants.constraint)
        image.pinTrailing(to: view, inset: Constants.constraint)
        image.contentMode = .scaleAspectFit
        return image
    }()

    private lazy var registerButton: UIButton = {
        let button = UIButton().forAutolayout()
        button.setTitle(Constants.registerButtonTitle, for: .normal)
        button.placed(on: view)
        button.pinHeight(constant: 50)
        button.pinTop(to: startScreenImage.bottomAnchor, inset: 100)
        button.pinLeading(to: view, inset: Constants.constraint)
        button.pinTrailing(to: view, inset: Constants.constraint)
        button.cornerRadius()
        return button
    }()

    private lazy var alreadyButton: UIButton = {
        let button = UIButton().forAutolayout()
        button.setTitle(Constants.alreadyButtonTitle, for: .normal)
        button.placed(on: view)
        button.pinHeight(constant: 50)
        button.pinTop(to: registerButton.bottomAnchor, inset: 20)
        button.pinLeading(to: view, inset: Constants.constraint)
        button.pinTrailing(to: view, inset: Constants.constraint)
        button.cornerRadius()
        button.addTarget(self, action: #selector(butTap(_ : )), for: .touchUpInside)
        return button
    }()

 override func viewDidLoad() {
        super.viewDidLoad()
//        setUp()
        setColor()

    }

    @objc private func butTap(_ sender: UIButton) {
        let confirmViewController = ConfirmViewController()
//        present(confirmViewController, animated: true)
        navigationController?.pushViewController(confirmViewController, animated: true)
        
    }

//    private func setUp(){
//
//    }


}

extension RegistrationViewController: SetThemeColorProtocol {
    func setColor() {
        view.backgroundColor = .themeColor
        registerButton.backgroundColor = .buttonColor
        alreadyButton.backgroundColor = .clear
    }
}
