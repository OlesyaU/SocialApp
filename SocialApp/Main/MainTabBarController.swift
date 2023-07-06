//
//  MainTabBarController.swift
//  SocialApp
//
//  Created by Олеся on 19.06.2023.
//

import UIKit

class MainTabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        UITabBar.appearance().backgroundColor = .backgroundPrimary
        viewControllers = [
            createFeedViewController(),
            createProfileViewController(),
            createSavedViewController()
        ]
    }

    func createFeedViewController() -> UINavigationController {
        let feed = FeedTableViewController()
        feed.title = "Главная"
        feed.tabBarItem = UITabBarItem(title: "Главная", image: UIImage(systemName: "house.circle"), tag: 0)
        return UINavigationController(rootViewController: feed)
    }

    func createProfileViewController() -> UINavigationController {
        let viewModel = ProfileViewModel(profile: DataBase.shared.testProfile)
        let profile = ProfileViewController(viewModel: viewModel)
        profile.tabBarItem = UITabBarItem(title: "Профиль", image: UIImage(systemName: "person.circle"), tag: 1)
        let navigation = UINavigationController(rootViewController: profile)
        navigation.setNavigationBarHidden(true, animated: true)
        return  navigation
    }
    
    func createSavedViewController() -> UINavigationController {
        let saved = SavedViewController()
        saved.title = "Coxpaнённые"
        saved.tabBarItem = UITabBarItem(title: "Coxpaнённые", image: UIImage(systemName: "square.and.arrow.down"), tag: 2)
        return UINavigationController(rootViewController: saved)
    }
}
