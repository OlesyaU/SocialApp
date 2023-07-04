//
//  FeedCellViewModel.swift
//  SocialApp
//
//  Created by Олеся on 02.07.2023.
//

import UIKit

final class FeedCellViewModel {

    let testProfile: Profile
    let colorForContentHeaderCellView = AppColors.clear
    let fontForAuthorLabels = UIFont.titleBold
    let colorFontForAuthorNameLabel = AppColors.black
    let fontForDescriptionLabel = UIFont.textRegular
    let colorFontForDescriptionAndIcons = AppColors.gray
    let colorForIcons = AppColors.darkGray
    let colorForDotsImage = AppColors.orange
    let likesIconName =  IconsName.likes.nameIcon
    let commentsIconName =  IconsName.comments.nameIcon
    let dotsIconName = IconsName.dots.nameIcon
    let bookmarkIconName = IconsName.bookmark.nameIcon
    let isMyPost: Bool

    let author: Profile
    let profession: String
    let image: String
    let description: String
    let likes: Int
    let comments: Int
    var isSaved: Bool

    let nickname: String
    let burgerIcon = IconsName.burger.nameIcon
    let avatarImageString: String
    let professionLabelTitle: String
    let moreInfoButtonIcon = IconsName.moreInfo.nameIcon
    let postCell: Post

    let indexPath: IndexPath

    init(post: Post, indexPath: IndexPath) {
        author = post.author
        profession = post.author.profession
        image = post.image
        description = post.description
        likes = post.likes
        comments = post.comments.count
        isSaved = post.isSaved
        testProfile = DataBase.shared.testProfile
        nickname = post.author.nickname
        avatarImageString = post.image
        professionLabelTitle = post.author.profession
        isSaved = post.isSaved
        isMyPost = testProfile.posts.contains(post)
//        isMyPost = testProfile.nickname == post.author.nickname
        postCell = post
        self.indexPath = indexPath
    }
}
