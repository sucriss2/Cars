//
//  LoginViewController.swift
//  Cars
//
//  Created by Suh on 28/11/22.
//

import UIKit

protocol LoginViewControllerDelegate: AnyObject {
    func showListCars()
}

class LoginViewController: UIViewController {

    weak var delegate: LoginViewControllerDelegate?
    var model: LoginModel?
    private let screen: LoginView

    init(screen: LoginView = LoginView()) {
        self.screen = screen
        super.init(nibName: nil, bundle: nil)
        screen.delegate = self
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        self.view = screen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    private func validateForm() -> Bool {
        if screen.userName.isEmpty == true {
            alert(message: "Campo de Usuario deve ser preenchido")
            return false
        }

        if screen.password.isEmpty == true {
            alert(message: "Campo de Senha deve ser preenchido")
            return false
        }

        return true
    }

    private func alert(message: String) {
        let alert = UIAlertController(title: "Atenção!!", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}

extension LoginViewController: LoginViewDelegate {
    func didTapLogin() {
        if self.validateForm() {
            showLoading()
            self.model?.login(username: self.screen.userName, password: self.screen.password)
        }
    }

}

extension LoginViewController: LoginModelDelegate {
    func loginSuccess() {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.hideLoading()
            self.delegate?.showListCars()
        }

    }

    func loginFail(message: String) {
        DispatchQueue.main.async {
            self.hideLoading()
            self.alert(message: message)
        }
    }
}

