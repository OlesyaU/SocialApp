//
//  PersonalDataView.swift
//  SocialApp
//
//  Created by Олеся on 26.06.2023.
//

import UIKit

final class PersonalDataView: UIView {

    private var viewModel: PersonalDataViewModel?

    private var personalDataViewConstraints: [NSLayoutConstraint] = []

    private lazy var nikNameLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        return label
    }()

    private lazy var avatarImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.isUserInteractionEnabled = true
        image.cornerRadius(cornerRadius: 15)
        return image
    }()

    private lazy var burgerButton: UIButton = {
        let button = UIButton(primaryAction: UIAction { [weak self] _ in
// open burger menu view
            print("burger Button Tapped")
            self?.viewModel?.burgerButtonSelected()
        })

        button.tintColor = .systemOrange
        return button
    }()

    private lazy var fullNameLabel: UILabel = {
        let label = UILabel()
        return label
    }()

    private lazy var professionLabel: UILabel = {
        let label = UILabel()
        return label
    }()

    private lazy var moreInfoButton: UIButton = {
        let button = UIButton( primaryAction: UIAction { [weak self] _ in
            self?.viewModel?.moreInfoButtonSelected()
        })
        button.setTitleColor(.black, for: .normal)
        return button
    }()

    private lazy var editButton: UIButton = {
        let button = UIButton(primaryAction: UIAction { [weak self] _ in
            self?.viewModel?.editButtonSelected()
        })
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemOrange
        button.cornerRadius(cornerRadius: 15)
        return button
    }()

    private lazy var messageButton: UIButton = {
        let button = UIButton(
            primaryAction: UIAction { [unowned self] _ in
//           action    write message to user
            }
        ).forAutolayout()

        button.setBackgroundImage(.buttonBackgroundImageNormal, for: .normal)
        button.setBackgroundImage(.buttonBackgroundImageSelected, for: .highlighted)
        button.setBackgroundImage(.buttonBackgroundImageSelected, for: .disabled)
        button.cornerRadius()
        return button
    }()
    private lazy var callButton: UIButton = {
        let button = UIButton(
            primaryAction: UIAction { [unowned self] _ in
//            action     call to user
            }
        ).forAutolayout()

        button.setBackgroundImage(.buttonBackgroundImageNormal, for: .normal)
        button.setBackgroundImage(.buttonBackgroundImageSelected, for: .highlighted)
        button.setBackgroundImage(.buttonBackgroundImageSelected, for: .disabled)
        button.cornerRadius()
        return button
    }()


    init() {
        super.init(frame: .zero)
        setupConstraints()
}

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(with viewModel: PersonalDataViewModel) {
        self.viewModel = viewModel
        if viewModel.isMyProfile {
            configureMyProfile()
        } else {
            configureFriendProfile()
        }
        setupUI()
    }

    func configureMyProfile() {
        [editButton, burgerButton].forEach({$0.forAutolayout()})
        [editButton, burgerButton].forEach({addSubview($0)})
        editButton.setTitle(viewModel?.editButtonTitle, for: .normal)
        personalDataViewConstraints.append(contentsOf: [
            burgerButton.pinTop(to: topAnchor),
            burgerButton.pinHeight(equalTo: Constants.inset16),
            burgerButton.pinWidth(equalTo: Constants.inset16),
            burgerButton.pinTrailing(to: trailingAnchor, inset: Constants.inset16),
            editButton.pinTop(to: avatarImage.bottomAnchor, inset: Constants.inset16 * 2),
            editButton.pinLeading(to: avatarImage.leadingAnchor),
            editButton.pinTrailing(to: burgerButton.trailingAnchor),
            editButton.pinHeight(equalTo: Constants.inset44)

        ])
               NSLayoutConstraint.activate(personalDataViewConstraints)
    }
    func configureFriendProfile() {
        [messageButton, callButton].forEach({$0.forAutolayout()})
        [messageButton, callButton].forEach({addSubview($0)})
        messageButton.setTitle(viewModel?.titleMessagwButton, for: .normal)
        callButton.setTitle(viewModel?.titleCallButton, for: .normal)
        callButton.isSelected = false
        personalDataViewConstraints.append(contentsOf: [
            callButton.pinTop(to: moreInfoButton.bottomAnchor, inset: Constants.inset16),
            callButton.pinTop(to: avatarImage.bottomAnchor, inset: Constants.inset16 * 2),
            callButton.pinWidth(equalTo: UIScreen.main.bounds.width / 3),


            callButton.pinTrailing(to: trailingAnchor, inset: Constants.inset16),
            callButton.pinHeight(equalTo: Constants.inset44),
            callButton.pinBottom(to: bottomAnchor, inset: Constants.inset16),


            messageButton.pinLeading(to: avatarImage.leadingAnchor),
            messageButton.pinHeight(equalTo: Constants.inset44),
messageButton.pinTop(to: moreInfoButton.bottomAnchor, inset: Constants.inset16),
           messageButton.pinWidth(equalTo: UIScreen.main.bounds.width / 3),
        ])
               NSLayoutConstraint.activate(personalDataViewConstraints)
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
        [nikNameLabel, professionLabel].forEach({$0.font = viewModel?.regularFont})
        fullNameLabel.font = viewModel?.boldFont
        [nikNameLabel, fullNameLabel].forEach({$0.textColor = viewModel?.black})
        professionLabel.textColor = viewModel?.gray
    }

    private func setupConstraints() {
        [nikNameLabel, fullNameLabel, avatarImage,  professionLabel, moreInfoButton].forEach({
            $0.forAutolayout()
        })
        [nikNameLabel, fullNameLabel, avatarImage,  professionLabel, moreInfoButton].forEach({
            addSubview($0)
        })

        personalDataViewConstraints.append(contentsOf: [
            nikNameLabel.pinTop(to: topAnchor),
            nikNameLabel.pinLeading(to: leadingAnchor, inset: Constants.inset16),

            avatarImage.pinLeading(to: leadingAnchor, inset: Constants.inset16),
            avatarImage.pinTop(to: nikNameLabel.bottomAnchor, inset: Constants.inset16),
            avatarImage.pinHeight(equalTo: Constants.inset56),
            avatarImage.pinWidth(equalTo: Constants.inset56),

            fullNameLabel.pinTop(to: avatarImage.topAnchor),
            fullNameLabel.pinLeading(to: avatarImage.trailingAnchor, inset: Constants.inset16),

            professionLabel.pinLeading(to: fullNameLabel.leadingAnchor),
            professionLabel.pinTop(to: fullNameLabel.bottomAnchor),

            moreInfoButton.pinTop(to: professionLabel.bottomAnchor),
            moreInfoButton.pinLeading(to: professionLabel.leadingAnchor),
        ])
        NSLayoutConstraint.activate(personalDataViewConstraints)
    }

}
