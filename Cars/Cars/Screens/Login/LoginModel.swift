//
//  LoginModel.swift
//  Cars
//
//  Created by Suh on 07/12/22.
//

import UIKit

protocol LoginModelDelegate: AnyObject {
    func loginSuccess()
    func loginFail(message: String)
}

class LoginModel {

    weak var delegate: LoginModelDelegate?
    var service: LoginService?
    private var userSession: UserSession

    init(userSession: UserSession = UserSession.shared) {
        self.userSession = userSession
    }

    func login(username: String, password: String) {
//
//        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) { [weak self] in
//            self?.delegate?.loginFail(message: "asdfsfsdfds")
//        }

        service?.login(
            username: username,
            password: password,
            onComplete: { [weak self] user in
                self?.userSession.set(user: user)
                self?.delegate?.loginSuccess()
            },
            onError: { error in
                self.delegate?.loginFail(message: "Erro de login. Confira seus dados e tente novamente.")
                print(error.localizedDescription)
            }
        )

    }
    

    
    


}
