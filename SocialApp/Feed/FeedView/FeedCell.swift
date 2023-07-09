//
//  FeedCell.swift
//  SocialApp
//
//  Created by Олеся on 19.06.2023.
//

import UIKit


final class FeedCell: UITableViewCell {
    private enum Constants {
        static let sideInset: CGFloat = 16
        static let heightAvatar: CGFloat = 56
    }
    private var viewModel: FeedCellViewModel?
    var delegate: FeedCellProtocol?
    var profileControllerDelegate: ProfileViewDelegate?
    var publicationDelegate: PublicationControllerProtocol?

    private lazy var contentHeaderCellView: UIView = {
        let image = UIView()
        image.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(openProfileGestureAction))
        image.addGestureRecognizer(tapGesture)
        return image
    }()
    private lazy var image: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.isUserInteractionEnabled = true
        let tapToImage = UITapGestureRecognizer(target: self, action: #selector(openCurrentPost))
        image.addGestureRecognizer(tapToImage)
        return image
    }()

    private lazy var authorPhoto: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.isUserInteractionEnabled = false
        image.cornerRadius(cornerRadius: Constants.sideInset)
        image.clipsToBounds = true
        return image
    }()

    private let authorNameLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        return label
    }()

    private let professionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        return label
    }()

    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        let tapToImage = UITapGestureRecognizer(target: self, action: #selector(openCurrentPost))
        label.addGestureRecognizer(tapToImage)
        return label
    }()

    private let likesLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        return label
    }()

    private lazy var likesIcon: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        return image
    }()

    private let commentsLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.textAlignment = .left
        return label
    }()

    private lazy var commentsIcon: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        return image
    }()

    lazy var dotsImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.isUserInteractionEnabled = true
        let gesture = UITapGestureRecognizer(target: self, action: #selector(tapDotsAction))
        image.addGestureRecognizer(gesture)
        return image
    }()

    private lazy var bookmarkIcon: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        return image
    }()

    private var commonConstraints: [NSLayoutConstraint] = []

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        layout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func layout() {
        [contentHeaderCellView, authorPhoto,authorNameLabel, professionLabel, image, descriptionLabel, commentsLabel, likesLabel,   likesIcon, commentsIcon, dotsImage, bookmarkIcon].forEach {$0.forAutolayout()}
        [contentHeaderCellView, image, descriptionLabel, commentsLabel, likesLabel, authorNameLabel, professionLabel, authorPhoto, likesIcon, commentsIcon, dotsImage, bookmarkIcon].forEach {contentView.addSubview($0)}

        commonConstraints.append(
            contentsOf: [
                contentHeaderCellView.pinTop(to: contentView.topAnchor),
                contentHeaderCellView.pinLeading(to: contentView.leadingAnchor),
                contentHeaderCellView.pinTrailing(to: contentView.trailingAnchor),
                contentHeaderCellView.pinBottom(to: descriptionLabel.topAnchor),

                authorPhoto.pinHeight(equalTo: Constants.heightAvatar),
                authorPhoto.pinWidth(equalTo: Constants.heightAvatar),
                authorPhoto.pinTop(to: contentView.topAnchor,inset: Constants.sideInset),
                authorPhoto.pinLeading(to: contentView.leadingAnchor, inset:  Constants.sideInset),
                authorPhoto.pinBottom(to: descriptionLabel.topAnchor, inset: Constants.sideInset),

                authorNameLabel.pinTop(to: contentView.topAnchor, inset: Constants.sideInset),
                authorNameLabel.pinHeight(equalTo: Constants.heightAvatar / 2),
                authorNameLabel.pinLeading(to: authorPhoto.trailingAnchor, inset: Constants.sideInset),
                authorNameLabel.pinTrailing(to: contentView.trailingAnchor),
                authorNameLabel.pinBottom(to: professionLabel.topAnchor),

                professionLabel.pinTop(to: authorNameLabel.bottomAnchor),
                professionLabel.pinLeading(to: authorNameLabel.leadingAnchor),
                professionLabel.pinHeight(equalTo: Constants.heightAvatar / 2),
                professionLabel.pinTrailing(to: dotsImage.leadingAnchor, inset: Constants.sideInset),
                professionLabel.pinBottom(to: authorPhoto.bottomAnchor),

                dotsImage.pinTop(to:contentView.topAnchor,inset: Constants.sideInset),
                dotsImage.pinBottom(to: authorPhoto.bottomAnchor),
                dotsImage.pinWidth(equalTo: 20),
                dotsImage.pinTrailing(to: contentView.trailingAnchor, inset: Constants.sideInset),
                dotsImage.pinLeading(to: professionLabel.trailingAnchor),


                descriptionLabel.pinTop(to: authorPhoto.bottomAnchor, inset: Constants.sideInset),
                descriptionLabel.pinLeading(to: contentView.leadingAnchor),
                descriptionLabel.pinTrailing(to: contentView.trailingAnchor),
                descriptionLabel.pinHeight(equalTo: 100),
                descriptionLabel.pinBottom(to: image.topAnchor),


                image.pinTop(to: descriptionLabel.bottomAnchor, inset: Constants.sideInset),
                image.pinLeading(to: contentView.leadingAnchor),
                image.pinTrailing(to: contentView.trailingAnchor),
                image.pinHeight(equalTo: UIScreen.main.bounds.width),


                likesIcon.pinTop(to: image.bottomAnchor, inset: Constants.sideInset),
                likesIcon.pinLeading(to: contentView.leadingAnchor, inset: Constants.sideInset),
                likesIcon.pinHeight(equalTo: Constants.heightAvatar / 2),
                likesIcon.pinWidth(equalTo: Constants.heightAvatar / 2),
                likesIcon.pinBottom(to: contentView.bottomAnchor, inset: Constants.sideInset),


                likesLabel.pinTop(to: image.bottomAnchor, inset: Constants.sideInset),
                likesLabel.pinHeight(equalTo: Constants.heightAvatar / 2),
                likesLabel.pinWidth(equalTo: Constants.heightAvatar),
                likesLabel.pinLeading(to: likesIcon.trailingAnchor, inset: Constants.sideInset / 2),
                likesLabel.pinBottom(to: contentView.bottomAnchor, inset: Constants.sideInset),

                commentsIcon.pinHeight(equalTo: Constants.heightAvatar / 2),
                commentsIcon.pinWidth(equalTo: Constants.heightAvatar / 2),
                commentsIcon.pinLeading(to: likesLabel.trailingAnchor, inset: Constants.sideInset),
                commentsIcon.pinBottom(to: contentView.bottomAnchor, inset: Constants.sideInset),

                commentsLabel.pinHeight(equalTo: Constants.heightAvatar / 2),
                commentsLabel.pinWidth(equalTo: Constants.heightAvatar),
                commentsLabel.pinLeading(to: commentsIcon.trailingAnchor, inset: Constants.sideInset / 2),
                commentsLabel.pinBottom(to: contentView.bottomAnchor, inset: Constants.sideInset),


                bookmarkIcon.pinTop(to: image.bottomAnchor, inset: Constants.sideInset),
                bookmarkIcon.pinHeight(equalTo: Constants.heightAvatar / 2),
                bookmarkIcon.pinWidth(equalTo: Constants.heightAvatar / 2),
                bookmarkIcon.pinTrailing(to: contentView.trailingAnchor, inset: Constants.sideInset),
                bookmarkIcon.pinBottom(to: contentView.bottomAnchor, inset: Constants.sideInset)
            ]
        )
        NSLayoutConstraint.activate(commonConstraints)
    }

    private func setUp() {
        guard let model = self.viewModel else {
            return
        }
        dotsImage.image = UIImage(named: model.dotsIconName)?.withTintColor(model.colorForDotsImage)
        likesIcon.image = UIImage(systemName: model.likesIconName)
        bookmarkIcon.image = UIImage(systemName: model.bookmarkIconName)
        commentsIcon.image = UIImage(systemName: model.commentsIconName)
        [likesIcon, commentsIcon].forEach({$0.tintColor = model.colorForIcons})

        if model.isSaved {
            bookmarkIcon.tintColor = model.colorForDotsImage
        } else {
            bookmarkIcon.tintColor = model.colorForIcons
        }

    }

    func configureCell(post: Post, indexPath: IndexPath) {
        image.image = UIImage(named: post.image)
        authorNameLabel.text = post.author.name + " " + post.author.surname
        descriptionLabel.text = post.description
        likesLabel.text = String(post.likes)
        commentsLabel.text = String(post.comments.count)
        authorPhoto.image = UIImage(named: post.author.avatar)
        self.viewModel = FeedCellViewModel(post: post, indexPath: indexPath)
        contentView.backgroundColor = viewModel?.cellBacgroundColor
        contentHeaderCellView.backgroundColor = viewModel?.colorForContentHeaderCellView
        authorNameLabel.textColor = viewModel?.colorFontForAuthorNameLabel
        authorNameLabel.font = viewModel?.fontForAuthorLabels
        professionLabel.text = post.author.profession
        professionLabel.textColor = viewModel?.colorForProfessionLabel
        setUp()
    }

    func configurePublicationCell(post: Post) {
        setUp()
        image.image = UIImage(named: post.image)
        authorNameLabel.text = post.author.nickname
        descriptionLabel.text = post.description
        likesLabel.text = String(post.likes)

        commentsLabel.text = String(post.comments.count)
        authorPhoto.image = UIImage(named: post.author.avatar)
    }
    //TODO: - if from Feed did tap - dotsFromFeedGestureAction else dotsFromProfileGestureAction


    @objc func tapDotsAction() {
        print("tapDotsAction gesture worked")
        guard let model = self.viewModel else {
            return
        }
        if model.isMyPost {
            dotsFromProfileGestureAction()
        } else  if !model.isMyPost, model.author.nickname == model.postCell.author.nickname{
            dotsFromFeedGestureAction()
        }
    }
    @objc func openCurrentPost() {
        guard let model = self.viewModel else {
            return
        }
        print("openPost From FeedCell gesture worked")
        delegate?.openCurrentPost(post: model.postCell)
    }

    private func dotsFromFeedGestureAction() {
        print("dotsFromFeedGestureAction gesture worked")
        delegate?.showMenuViewController()
        profileControllerDelegate?.showMenuViewController()
    }

    private func dotsFromProfileGestureAction() {
        print("dotsFromProfileGestureAction gesture worked")
        guard let model = self.viewModel else {
            return
        }
        guard let index = model.indexPath else {
            return
        }
        //       delegate?.openPostMenuFromProfile(post: model.postCell)
        profileControllerDelegate?.openPostMenuFromProfile(post: model.postCell, indexPath: index)
    }

    @objc private func openProfileGestureAction() {
        //        print("open profile gesture worked")
        guard let model = self.viewModel else {
            return
        }
        delegate?.openFriendProfile(friendProfile: model.author)

    }


}
