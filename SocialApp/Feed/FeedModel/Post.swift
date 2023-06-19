//
//  Post.swift
//  SocialApp
//
//  Created by Олеся on 19.06.2023.
//

import Foundation
import UIKit

struct Post {
    let author: String
    let profession: String
    let image: UIImage
    let description: String
    let likes: Int
    let comments: Int
    let isSaved: Bool
}

extension Post {
    static func mock(count: Int) -> [Post] {
        var result: [Post] = []
        for i in 0...count {
            let post = Post(author: String.random(length: i),
                            profession: String.random(length: i),
                            image: UIImage(),
                            description: String.random(length: i),
                            likes: i,
                            comments: i,
                            isSaved: Bool.random())
            result.append(post)
        }
        return result
    }
}
