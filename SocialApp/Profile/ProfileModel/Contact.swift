//
//  Contact.swift
//  SocialApp
//
//  Created by Олеся on 19.06.2023.
//

enum Contact {
    case mail(String)
    case phone(String)
    case mobilePhone(String)
    case fax(String)

    var rawValue: String {
        switch self {
            case .fax(_):
                return "факс"
            case .mail(_):
                return "почта"
            case .mobilePhone(_):
                return "мобильный телефон"
            case .phone(_):
                return "телефон"
        }
    }
}

extension Contact {
    static func random(_ count: Int) -> [Contact] {
        func allCasesRandom(i: Int) -> Contact {
            let mail = Contact.mail(String(i))
            let phone = Contact.phone(String(i))
            let mobilePhone = Contact.mobilePhone(String(i))
            let fax = Contact.fax(String(i))
            let returnArray = [mail, phone, mobilePhone, fax]
            guard i < returnArray.count else { return Contact.fax("Ошибся, брат")}
            return returnArray[i]
        }
        var result: [Contact] = []
        for i in 0...count {
            result.append(allCasesRandom(i: i))
        }
        return result
    }
}
