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
    let likes: Int
    let comments: Int
    var isSaved: Bool
}

extension Post {
    static func mock(count: Int, profile: Profile) -> [Post] {
        var result: [Post] = []
        for _ in 0...count {
            let post = Post(author: profile,
                            image: avatars().randomElement()!,
                            description: lorem,
                            likes: (0...290).randomElement()!,
                            comments: (0...290).randomElement()!,
                            isSaved: Bool.random())
            result.append(post)
        }
        return result
    }
    
//    static func mockTest(count: Int) -> [Post] {
//        var result: [Post] = []
////        let testProfile = DataBase.shared.testProfile
//        for _ in 0...count {
//            var post = Post(author: testProfile.name + " " + testProfile.surname,
//                            profession: getProfession().randomElement()!,
//                            image: avatars().randomElement()!,
//                            description: lorem,
//                            likes: (0...290).randomElement()!,
//                            comments: (0...290).randomElement()!,
//                            isSaved: Bool.random())
//            result.append(post)
//        }
//        return result
//    }
}
