//
//  FindMyPostsViewModel.swift
//  SocialApp
//
//  Created by Олеся on 29.06.2023.
//

import UIKit
struct FindMyPostsViewModel {
    let title = "Мои записи"
    let icon = "magnifyingglass"
    let titleForFriendProfile = "Посты TODO: - add name in correct form"
    let iconColor: UIColor = .black
    let titleColor = AppColors.orange
    let backgroundCellColor: UIColor = .backgroundPrimary
    let titleFont = UIFont.textRegular
}

struct AppColors {
  static  let orange: UIColor = .systemOrange
}
