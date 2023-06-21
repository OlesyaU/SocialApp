//
//  FeedViewModel.swift
//  SocialApp
//
//  Created by Олеся on 20.06.2023.
//

import Foundation
import UIKit

final class FeedViewModel {
    let posts = Post.mock(count: 7)
    let profiles = Profile.mock(count: 7)
}

