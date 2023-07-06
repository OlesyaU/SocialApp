//
//  PublicationViewModel.swift
//  SocialApp
//
//  Created by Олеся on 04.07.2023.
//

import UIKit
final class PublicationViewModel {
    var post: Post
    let titleController = "Публикации"
    let titleForComment = "оставить комментарий"
    let arrowIcon = IconsName.leftArrow.nameIcon
    let dotsIconName = IconsName.dots.nameIcon
    let colorNickname = AppColors.orange
    let colorTitle = AppColors.black
    let fontTitle = UIFont.textBold
    let iconForComment = IconsName.moreInfo.nameIcon
    let colorCommentCell = AppColors.biege
    let iconPaperclip = IconsName.paperclip.nameIcon
    let colorCellbackgroundColor = AppColors.biege

    init(post: Post) {
        self.post = post
    }
}
