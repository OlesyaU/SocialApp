//
//  MainTabBarViewModel.swift
//  SocialApp
//
//  Created by Олеся on 07.07.2023.
//

import UIKit
final class  MainTabBarViewModel {
    let tintColorChosenItem = AppColors.orange
    let generalTitle =  Title.general.titleString
    let profileTitle = Title.profile.titleString
    let savedTitle = Title.saved.titleString
    let generalIcon = IconsName.house.icon
    let profileIcon = IconsName.person.icon
    let savedIcon = IconsName.likes.icon
    var isNewUser: Bool
    
    init(isNewUser: Bool) {
        self.isNewUser = isNewUser
    }

    enum Title {
        case general
        case profile
        case saved

        var titleString: String {
            switch self {
                case .general:
                return "Главная"
                case .profile:
                return "Профиль"
                case .saved:
                return "Сохранённые"
            }
        }
    }
}
