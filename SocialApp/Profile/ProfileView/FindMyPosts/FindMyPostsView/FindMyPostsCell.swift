//
//  FindMyPostsCell.swift
//  SocialApp
//
//  Created by Олеся on 29.06.2023.
//

import UIKit

final class FindMyPostsCell: UITableViewCell {
    private var cellConstraints: [NSLayoutConstraint] = []
    private var viewModel: FindMyPostsViewModel?
    private let constraintCell: CGFloat = 16
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        
        return label
    }()
    
    private let magnifyingglass: UIImageView = {
        let image = UIImageView()
        image.contentMode = .center
        return image
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func layout() {
       titleLabel.forAutolayout()
    contentView.addSubview(titleLabel)
        titleLabel.textColor = viewModel?.titleColor
        titleLabel.font = viewModel?.titleFont
        cellConstraints.append(contentsOf: [
            titleLabel.pinTop(to: contentView.topAnchor, inset: constraintCell),
            titleLabel.pinLeading(to: contentView.leadingAnchor, inset: constraintCell),
            titleLabel.pinBottom(to: contentView.bottomAnchor, inset: constraintCell)
        ])
        NSLayoutConstraint.activate(cellConstraints)
    }
    
    func configure(viewModel: FindMyPostsViewModel) {
        magnifyingglass.forAutolayout()
        self.contentView.addSubview(magnifyingglass)
        titleLabel.text = viewModel.title
        magnifyingglass.image = UIImage(systemName: viewModel.icon)
        magnifyingglass.tintColor = viewModel.iconColor
        cellConstraints.append(contentsOf: [
            magnifyingglass.pinTop(to: contentView.topAnchor, inset: constraintCell),
            magnifyingglass.pinTrailing(to: contentView.trailingAnchor, inset: constraintCell),
            magnifyingglass.pinHeight(equalTo: 24),
            magnifyingglass.pinWeight(equalTo: 24),
            magnifyingglass.pinBottom(to: contentView.bottomAnchor, inset: constraintCell)
        ])
        NSLayoutConstraint.activate(cellConstraints)
    }

    func configureFriend(for friend: FindMyPostsViewModel) {
        titleLabel.text = friend.titleForFriendProfile

    }
}
