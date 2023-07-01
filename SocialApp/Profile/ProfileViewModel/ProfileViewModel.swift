//
//  ProfileViewModel.swift
//  SocialApp
//
//  Created by Олеся on 26.06.2023.
//

import UIKit
final class ProfileViewModel {
    var testProfile: Profile
    let posts: [Post]
    let findViewModel: FindMyPostsViewModel
    let photosCellViewModel: PhotosCellViewModel
    var personalData: PersonalDataViewModel

    let leftArrowIconString = IconsName.leftArrow.nameIcon
    let titleFrienCell = "Мои записи"
    let dotsIcon = IconsName.dots.nameIcon
    let iconsColor = AppColors.orange
    let titleColor: UIColor = .black
    let backgroundCellColor: UIColor = .backgroundPrimary
    let titleFont = UIFont.textRegular


    lazy var actionsViewModels: [ProfileActionViewModel] = [
        .init(
            isSelected: true,
            type: .publications(count: testProfile.posts.count),
            onModelSelected:  { [weak self] in
                self?.modelSelected(at: 0)
            }),
        .init(isSelected: false, type: .subscribers(count: testProfile.subscribersCount), onModelSelected: { [weak self] in
            self?.modelSelected(at: 1)
        }),
        .init(isSelected: false, type: .subscriptions(count: testProfile.subscriptionsCount), onModelSelected:  { [weak self] in
            self?.modelSelected(at: 2)
        })
    ]

    let buttonViewModels: [ProfileIconButtonViewModel] = [
        .init(type: .write, action: {
            print("write")
        }),
        .init(type: .history, action: {
            print("history")
        }),
        .init(type: .photo, action: {
            print("photo")
        })
    ]

    init(profile: Profile) {
        testProfile = profile
        posts = profile.posts
        photosCellViewModel = PhotosCellViewModel(profile: profile)
        findViewModel = FindMyPostsViewModel()
        personalData = PersonalDataViewModel(profile: profile)
       
    }

    init() {
        testProfile = DataBase.shared.testProfile
        posts = DataBase.shared.getPosts()
        photosCellViewModel = PhotosCellViewModel(profile: testProfile)
        findViewModel = FindMyPostsViewModel()
        personalData = PersonalDataViewModel(profile: testProfile)


    }

    private func modelSelected(at selectedIndex: Int) {
        for index in 0...actionsViewModels.count - 1 {
            actionsViewModels[index].isSelected = false
        }
        actionsViewModels[selectedIndex].isSelected = true
    }






    private func createItems() {

    }
}
