//
//  PersonalDataViewModel.swift
//  SocialApp
//
//  Created by Олеся on 28.06.2023.
//

import UIKit
class PersonalDataViewModel {
    let nickname: String
    let burgerIcon = IconsName.burger.nameIcon
    let avatarImageString: String
    let fullName: String
    let professionLabelTitle: String
    let moreInfoButtonIcon = IconsName.moreInfo.nameIcon
    let moreInfoButtonTitle = "Подробная информация"
    let editButtonTitle = "Редактировать"
    let titleCallButton = "Позвонить"
    let titleMessagwButton = "Сообщение"
    var isMyProfile: Bool
    var onBurgerButtonSelected: (() -> Void)?

    init(profile: Profile){
        nickname = profile.nickname
        avatarImageString = profile.avatar
        fullName = profile.name + " " + profile.surname
        professionLabelTitle = profile.profession
        isMyProfile = DataBase.shared.testProfile == profile
    }

    func burgerButtonSelected() {
        onBurgerButtonSelected?()
    }
}

