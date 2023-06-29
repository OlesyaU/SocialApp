//
//  PersonalDataViewModel.swift
//  SocialApp
//
//  Created by Олеся on 28.06.2023.
//

import UIKit
 class PersonalDataViewModel {
     let nickname: String
     let burgerIcon = "line.3.horizontal"
     let avatarImageString: String
     let fullName: String
     let professionLabelTitle: String
     let moreInfoButtonIcon = "exclamationmark.circle.fill"
     let moreInfoButtonTitle = "Подробная информация"
     let editButtonTitle = "Редактировать"

     init(profile: Profile){
         nickname = profile.nickname
         avatarImageString = profile.avatar
         fullName = profile.name + " " + profile.surname
         professionLabelTitle = profile.profession
     }
}
