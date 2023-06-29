//
//  PersonalDataView.swift
//  SocialApp
//
//  Created by Олеся on 26.06.2023.
//

import UIKit

final class PersonalDataView: UIView {
    private enum Constants {
        static let sideInset: CGFloat = 16
        static let heightAvatar: CGFloat = 56
        static let editButtonHeight: CGFloat = 44
    }

    private lazy var nikNameLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.textColor = .black
//        label.text = "Nick name here"
        return label
    }()

    private lazy var avatarImage: UIImageView = {
        let image = UIImageView()
//        image.image = UIImage(named: "Avatar1")
        image.contentMode = .scaleAspectFill
        image.isUserInteractionEnabled = true
        image.cornerRadius(cornerRadius: 15)
        return image
    }()


    private lazy var burgerButton: UIButton = {
        let button = UIButton(primaryAction: UIAction { _ in
// open burger menu view
            print("burger Button Tapped")
        })

        button.tintColor = .systemOrange
//        button.applyIcon(systemName: "line.3.horizontal", tintColor: .systemOrange)
        return button
    }()

    private lazy var fullNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Full name label here"
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.textColor = .black
        return label
    }()

    private lazy var professionLabel: UILabel = {
        let label = UILabel()
        label.text = "profession  label text"
        label.textColor = .gray
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        return label
    }()

    private let moreInfoButton: UIButton = {
        let button = UIButton( primaryAction: UIAction {  _ in
//           action will be here
        })
        button.setTitle("Подробная информация", for: .normal)
        button.setTitleColor(.black, for: .normal)
//        button.applyIcon(systemName: "exclamationmark.circle.fill", tintColor: .systemOrange)
        return button
    }()

    private let editButton: UIButton = {
        let button = UIButton( primaryAction: UIAction {  _ in
//           action will be here
        })
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemOrange
        button.setTitle("Редактировать", for: .normal)
        button.cornerRadius(cornerRadius: 15)
        return button
    }()

    private var viewModel: PersonalDataViewModel?

    private var personalDataViewConstraints: [NSLayoutConstraint] = []

    init() {
        super.init(frame: .zero)
        layout()
}

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(with viewModel: PersonalDataViewModel) {
        self.viewModel = viewModel
        setupUI()
    }

    private func setupUI() {
        nikNameLabel.text = viewModel?.nickname
        burgerButton.applyIcon(systemName: viewModel?.burgerIcon ?? "", tintColor: .systemOrange)
        avatarImage.image = UIImage(named: viewModel?.avatarImageString ?? "")
        fullNameLabel.text = viewModel?.fullName
        professionLabel.text = viewModel?.professionLabelTitle
        moreInfoButton.setTitle(viewModel?.moreInfoButtonTitle, for: .normal)
        moreInfoButton.applyIcon(systemName: viewModel?.moreInfoButtonIcon ?? "", tintColor: .systemOrange)
        editButton.setTitle(viewModel?.editButtonTitle, for: .normal)
    }

    private func layout() {
        [nikNameLabel, fullNameLabel, avatarImage, moreInfoButton, burgerButton, professionLabel, editButton].forEach({
            $0.forAutolayout()
        })
        [nikNameLabel, fullNameLabel, avatarImage, moreInfoButton, burgerButton, professionLabel, editButton].forEach({
            addSubview($0)
        })

        personalDataViewConstraints.append(contentsOf: [
            nikNameLabel.pinTop(to: topAnchor),
            nikNameLabel.pinLeading(to: leadingAnchor, inset: Constants.sideInset),

            burgerButton.pinTop(to: topAnchor),
            burgerButton.pinHeight(equalTo: Constants.sideInset),
            burgerButton.pinWeight(equalTo: Constants.sideInset),
            burgerButton.pinTrailing(to: trailingAnchor, inset: Constants.sideInset),

            avatarImage.pinLeading(to: leadingAnchor, inset: Constants.sideInset),
            avatarImage.pinTop(to: nikNameLabel.bottomAnchor, inset: Constants.sideInset),
            avatarImage.pinHeight(equalTo: Constants.heightAvatar),
            avatarImage.pinWeight(equalTo: Constants.heightAvatar),

            fullNameLabel.pinTop(to: avatarImage.topAnchor),
            fullNameLabel.pinLeading(to: avatarImage.trailingAnchor, inset: Constants.sideInset),

            professionLabel.pinLeading(to: fullNameLabel.leadingAnchor),
            professionLabel.pinTop(to: fullNameLabel.bottomAnchor),

            moreInfoButton.pinTop(to: professionLabel.bottomAnchor),
            moreInfoButton.pinLeading(to: professionLabel.leadingAnchor),

            editButton.pinTop(to: avatarImage.bottomAnchor, inset: Constants.sideInset * 2),
            editButton.pinLeading(to: avatarImage.leadingAnchor),
            editButton.pinTrailing(to: burgerButton.trailingAnchor),
            editButton.pinHeight(equalTo: Constants.editButtonHeight)
 ])
        NSLayoutConstraint.activate(personalDataViewConstraints)
    }

}
