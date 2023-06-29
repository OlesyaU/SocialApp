//
//  FeedTableViewController.swift
//  SocialApp
//
//  Created by Олеся on 19.06.2023.
//

import UIKit
import FloatingPanel

protocol FeedCellProtocol {
    func showMenuViewController()
}

class FeedTableViewController: UITableViewController {
    private var viewModel = FeedViewModel()

    private var floatingPanel: FloatingPanelController?
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(FeedCell.self, forCellReuseIdentifier: FeedCell.identifier)
        tableView.register(FirstFeedCell.self, forCellReuseIdentifier: FirstFeedCell.identifier)
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.posts.count + 1
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            guard let firstCell = tableView.dequeueReusableCell(withIdentifier: FirstFeedCell.identifier, for: indexPath) as? FirstFeedCell else { return UITableViewCell()}
            firstCell.configure(profiles: viewModel.profiles)
            return firstCell
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: FeedCell.identifier, for: indexPath) as? FeedCell  else {return UITableViewCell()}
            cell.delegate = self
            let post = viewModel.posts[indexPath.row - 1]
            cell.configureCell(post: post)
            return cell
        }
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }

//    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        UITableView.automaticDimension
//    }
}

extension FeedTableViewController: FeedCellProtocol {
    
    func showMenuViewController() {
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

}

extension FeedTableViewController: FloatingPanelControllerDelegate {}

