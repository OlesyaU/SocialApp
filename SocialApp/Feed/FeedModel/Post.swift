//
//  Post.swift
//  SocialApp
//
//  Created by Олеся on 19.06.2023.
//
import UIKit
struct Post: Codable, Equatable {
    let author: Profile
    let image: String
    let description: String
    var likes: Int
    var comments: [Comment]
    var isSaved: Bool
}

extension Post {
    static func mock(count: Int, profile: Profile) -> [Post] {
        var result: [Post] = []
        for _ in 0...count {
            var post = Post(author: profile,
                            image: avatars().randomElement()!,
                            description: lorem,
                            likes: (0...290).randomElement()!,
                            comments: [],
                            isSaved: Bool.random())
            let comments = Comment.mock(count: Int.random(in: 0...21), author: profile)
            post.comments = comments
            result.append(post)
        }

        return result
    }
}


