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
    }

    private lazy var registerButton: UIButton = {
        let button = UIButton().forAutolayout()
        button.setTitle(Constants.registerButtonTitle, for: .normal)
        button.placed(on: view)
        button.pinHeight(constant: 50)
        button.pinTop(to: view.safeAreaLayoutGuide.topAnchor, inset: 100)
        button.pinLeading(to: view, inset: 16)
        button.pinTrailing(to: view, inset: 16)
        return button
    }()



    override func viewDidLoad() {
        super.viewDidLoad()
//        setUp()
        setColor()

    }

//    private func setUp(){
//
//    }


}

extension RegistrationViewController: SetThemeColorProtocol {
    func setColor() {
        view.backgroundColor = .themeColor
//        set colors for other ui elements here
        registerButton.backgroundColor = .buttonColor
    }
}
