//
//  ProfileDotsController.swift
//  SocialApp
//
//  Created by Олеся on 02.07.2023.
//

import UIKit

class ProfileDotsController: UITableViewController {
    private let viewModel = ProfileDotsControllerViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = viewModel.backgroundColor
        view.cornerRadius(cornerRadius: 15)

    }

    func layout(frame: CGRect) {
        let originX = frame.origin.x
        let originY = frame.origin.y
        let size = CGSize(width: 300, height: 300)
        tableView.frame = .init(origin: .init(x: originX, y: originY), size: size)
    }

    // MARK: - Table view data source

    func prepareForRemove() {
        tableView.removeFromSuperview()
        view.removeFromSuperview()
        willMove(toParent: nil)
        removeFromParent()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.profilePostDotsItems.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.subtitle, reuseIdentifier: "identifier")
        cell.textLabel?.text = viewModel.profilePostDotsItems[indexPath.row]
        cell.contentView.backgroundColor = viewModel.backgroundColor
        cell.textLabel?.textColor = viewModel.profilePostDotsItemsColor
        cell.textLabel?.font = viewModel.profilePostDotsItemsFont
        return cell
    }
}
