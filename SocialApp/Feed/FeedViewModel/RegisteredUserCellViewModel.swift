//
//  RegisteredUserCellViewModel.swift
//  SocialApp
//
//  Created by Олеся on 26.07.2023.
//

import UIKit

protocol RegisteredUserCellDelegate: AnyObject {
    func onPickingLabelTapped()
    func onNewsLabelTapped()
}

final class RegisteredUserCellViewModel {

    private weak var delegate: RegisteredUserCellDelegate?
    let title = "Главная"
    let newsTitleLabel = "Новости"
    let pickingTitleLabel = "Для вас"
    let bellIcon = IconsName.bell.icon
    let boldFont = UIFont.textBold
    let itemsFont = UIFont.textRegular
    let itemsColor = AppColors.gray
    let chosenItemColor = AppColors.black
    let magnifyingglassIcon = IconsName.magnifyingglass.icon

    func onNewsLabelTapped() {
        delegate?.onNewsLabelTapped()
    }

    func onPickingLabelTapped() {
        delegate?.onPickingLabelTapped()
    }
}
