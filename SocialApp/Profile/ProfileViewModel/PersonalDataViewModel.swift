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
    let moreInfoButtonTitle = "Подробная информация".localized
    let editButtonTitle = "Редактировать".localized
    let titleCallButton = "Позвонить".localized
    let titleMessagwButton = "Сообщение".localized
    let boldFont = UIFont.textBold
    let regularFont = UIFont.textRegular
    let black = AppColors.black
    let gray = AppColors.gray
    var isMyProfile: Bool

    weak var delegate: ProfileViewDelegate?

    init(profile: Profile){
        nickname = profile.nickname
        avatarImageString = profile.avatar
        fullName = profile.name + " " + profile.surname
        professionLabelTitle = profile.profession.localized
        isMyProfile = DataBase.shared.testProfile == profile
    }

    func burgerButtonSelected() {
        delegate?.pushDetailsController(type: .settings)
    }

    func editButtonSelected() {
        delegate?.pushDetailsController(type: .information)
    }

    func moreInfoButtonSelected() {
        if isMyProfile {
            delegate?.showRedactProfileModule()
        } else {
            delegate?.pushDetailsController(type: .information)
        }
    }
}

