//
//  ProfileDotsControllerViewModel.swift
//  SocialApp
//
//  Created by Олеся on 02.07.2023.
//

import UIKit
final class ProfileDotsControllerViewModel {
    let profilePostDotsItems = ["Сохранить в закладках","Закрепить","Выключить комментарии","Скопировать ссылку","Архивировать запись","Удалить"].map({$0.localized})
    let profilePostDotsItemsFont = UIFont.textBold
    let profilePostDotsItemsColor = AppColors.black
    let backgroundColor: UIColor = AppColors.biege
}
