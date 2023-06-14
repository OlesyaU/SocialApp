//
//  ViewController.swift
//  SocialApp
//
//  Created by Олеся on 14.06.2023.
//

import UIKit

class RegistrationViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .cyan
        setColor()
    }


}

extension RegistrationViewController: SetThemeColorProtocol {
    func setColor() {
        view.backgroundColor = .themeColor
//        set colors for other ui elements here
    }
}
