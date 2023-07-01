import FirebaseAuth

class EnterPhoneNumberViewModel {

    private var verificationId: String?
    private var verificationCode: String?
    private var user: User?

    func authorize(phoneNumber: String) {
        PhoneAuthProvider.provider()
            .verifyPhoneNumber(phoneNumber, uiDelegate: nil) { verificationID, error in
                if let error = error {
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
                print(error.localizedDescription)
                return
            }
            guard let phoneNumber = authData?.user.phoneNumber else {
                return
            }
            print(phoneNumber)
        }
    }
}
