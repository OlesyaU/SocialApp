//
//  ProfileActionsCell.swift
//  SocialApp
//
//  Created by Олеся on 27.06.2023.
//

import UIKit

class ProfileActionsCell: UITableViewCell {
    private let actionsStackView = ProfileActionStackView()
    private var cellConstraint: [NSLayoutConstraint] = []

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        actionsStackView.arrangedSubviews.forEach { actionsStackView.removeArrangedSubview($0)}
    }

    func configure(viewModels: [ProfileActionViewModel]) {
        actionsStackView.arrangedSubviews.forEach { actionsStackView.removeArrangedSubview($0) }
        actionsStackView.configure(buttonViewModels: viewModels)
    }
    private func setupUI() {
        actionsStackView.placed(on: contentView)
        cellConstraint.append(contentsOf: [
            actionsStackView.pinTop(to: contentView.topAnchor),
            actionsStackView.pinBottom(to: contentView.bottomAnchor),
            actionsStackView.pinLeading(to: contentView.leadingAnchor),
            actionsStackView.pinTrailing(to: contentView.trailingAnchor),
        ])
        NSLayoutConstraint.activate(cellConstraint)
    }
}
