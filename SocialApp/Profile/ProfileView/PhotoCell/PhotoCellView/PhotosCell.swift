//
//  PhotosCell.swift
//  SocialApp
//
//  Created by Олеся on 28.06.2023.
//

import UIKit

class PhotosCell: UITableViewCell {

 private enum Constants {
        static let sideInset: CGFloat = 16
        static let sidePhoto: CGFloat = 80
    }

    private var viewModel: PhotosCellViewModel?
    private var cellConstraints: [NSLayoutConstraint] = []

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
        layout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func layout() {
        [photoLabel, photoCountLabel, arrowImage, collection].forEach {$0.forAutolayout()}
        [photoLabel, photoCountLabel, arrowImage, collection].forEach {contentView.addSubview($0)}

        cellConstraints.append(contentsOf: [
            photoLabel.pinTop(to: contentView.topAnchor, inset: Constants.sideInset),
            photoLabel.pinLeading(to: contentView.leadingAnchor, inset: Constants.sideInset),

            photoCountLabel.pinTop(to: contentView.topAnchor, inset: Constants.sideInset),
            photoCountLabel.pinLeading(to: photoLabel.trailingAnchor, inset: Constants.sideInset),

            arrowImage.pinTop(to: contentView.topAnchor, inset: Constants.sideInset),
            arrowImage.pinTrailing(to: contentView.trailingAnchor, inset: Constants.sideInset),
            arrowImage.pinBottom(to: photoLabel.bottomAnchor),
            arrowImage.pinHeight(equalTo: 24),
            arrowImage.pinWeight(equalTo: 24),

            collection.pinTop(to: photoLabel.bottomAnchor, inset: Constants.sideInset),
            collection.pinLeading(to: contentView.leadingAnchor, inset: Constants.sideInset),
            collection.pinTrailing(to: contentView.trailingAnchor),
            collection.pinHeight(equalTo: Constants.sidePhoto),
            collection.pinBottom(to: contentView.bottomAnchor, inset: Constants.sideInset)
        ])
        NSLayoutConstraint.activate(cellConstraints)
    }

    func configure(viewModel: PhotosCellViewModel) {
        self.viewModel = viewModel
        photoLabel.text = viewModel.titleCell
        photoCountLabel.text = viewModel.photoCountString
        arrowImage.image = UIImage(systemName: viewModel.arrowIcon)
        collection.reloadData()
    }

}
extension PhotosCell: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel?.photoNameString.count ?? 0
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: Constants.sidePhoto, height: Constants.sidePhoto)
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
        8
    }
}
