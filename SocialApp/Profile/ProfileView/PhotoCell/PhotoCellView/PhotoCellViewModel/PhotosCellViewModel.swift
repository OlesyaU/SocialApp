//
//  PhotosCellModel.swift
//  SocialApp
//
//  Created by Олеся on 28.06.2023.
//

import UIKit

final class PhotosCellViewModel {
    let titleCell = "Фотографии"
    let photoCountString: String
    let arrowIcon = "chevron.right"
    let photoNameString: [String]

    init(profile: Profile) {
        photoCountString = profile.photosCountString
        photoNameString = profile.photos
    }
}

