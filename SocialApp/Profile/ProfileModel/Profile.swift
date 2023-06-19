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
    let posts: Int // Чделасть массив постов
    let subscribers: Int // Сделать массив подписчиков
    let subscriptions: Int // Сделать массив подписчиков
    let city: String
    let dateOfBirth: Date
    let education: String
    let career: String
    let contacts: [Contact]
}

// TODO: - Убрать в отдельный файл модель
enum Contact {
    case mail(String)
    case phone(String)
    case mobilePhone(String)
    case fax(String)

    var rawValue: String {
        switch self {
            case .fax(_):
                return "факс"
                // TODO: - Finish later
            default:
                return ""
        }
    }
}
