//
//  MainTabBarController.swift
//  SocialApp
//
//  Created by Олеся on 19.06.2023.
//

import UIKit

final class MainTabBarController: UITabBarController {

    private var mainTabBarViewModel:  MainTabBarViewModel

    init(mainTabBarViewModel: MainTabBarViewModel) {
        self.mainTabBarViewModel = mainTabBarViewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        UITabBar.appearance().backgroundColor = .backgroundPrimary
        viewControllers = [
            createFeedViewController(),
            createProfileViewController(),
            createSavedViewController()
        ]
        view.tintColor = mainTabBarViewModel.tintColorChosenItem
    }

    private func createFeedViewController() -> UINavigationController {
        let feedViewModel = FeedViewModel(isNewUser: mainTabBarViewModel.isNewUser)
        let feed = FeedTableViewController(viewModel: feedViewModel)

        feed.tabBarItem = UITabBarItem(title: mainTabBarViewModel.generalTitle, image:  mainTabBarViewModel.generalIcon, tag: 0)
        return UINavigationController(rootViewController: feed)
    }

    private func createProfileViewController() -> UINavigationController {
        let viewModel = ProfileViewModel(profile: DataBase.shared.testProfile)
        let profile = ProfileViewController(viewModel: viewModel)
        profile.tabBarItem = UITabBarItem(title: mainTabBarViewModel.profileTitle, image:  mainTabBarViewModel.profileIcon, tag: 1)
        return  UINavigationController(rootViewController: profile)
    }

    private func createSavedViewController() -> UINavigationController {
        let saved = SavedViewController()
        saved.title = mainTabBarViewModel.savedTitle
        saved.tabBarItem = UITabBarItem(title: mainTabBarViewModel.savedTitle, image:  mainTabBarViewModel.savedIcon, tag: 2)
        return UINavigationController(rootViewController: saved)
    }
}
