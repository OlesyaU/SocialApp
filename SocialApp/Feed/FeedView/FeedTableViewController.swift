//
//  FeedTableViewController.swift
//  SocialApp
//
//  Created by Олеся on 19.06.2023.
//

import UIKit

class FeedTableViewController: UITableViewController {
    private var viewModel = FeedViewModel()

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
            let post = viewModel.posts[indexPath.row - 1]
            cell.configureCell(post: post)
            return cell
        }
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
}
