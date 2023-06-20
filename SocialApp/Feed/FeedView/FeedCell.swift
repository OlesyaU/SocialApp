//
//  FeedCell.swift
//  SocialApp
//
//  Created by Олеся on 19.06.2023.
//

import UIKit

class FeedCell: UITableViewCell {
    private enum Constants {
     static let sideInset: CGFloat = 16
     static let heightAvatar: CGFloat = 56
    }

    private lazy var image: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.backgroundColor = .backgroundPrimary
        image.isUserInteractionEnabled = false
        return image
    }()

    private lazy var authorPhoto: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.image = UIImage(named: "Ready")
        image.isUserInteractionEnabled = false
        image.cornerRadius(cornerRadius: image.frame.width / 2)
        return image
    }()

    private let authorLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.textColor = .black
        return label
    }()

    private let professionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.textColor = .gray
        return label
    }()


    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textColor = .systemGray
        return label
    }()

    private let likesLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.textColor = .black
        return label
    }()

    private lazy var likesIcon: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.image = UIImage(systemName: "heart")
        image.tintColor = .gray
        return image
    }()

    private let commentsLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.textColor = .black
        label.textAlignment = .left
        return label
    }()
    private lazy var commentsIcon: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.image = UIImage(systemName: "message")
        image.tintColor = .gray
        return image
    }()

    private lazy var dotsImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.tintColor = .systemOrange
        image.image = UIImage(named: "DotsVertical")
        image.isUserInteractionEnabled = true
        return image
    }()

    private lazy var bookmarkIcon: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.image = UIImage(systemName: "bookmark")
        image.tintColor = .darkGray
        return image
    }()

    private var landscapeConstraints: [NSLayoutConstraint] = []
    private var portraitConstraints: [NSLayoutConstraint] = []
    private var commonConstraints: [NSLayoutConstraint] = []

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .white
        layout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func layout() {
        [image,descriptionLabel,commentsLabel,likesLabel,authorLabel, professionLabel, authorPhoto, likesIcon,commentsIcon, dotsImage, bookmarkIcon].forEach {$0.forAutolayout()}
        [image,descriptionLabel,commentsLabel,likesLabel,authorLabel, professionLabel, authorPhoto, likesIcon, commentsIcon, dotsImage, bookmarkIcon].forEach {contentView.addSubview($0)}

            commonConstraints.append(
                contentsOf: [
                    authorPhoto.pinHeight(equalTo: Constants.heightAvatar),
                    authorPhoto.pinWeight(equalTo: Constants.heightAvatar),
                    authorPhoto.pinTop(to: contentView.topAnchor,inset: Constants.sideInset),
                    authorPhoto.pinLeading(to: contentView.leadingAnchor, inset:  Constants.sideInset),

                    authorLabel.pinTop(to: contentView.topAnchor, inset: Constants.sideInset),
                    authorLabel.pinHeight(equalTo: Constants.heightAvatar / 2),
                    authorLabel.pinLeading(to: authorPhoto.trailingAnchor, inset: Constants.sideInset),
                    authorLabel.pinTrailing(to: contentView.trailingAnchor),

                    professionLabel.pinTop(to: authorLabel.bottomAnchor, inset: 0),
                    professionLabel.pinLeading(to: authorLabel.leadingAnchor),
                    professionLabel.pinHeight(equalTo: Constants.heightAvatar / 2),
                    professionLabel.pinTrailing(to: dotsImage.leadingAnchor, inset: Constants.sideInset),

                    dotsImage.pinTop(to: authorPhoto.topAnchor),
                    dotsImage.pinBottom(to: authorPhoto.bottomAnchor),
                    dotsImage.pinWeight(equalTo: 20),
                    dotsImage.pinTrailing(to: contentView.trailingAnchor, inset: Constants.sideInset),

                    image.pinTop(to: descriptionLabel.bottomAnchor, inset: Constants.sideInset),
                    image.pinLeading(to: contentView.leadingAnchor),
                    image.pinTrailing(to: contentView.trailingAnchor),
                    image.pinHeight(equalTo: contentView.frame.width),

                    likesIcon.pinTop(to: image.bottomAnchor, inset: Constants.sideInset),
                    likesIcon.pinLeading(to: contentView.leadingAnchor, inset: Constants.sideInset),
                    likesIcon.pinHeight(equalTo: Constants.heightAvatar / 2),
                    likesIcon.pinWeight(equalTo: Constants.heightAvatar / 2),
                    likesIcon.pinBottom(to: contentView.bottomAnchor, inset: Constants.sideInset),


                    likesLabel.pinTop(to: image.bottomAnchor, inset: Constants.sideInset),
                    likesLabel.pinHeight(equalTo: Constants.heightAvatar / 2),
                    likesLabel.pinWeight(equalTo: Constants.heightAvatar / 2),
                    likesLabel.pinLeading(to: likesIcon.trailingAnchor, inset: Constants.sideInset / 2),
                    likesLabel.pinBottom(to: contentView.bottomAnchor, inset: Constants.sideInset),

                    commentsIcon.pinHeight(equalTo: Constants.heightAvatar / 2),
                    commentsIcon.pinWeight(equalTo: Constants.heightAvatar / 2),
                    commentsIcon.pinLeading(to: likesLabel.trailingAnchor, inset: Constants.sideInset),
                    commentsIcon.pinBottom(to: contentView.bottomAnchor, inset: Constants.sideInset),

                    commentsLabel.pinHeight(equalTo: Constants.heightAvatar / 2),
                    commentsLabel.pinWeight(equalTo: Constants.heightAvatar / 2),
                    commentsLabel.pinLeading(to: commentsIcon.trailingAnchor, inset: Constants.sideInset / 2),
                    commentsLabel.pinBottom(to: contentView.bottomAnchor, inset: Constants.sideInset),

                    descriptionLabel.pinTop(to: authorPhoto.bottomAnchor, inset: Constants.sideInset),
                    descriptionLabel.pinLeading(to: contentView.leadingAnchor),
                    descriptionLabel.pinTrailing(to: contentView.trailingAnchor),

                    bookmarkIcon.pinTop(to: image.bottomAnchor, inset: Constants.sideInset),
                    bookmarkIcon.pinHeight(equalTo: Constants.heightAvatar / 2),
                    bookmarkIcon.pinWeight(equalTo: Constants.heightAvatar / 2),
                    bookmarkIcon.pinTrailing(to: contentView.trailingAnchor, inset: Constants.sideInset),
                    bookmarkIcon.pinBottom(to: contentView.bottomAnchor, inset: Constants.sideInset)



//                    возможно правильней сделать разные ячейки для шапки поста , содержания и для футера поста





                ]
            )

            landscapeConstraints.append(
                contentsOf: [

                ]
            )

            portraitConstraints.append(
                contentsOf: [

                ]
            )

            if Orientation.isLandscape {
                NSLayoutConstraint.activate(landscapeConstraints)
            } else {
                NSLayoutConstraint.activate(portraitConstraints)
            }

            NSLayoutConstraint.activate(commonConstraints)
 }
    func configureCell(post: Post) {
        image.image = post.image
        authorLabel.text = post.author
        professionLabel.text = post.profession
        descriptionLabel.text = post.description
        likesLabel.text = String(post.likes)
        commentsLabel.text = String(post.comments)

    }




}
