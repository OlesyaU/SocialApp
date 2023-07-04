//
//  PublicationViewModel.swift
//  SocialApp
//
//  Created by Олеся on 04.07.2023.
//

import UIKit
final class PublicationViewModel {
    let post: Post
    let comments: [Comment]
    let titleController = "Публикации"
    let titleForComment = "оставить комментарий"
    let arrowIcon = IconsName.leftArrow.nameIcon
    let dotsIconName = IconsName.dots.nameIcon
    let colorNickname = AppColors.orange
    let colorTitle = AppColors.black
    let fontTitle = UIFont.titleBold
    let iconForComment = IconsName.moreInfo.nameIcon
    let colorCommentCell = AppColors.biege
    let iconPaperclip = IconsName.paperclip.nameIcon

    init(post: Post, comments: [Comment]) {
        self.post = post
        self.comments = post.comments
    }
}
