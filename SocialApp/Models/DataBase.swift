//
//  DataBase.swift
//  SocialApp
//
//  Created by Олеся on 22.06.2023.
//

import Foundation

class DataBase {

    static let shared = DataBase()

    var profiles: [Profile] = []

//    var myProfile = Profile(
//        avatar: "",
//        name: "",
//        surname: "",
//        profession: "",
//        photos: getPhoto().shuffled(),
//        posts: [],
//        subscribers: [],
//        subscriptions: [],
//        city: "",
//        dateOfBirth: Date(),
//        education: "",
//        career: "",
//        contacts: [.mobilePhone("+7 999 999 99 99")]
//    )
    var testProfile = Profile(
        avatar: "Avatar2",
        name: "Name",
        surname: "Surname",
        profession: "Profession",
        photos: getPhoto().shuffled(),
        posts: [],
        subscribers: [],
        subscriptions: [],
        city: "",
        dateOfBirth: Date(),
        education: "",
        career: "",
        contacts: [.mobilePhone("+7 999 999 99 99")]
    )

    init() {
        let posts = Post.mock(count: 6, profile: testProfile)
        testProfile.posts = posts

        if profiles.isEmpty {
            profiles = generateMockData()
        } else {
            print("Hello from init DatatBase profiles :)")
        }
    }

    private func generateMockData() -> [Profile] {
        var profiles = Profile.mock(count: 7)

        repeat {
            let randomProfile = profiles[Int.random(in: 0...profiles.count - 1)]
            let randomSubscriberProfile = profiles[Int.random(in: 0...profiles.count - 1)]
            if randomProfile != randomSubscriberProfile {
                randomProfile.subscribers.insert(randomSubscriberProfile)
            }
        } while !profiles
            .map(\.subscribers)
            .map(\.count)
            .filter { $0 < 3 }
            .isEmpty

        repeat {
            let randomProfile = profiles[Int.random(in: 0...profiles.count - 1)]
            let randomSubscriberProfile = profiles[Int.random(in: 0...profiles.count - 1)]
            if randomProfile != randomSubscriberProfile {
                randomProfile.subscriptions.insert(randomSubscriberProfile)
            }
        } while !profiles
            .map(\.subscriptions)
            .map(\.count)
            .filter{ $0 < 3 }
            .isEmpty

        profiles.forEach { profile in
            profile.posts.append(contentsOf: Post.mock(count: Int.random(in: 1...7), profile: profile))
        }
        profiles.append(testProfile)
        saveDataToUserDefaults()
        return profiles
    }

    private func saveDataToUserDefaults(){
        do {
            let encoder = JSONEncoder()
            let data = try encoder.encode(profiles)
            UserDefaults.standard.set(data, forKey: "profiles")
        } catch {
            print("Unable to Encode Array of Profiles (\(error.localizedDescription))")
        }
    }

    private func getDataFromUserDefauls() -> [Profile]? {
        var profiles: [Profile] = []
        if let data = UserDefaults.standard.data(forKey: "profiles") {
            do {
                let decoder = JSONDecoder()
                let profilesDecoded = try decoder.decode([Profile].self, from: data)
                profiles = profilesDecoded
                return profiles
            } catch {
                print("Hello from decoder. Error is \(error.localizedDescription)")
            }
        }
        return nil
    }

 func getProfile(by phone: String) -> Bool {
        let number = "+7 999 999 99 99"
        return phone == number ? true : false
    }

    /// Description -  real posts of test user are commented

    func getPosts() -> [Post] {

//        testProfile.subscriptions.flatMap(\.posts)
        profiles.flatMap(\.posts).shuffled()
    }
}

