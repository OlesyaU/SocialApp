//
//  RegisteredUserCell.swift
//  SocialApp
//
//  Created by Олеся on 26.07.2023.
//

import UIKit

class RegisteredUserCell: UITableViewCell {

    private var viewModel: RegisteredUserCellViewModel?
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.textRegular
        label.numberOfLines = 1
        return label
    }()

    private lazy var magnifyingglassIcon: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.clipsToBounds = true
        image.image = IconsName.magnifyingglass.icon
        return image
    }()

    private lazy var bellIcon: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.image = IconsName.bell.icon
        return image
    }()

    private lazy var newsLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        let tapToLabel = UITapGestureRecognizer(target: self, action: #selector(onNewsLabelTapped))
        label.addGestureRecognizer(tapToLabel)
        return label
    }()

    private lazy var pickingLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        let tapToLabel = UITapGestureRecognizer(target: self, action: #selector(onPickingLabelTapped))
        label.addGestureRecognizer(tapToLabel)
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.viewModel = RegisteredUserCellViewModel()
        setupConstraints()
        configure()
    }

    private var cellConstraints: [NSLayoutConstraint] = []
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure(){
        bellIcon.image = viewModel?.bellIcon
        magnifyingglassIcon.image = viewModel?.magnifyingglassIcon
        titleLabel.text = viewModel?.title
        titleLabel.font = viewModel?.boldFont
        newsLabel.text = viewModel?.newsTitleLabel
        pickingLabel.text = viewModel?.pickingTitleLabel
        newsLabel.textColor = viewModel?.chosenItemColor
        pickingLabel.textColor = viewModel?.itemsColor
        [newsLabel, pickingLabel].forEach{$0.font = viewModel?.itemsFont
        }
    }

    private func setupConstraints() {
        [titleLabel, magnifyingglassIcon, bellIcon, newsLabel, pickingLabel]
            .forEach {$0.forAutolayout()
                $0.placed(on: contentView)
            }

        cellConstraints.append(
            contentsOf: [
                titleLabel.pinTop(to: contentView.topAnchor, inset: Constants.inset16),
                titleLabel.pinLeading(to: contentView.leadingAnchor, inset: Constants.inset16),

                bellIcon.pinTrailing(to: contentView.trailingAnchor, inset: Constants.inset16),
                bellIcon.pinTop(to: contentView.topAnchor, inset: Constants.inset16),
                bellIcon.pinHeight(equalTo: Constants.iconHeight24),
                bellIcon.pinWidth(equalTo: Constants.iconHeight24),

                magnifyingglassIcon.pinTop(to: bellIcon.topAnchor),
                magnifyingglassIcon.pinTrailing(to: bellIcon.leadingAnchor, inset: Constants.inset16),
                magnifyingglassIcon.pinHeight(equalTo: Constants.iconHeight24),
                magnifyingglassIcon.pinWidth(equalTo: Constants.iconHeight24),


                newsLabel.pinTop(to: titleLabel.bottomAnchor, inset: Constants.iconHeight24),
                newsLabel.pinLeading(to: titleLabel.leadingAnchor),
                newsLabel.pinBottom(to: contentView.bottomAnchor),

                pickingLabel.pinLeading(to: newsLabel.trailingAnchor, inset: Constants.inset16),
                pickingLabel.pinBottom(to: contentView.bottomAnchor),
                pickingLabel.pinTop(to: titleLabel.bottomAnchor, inset: Constants.iconHeight24),
            ]
        )
        NSLayoutConstraint.activate(cellConstraints)
    }

    @objc func onNewsLabelTapped() {
        viewModel?.onNewsLabelTapped()
    }

    @objc func onPickingLabelTapped() {
        viewModel?.onPickingLabelTapped()
    }
}
