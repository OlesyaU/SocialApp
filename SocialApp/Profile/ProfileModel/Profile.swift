//
//  Profile.swift
//  SocialApp
//
//  Created by Олеся on 19.06.2023.
//

import Foundation

struct Profile {
    let name: String
    let surname: String
    let profession: String
    let posts: [Post]
    let subscribers: [Profile]
    let subscriptions: [Profile]
    let city: String
    let dateOfBirth: Date
    let education: String
    let career: String
    let contacts: [Contact]
    var subscribersCount: Int {
        subscribers.count
    }
    var subscriptionsCount: Int {
        subscriptions.count
    }
    static func mock(count: Int) -> [Profile] {
        var profiles: [Profile] = []
        for i in 0...count {
            let profile = Profile(
                name: String.random(length: i),
                surname: String.random(length: i),
                profession: String.random(length: i),
                posts: Post.mock(count: i),
                subscribers: Profile.mock(count: i),
                subscriptions: Profile.mock(count: i),
                city: String.random(length: i),
                dateOfBirth: Date(),
                education: String.random(length: i),
                career: String.random(length: i),
                contacts: Contact.random(3)
            )
        }
        return profiles
    }
}

extension String {

    static func random(length: Int = 20) -> String {
        let base = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        var randomString: String = ""

        for _ in 0..<length {
            let randomValue = arc4random_uniform(UInt32(base.count))
            randomString += "\(base[base.index(base.startIndex, offsetBy: Int(randomValue))])"
        }
        return randomString
    }
}

