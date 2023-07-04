//
//  Comment.swift
//  SocialApp
//
//  Created by Олеся on 04.07.2023.
//

import Foundation
struct Comment: Codable, Equatable {

    let author: Profile
    let text: String
    let date: Date
    let likes: Int
    let isLike: Bool
    init( author: Profile, text: String, date: Date, likes: Int, isLike: Bool) {

        self.text = text
        self.date = date
        self.likes = likes
        self.isLike = isLike
        self.author = author

    }

}

extension Comment {
    static func mock(count: Int, author: Profile) -> [Comment] {
        var result: [Comment] = []
        for _ in 0...count {
            let comment = Comment(author: author, text: getCommentText().randomElement()!,
                                  date: Date(),
                                  likes: Int.random(in: 0...100),
                                  isLike: Bool.random())

            result.append(comment)
        }
        return result
    }
}
