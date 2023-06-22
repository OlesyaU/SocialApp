//
//  MenuViewController.swift
//  SocialApp
//
//  Created by Олеся on 22.06.2023.
//

import UIKit

class MenuViewController: UIViewController {

    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.register(MenuCell.self, forCellReuseIdentifier: MenuCell.identifier)
        tableView.forAutolayout()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.isMultipleTouchEnabled  = false
        return tableView
    }()

private let actionsName = ["Сохранить в закладках","Включить уведомления","Скопировать ссылку","Поделиться в ...","Отменить подписку","Пожаловаться"]

    private var constraintsForTableView: [NSLayoutConstraint] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        layout()
    }
    private func layout() {
        view.addSubview(tableView)

        constraintsForTableView.append(contentsOf: [
            tableView.pinTop(to: view.topAnchor, inset: 16),
            tableView.pinLeading(to: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.pinBottom(to: view.safeAreaLayoutGuide.bottomAnchor),
            tableView.pinTrailing(to: view.safeAreaLayoutGuide.trailingAnchor)

        ])
        NSLayoutConstraint.activate(constraintsForTableView)
    }


}

extension MenuViewController: UITableViewDataSource,UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return actionsName.count
    }


    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MenuCell.identifier, for: indexPath) as? MenuCell else { return UITableViewCell()}
        let action = actionsName[indexPath.row]
        cell.conigure(action: action)
       return cell
    }

}
