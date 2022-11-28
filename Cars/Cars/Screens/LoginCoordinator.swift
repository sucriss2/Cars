//
//  LoginCoordinator.swift
//  Cars
//
//  Created by Suh on 28/11/22.
//

import UIKit

class LoginCoordinator: Coordinator {
    var navigationController: UINavigationController!

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let loginVC = makeLoginViewController()
        navigationController.pushViewController(loginVC, animated: true)
    }

    private func makeLoginViewController() -> LoginViewController {
        let viewController = LoginViewController()
        return viewController
    }

}
