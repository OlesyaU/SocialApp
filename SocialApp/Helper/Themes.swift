//
//  Themes.swift
//  SocialApp
//
//  Created by Олеся on 14.06.2023.
//

import Foundation
import UIKit

protocol SetThemeColorProtocol {
    func setColor()
}




extension UIColor {
    private static func createColor(lightMode: UIColor, darkMode: UIColor) -> UIColor {
        guard #available(iOS 13.0, *) else {
            return lightMode
        }
        return UIColor { (traitCollection) -> UIColor in
            return traitCollection.userInterfaceStyle == .light ? lightMode : darkMode
        }
    }
}

extension UIColor {
    static let themeColor = UIColor.createColor(lightMode: .systemYellow, darkMode: .systemGreen)
    static let buttonColor = UIColor.createColor(lightMode: .systemBlue, darkMode: .blue)
    static let textColor = UIColor.createColor(lightMode: .black, darkMode: .white)
    static let labelColor = UIColor.createColor(lightMode: .clear, darkMode: .gray)

}
