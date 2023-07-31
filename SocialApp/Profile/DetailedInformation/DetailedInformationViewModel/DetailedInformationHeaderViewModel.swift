//
//  DetailedInformationHeaderViewModel.swift
//  SocialApp
//
//  Created by Олеся on 07.07.2023.
//

import UIKit

protocol DetailedInformationHeaderViewModelDelegate: AnyObject {
    func pop()
}

final class DetailedInformationHeaderViewModel {
    private let type: DetailedInformationViewType

    private var backIconImage: UIImage? {
        switch type {
            case .information:
                return IconsName.close.icon
            case .settings:
                return IconsName.leftArrow.icon
        }
    }
    weak var delegate: DetailedInformationHeaderViewModelDelegate?

    let profileFullName: String
    let backgroundColor = AppColors.biege
    let titleFont = UIFont.textBold
    var backIcon: UIImage? {
        backIconImage?.imageWithColor(color: AppColors.orange)
    }

    init(
        name: String,
        surname: String,
        type: DetailedInformationViewType
    ) {
        profileFullName = name + " " + surname
        self.type = type
    }

    func backSelected() {
        delegate?.pop()
    }
}
