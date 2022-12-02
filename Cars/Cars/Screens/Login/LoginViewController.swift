//
//  LoginViewController.swift
//  Cars
//
//  Created by Suh on 28/11/22.
//

import UIKit

class LoginViewController: UIViewController {

    let screen = LoginView()
    var model: LoginModel?

    init() {
        super.init(nibName: nil, bundle: nil)
        self.view = screen
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
    }

    func show() {
        screen.loginTextFieldView.textField.addTarget(self, action: #selector(showLogin), for: .touchUpInside)
    }

    @objc private func showLogin() {
        print("===>> MODEL OKOKOK")
    }

}

