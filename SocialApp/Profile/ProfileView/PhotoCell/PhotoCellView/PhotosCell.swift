//
//  PhotosCell.swift
//  SocialApp
//
//  Created by Олеся on 28.06.2023.
//

import UIKit

class PhotosCell: UITableViewCell {

    private var viewModel: PhotosCellViewModel?
    private var cellConstraints: [NSLayoutConstraint] = []

    private let containerView = UIView()

    private let photoLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.textColor = .black
        return label
    }()
    private lazy var photoCountLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.textColor = .gray
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        return label
    }()

    private lazy var arrowImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .center
        image.tintColor = .black
        return image
    }()

    private lazy var collection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        layout.scrollDirection = .horizontal
        collection.showsHorizontalScrollIndicator = false
        collection.isPagingEnabled = true
        collection.dataSource = self
        collection.delegate = self
        collection.register(PhotoCollectionViewCell.self, forCellWithReuseIdentifier: PhotoCollectionViewCell.identifier)
        return collection
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupConstraints() {

        contentView.addSubview(containerView)
        contentView.addSubview(collection)

        [photoLabel, photoCountLabel, arrowImage, collection, containerView].forEach {$0.forAutolayout()}
        [photoLabel, photoCountLabel, arrowImage].forEach {containerView.addSubview($0)}

        cellConstraints.append(contentsOf: [
            containerView.pinTop(to: contentView.topAnchor),
            containerView.pinLeading(to: contentView.leadingAnchor),
            containerView.pinTrailing(to: contentView.trailingAnchor),

            photoLabel.pinTop(to: containerView.topAnchor, inset: Constants.inset16),
            photoLabel.pinLeading(to: containerView.leadingAnchor, inset: Constants.inset16),

            photoCountLabel.pinTop(to: containerView.topAnchor, inset: Constants.inset16),
            photoCountLabel.pinLeading(to: photoLabel.trailingAnchor, inset: Constants.inset16),

            arrowImage.pinTop(to: containerView.topAnchor, inset: Constants.inset16),
            arrowImage.pinTrailing(to: containerView.trailingAnchor, inset: Constants.inset16),
            arrowImage.pinBottom(to: containerView.bottomAnchor),
            arrowImage.pinHeight(equalTo: 24),
            arrowImage.pinWidth(equalTo: 24),

            collection.pinTop(to: containerView.bottomAnchor, inset: Constants.inset16),
            collection.pinLeading(to: contentView.leadingAnchor, inset: Constants.inset16),
            collection.pinTrailing(to: contentView.trailingAnchor),
            collection.pinHeight(equalTo: Constants.inset8 * 10),
            collection.pinBottom(to: contentView.bottomAnchor, inset: Constants.inset16)
        ])
        NSLayoutConstraint.activate(cellConstraints)
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(didTap))
        containerView.isUserInteractionEnabled = true
        containerView.addGestureRecognizer(tapGesture)
    }

    @objc
    private func didTap() {
        viewModel?.photosCellSelected()
    }

    func configure(viewModel: PhotosCellViewModel) {
        self.viewModel = viewModel
        photoLabel.text = viewModel.titleCell
        photoCountLabel.text = viewModel.photoCountString
        arrowImage.image = viewModel.arrowIcon
        collection.reloadData()
    }

}
extension PhotosCell: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel?.photoNameString.count ?? 0
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: Constants.inset8 * 10, height: Constants.inset8 * 10)
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotoCollectionViewCell.identifier, for: indexPath) as? PhotoCollectionViewCell else {
            return UICollectionViewCell()
        }

        guard let photo = viewModel?.photoNameString[indexPath.row] else { return UICollectionViewCell()}
        cell.configure(photo: photo)
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        Constants.inset8
    }
}
