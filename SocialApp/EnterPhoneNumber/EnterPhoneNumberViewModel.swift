import FirebaseAuth

class EnterPhoneNumberViewModel {

    // TODO: - Обработка ошибок ввода
    enum State {
        case input
        case error
        case correct
    }

    private var verificationId: String?
    private var verificationCode: String?
    private var user: User?

    let welcomeLabelTitle = "ЗАРЕГИСТРИРОВАТЬСЯ"
    let pushNumberUserTitle = "Введите номер"
    let secondLabelTitle = "Ваш номер телефона будет использоваться для входа в приложение"
    let placeholderString = "+7 _ _ _  _ _ _  _ _  _ _"
    let buttonTitle = "ДАЛЕЕ"
    let privacyLabelTitle = "Нажимая кнопку \"Далее\"  Вы принимаете \n пользовательское Соглашение и политику конфиденциальности"
    private var state: State = .input {
        didSet {
            viewModelChanged?()
        }
    }

    var viewModelChanged: (() -> Void)?

    func authorize(phoneNumber: String) {
        PhoneAuthProvider.provider()
            .verifyPhoneNumber(phoneNumber, uiDelegate: nil) { verificationID, error in
                if let error = error {
                    print(error.localizedDescription)
                    return
                }
                self.verificationId = verificationID
                self.verificationCode = "000000"
                guard let verificationCode = self.verificationCode,
                      let verificationID = self.verificationId else {
                    return
                }

                let credential = PhoneAuthProvider.provider().credential(withVerificationID: verificationID,
                                                                         verificationCode: verificationCode)
                self.signInAndRetrieveData(with: credential)
            }
    }

    func signInAndRetrieveData(with credential: PhoneAuthCredential) {
        Auth.auth().signIn(with: credential) { (authData: AuthDataResult?, error: Error?) in
            if let error = error {
                return
            }
            guard let phoneNumber = authData?.user.phoneNumber else {
                return
            }
        }
    }
}

/*
 Нужно доделать регистрацию: ограничив возможно сть для захода только номером с девятками
 Для этого - сделать error state на экране ввода телефона,
 Далее - корректно передавать данные из экрана в экран:
 на экране ввода номера - получаем из authorise - verification id -  передаем его в след экран ( с вводом 6 символов) -
 во вью модель
 В след экране - делаем проверку на введенный код: отправлчяем запрос в фиребас - и парсим ответ
 поправь маску на жкране ввода кода

 обработку паролей, номеров - делать во вьюмоделях!
 */
