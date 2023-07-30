//
//  FeedViewModel.swift
//  SocialApp
//
//  Created by Олеся on 20.06.2023.
//

import Foundation

final class FeedViewModel {
    let posts = DataBase.shared.getPosts()
    let profiles = Profile.mock(count: 7)
    var isNewUser: Bool
    init(isNewUser: Bool) {
        self.isNewUser = isNewUser
        print("isNew from FeedViewModel \(isNewUser)")
    }
    }
