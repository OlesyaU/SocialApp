//
//  CombackViewModel.swift
//  SocialApp
//
//  Created by Олеся on 23.06.2023.
//

import Foundation

final class CombackViewModel: ComebackViewModelProtocol {
    private let model = DataBase.shared
    let welcomeLabelTitle = "С возвращением"
    let welcomeNewUserTitle = "Добро пожаловать !"
    let secondLabelTitle = "Введите номер телефона \n для входа в приложение"
    let placeholderString = " +7 _ _ _  _ _ _  _ _  _ _"
    let buttonTitle = "ПОДТВЕРДИТЬ"

    func checkUser(by phone: String) -> Profile? {
        guard validate(phone: phone) else {
            print("CHECK1 not succeed validation ")
            return nil
        }
        print("CHECK1 succeed validation ")
        return model.getProfile(by: phone) ? model.testProfile : nil
    }

    func validate(phone: String) -> Bool {
        let PHONE_REGEX = "[+][7][ ][0-9]{3}[ ][0-9]{3}[ ][0-9]{2}[ ][0-9]{2}"
        let phoneTest = NSPredicate(format: "SELF MATCHES %@", PHONE_REGEX)
        let result = phoneTest.evaluate(with: phone)
        return result
    }
}




