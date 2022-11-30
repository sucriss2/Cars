//
//  LoginViewController.swift
//  Cars
//
//  Created by Suh on 28/11/22.
//

import UIKit

class LoginViewController: UIViewController {

    let screen = LoginView()

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


}

