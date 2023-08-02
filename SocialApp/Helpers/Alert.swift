//
//  Alert.swift
//  SocialApp
//
//  Created by Олеся on 21.07.2023.
//

import UIKit

final class Alert {

    class func showAlert(for viewController: UIViewController, with title: String, alertMessage: String, action1Title: String, handler: ((UIAlertAction) -> Void)?, action2Title: String?){
        let alert = UIAlertController(title: title.localized, message: alertMessage.localized, preferredStyle: .alert)
        let action = UIAlertAction(title: action1Title.localized, style: .destructive, handler: handler)
        if action2Title != nil {
            let action2 = UIAlertAction(title: action2Title?.localized, style: .cancel)
            alert.addAction(action2)
        }
        alert.addAction(action)
        viewController.present(alert, animated: true)
    }
}
