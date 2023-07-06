//
//  DetailedInformationHeaderView.swift
//  SocialApp
//
//  Created by Олеся on 06.07.2023.
//

import UIKit

final class DetailedInformationHeaderView: UIView {
    private var viewModel: DetailedInformationHeaderViewModel?
    private var viewConstraints: [NSLayoutConstraint] = []
    private enum Constants {
        static let inset: CGFloat = 16
        static let iconHeight: CGFloat = 24
    }

    private lazy var iconImage: UIImageView = {
        let image = UIImageView()
        image.isUserInteractionEnabled = true
        image.contentMode = .scaleAspectFill
        let tap = UITapGestureRecognizer(target: self, action: #selector(backTap))
        image.addGestureRecognizer(tap)
        return image
    }()

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        return label
    }()

    init() {
        super.init(frame: .zero)
        layout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func layout() {
        [iconImage, titleLabel].forEach({$0.forAutolayout()})
        [iconImage, titleLabel].forEach({addSubview($0)})
        viewConstraints.append(contentsOf: [

            iconImage.pinTop(to: safeAreaLayoutGuide.topAnchor, inset: Constants.inset),
            iconImage.pinHeight(equalTo: Constants.iconHeight),
            iconImage.pinWeight(equalTo: Constants.iconHeight),
            iconImage.pinLeading(to: safeAreaLayoutGuide.leadingAnchor),

            titleLabel.pinTop(to: iconImage.bottomAnchor),
            titleLabel.pinLeading(to: iconImage.leadingAnchor),
            titleLabel.pinBottom(to: bottomAnchor)
        ])
        NSLayoutConstraint.activate(viewConstraints)
    }
    
    func configure(viewModel: DetailedInformationHeaderViewModel) {
        self.viewModel = viewModel
        backgroundColor = viewModel.backgroundColor
        titleLabel.text = viewModel.profileFullName
        iconImage.image = viewModel.backIcon
    }

    @objc private func backTap() {
        viewModel?.backSelected()
    }
}
