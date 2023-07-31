//
//  CombackViewModel.swift
//  SocialApp
//
//  Created by Олеся on 23.06.2023.
//

import FirebaseAuth

final class CombackViewModel: ComebackViewModelProtocol {

    private let model = DataBase.shared
    private var state: State = .viewIsReady
    private var viewModelChanged: ((_ state: State)-> Void)?
    
    let welcomeLabelTitle = "С возвращением"
    let welcomeNewUserTitle = "Добро пожаловать !"
    let secondLabelTitle = "Введите номер телефона \n для входа в приложение"
    let placeholderString = " +7 _ _ _  _ _ _  _ _  _ _"
    let buttonTitle = "ПОДТВЕРДИТЬ"
    let alertTitle = "OOPPPSS"
    let alertMessage = "The code is incorrect. Please write correctly"
    let actionTitle = "OMG! SURE THING"

    func checkUser(by phone: String) -> Profile? {
        guard validate(phone: phone) else {
            print("CHECK1 not succeed validation ")
            return nil
        }
        checkUserPhone(phone: phone)
        return model.getProfile(by: phone) ? model.testProfile : nil
    }

    func validate(phone: String) -> Bool {
        let PHONE_REGEX = "[+][7][ ][0-9]{3}[ ][0-9]{3}[ ][0-9]{2}[ ][0-9]{2}"
        let phoneTest = NSPredicate(format: "SELF MATCHES %@", PHONE_REGEX)
        let result = phoneTest.evaluate(with: phone)
        return result
    }

    private func checkUserPhone(phone: String) {
        Auth.auth().settings?.isAppVerificationDisabledForTesting = true
        PhoneAuthProvider.provider().verifyPhoneNumber(phone, uiDelegate: nil) {
            verificationID, error in
            if let error = error {
                print("ERRROOORRRR\(error)")
                return
            }
        }
    }
}



