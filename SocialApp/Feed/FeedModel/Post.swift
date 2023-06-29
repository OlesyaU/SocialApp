//
//  Post.swift
//  SocialApp
//
//  Created by Олеся on 19.06.2023.
//

import Foundation
import UIKit

struct Post: Codable, Equatable {
    let author: String
    let profession: String
    let image: String
    let description: String
    let likes: Int
    let comments: Int
    let isSaved: Bool
}

extension Post {
    static func mock(count: Int) -> [Post] {
        var result: [Post] = []
        for _ in 0...count {
            let post = Post(author: getAuthorNames().randomElement()! + "" + getAuthorSurnames().randomElement()!,
                            profession: getProfession().randomElement()!,
                            image: avatars().randomElement()!,
                            description: lorem,
                            likes: (0...290).randomElement()!,
                            comments: (0...290).randomElement()!,
                            isSaved: Bool.random())
            result.append(post)
        }
        return result
    }
}
