//
//  LoginCoordinator.swift
//  Cars
//
//  Created by Suh on 28/11/22.
//

import UIKit

protocol LoginCoordinatorDelegate: AnyObject {
    func showListCarsCoord()
}

class LoginCoordinator: Coordinator {
    var navigationController: UINavigationController!
    weak var loginDelegate: LoginCoordinatorDelegate?

    init(navigationController: UINavigationController, delegate: LoginCoordinatorDelegate) {
        self.navigationController = navigationController
        self.loginDelegate = delegate
    }

    func start() {
        let loginVC = makeLoginViewController()
        navigationController.pushViewController(loginVC, animated: true)
    }

    private func makeLoginViewController() -> LoginViewController {
        let model = LoginModel()
        let service = LoginService()
        let viewController = LoginViewController()

        model.service = service
        model.delegate = viewController
        viewController.model = model
        viewController.delegate = self

        return viewController
    }

}

extension LoginCoordinator: LoginViewControllerDelegate {
    func showListCars() {
        loginDelegate?.showListCarsCoord()
    }

}
