//
//  FeedTableViewController.swift
//  SocialApp
//
//  Created by Олеся on 19.06.2023.
//

import UIKit
import FloatingPanel

final class FeedTableViewController: UITableViewController {
    private var viewModel: FeedViewModel
    private var publicationViewModel: PublicationViewModel?
    private var floatingPanel: FloatingPanelController?
    private let coreDataManager = CoreDataManager.shared
    var delegate: PublicationControllerProtocol?

    init(viewModel: FeedViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(RegisteredUserCell.self, forCellReuseIdentifier: RegisteredUserCell.identifier)
        tableView.register(FeedCell.self, forCellReuseIdentifier: FeedCell.identifier)
        tableView.register(FirstFeedCell.self, forCellReuseIdentifier: FirstFeedCell.identifier)
    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return  3
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        switch section {
            case 0:
                return   viewModel.isNewUser ? 0 : 1
            case 1:
                return 1
            default:
                return   viewModel.posts.count  + 1
        }
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
            case 0:
                if viewModel.isNewUser {
                    fallthrough
                }
                let cell = RegisteredUserCell()
                return cell
            case 1:
                guard let firstCell = tableView.dequeueReusableCell(withIdentifier: FirstFeedCell.identifier, for: indexPath) as? FirstFeedCell else { return UITableViewCell()}
                firstCell.configure(profiles: viewModel.profiles)
                return firstCell
            default:
                guard let cell = tableView.dequeueReusableCell(withIdentifier: FeedCell.identifier, for: indexPath) as? FeedCell  else {return UITableViewCell()}
                let post = viewModel.posts[indexPath.row]
                let viewModel = FeedCellViewModel(
                    post: post,
                    indexPath: indexPath,
                    isNeedToShowDotsView: true,
                    isFromFeed: true,
                    delegate: self
                )
                cell.configure(with: viewModel)
                publicationViewModel = PublicationViewModel(post: post)
                return cell
        }
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension FeedTableViewController: FeedCellDelegate {
    func dotsImageTapped(post: Post, indexPath: IndexPath, isMyPost: Bool) {
        let menuViewController = MenuViewController()

        let floatingPanelController = FloatingPanelController()
        floatingPanelController.delegate = self
        floatingPanelController.surfaceView.layer.cornerRadius = 12
        floatingPanelController.surfaceView.clipsToBounds = true
        floatingPanelController.set(contentViewController: menuViewController)

        floatingPanelController.isRemovalInteractionEnabled = true
        present(floatingPanelController, animated: true)
        floatingPanel = floatingPanelController
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = false
    }

    func postImageTapped(post:Post) {
        let publicationVC = PublicationViewController()
        publicationVC.configure(post: post)
        navigationController?.pushViewController(publicationVC, animated: true)
    }

    func headerTapped(with postAuthor: Profile) {
        let viewModel = ProfileViewModel(profile: postAuthor)
        let profileVC = ProfileViewController(viewModel: viewModel)
        profileVC.configure(profile: postAuthor)
        navigationController?.pushViewController(profileVC, animated: false)
    }
    func bookmarkTapped(post: Post?) {
        coreDataManager.addFavoritePost(post: post, completion: {
        })
    }
}

extension FeedTableViewController: FloatingPanelControllerDelegate {}
