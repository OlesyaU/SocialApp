//
//  FontExtension.swift
//  SocialApp
//
//  Created by Олеся on 29.06.2023.
//

import UIKit
extension UIFont {
    static let titleBold = UIFont(name: "AvenirNextCondensed-Bold", size: 18)
    static let textRegular = UIFont(name: "AvenirNextCondensed-Regular", size: 16)
   
}

enum IconsName {
    case dots
    case leftArrow
    case rightArrow
    case burger
    case moreInfo
    case likes
    case comments
    case bookmark


   var nameIcon: String {
        switch self {
            case .dots:
           return  "DotsVertical"
            case .leftArrow:
             return   "arrow.left"
            case .rightArrow:
              return  "chevron.right"
            case .burger:
              return  "line.3.horizontal"
            case .moreInfo:
              return  "exclamationmark.circle.fill"
            case .likes:
                return "heart"
            case .comments:
                return "message"
            case .bookmark:
                return "bookmark"
        }
    }
}


extension UIBarButtonItem {

    static func menuButton(_ target: Any?, action: Selector, imageName: String, tintColor: UIColor) -> UIBarButtonItem {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: imageName), for: .normal)
        button.addTarget(target, action: action, for: .touchUpInside)
        button.tintColor = tintColor
        let menuBarItem = UIBarButtonItem(customView: button)
        menuBarItem.customView?.translatesAutoresizingMaskIntoConstraints = false
        menuBarItem.customView?.heightAnchor.constraint(equalToConstant: 24).isActive = true
        menuBarItem.customView?.widthAnchor.constraint(equalToConstant: 24).isActive = true

        return menuBarItem
    }
}