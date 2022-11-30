//
//  AppCoordinator.swift
//  Cars
//
//  Created by Suh on 28/11/22.
//

import UIKit

class AppCoordinator: Coordinator {
    var navigationController: UINavigationController!
    private var windows: UIWindow?
    private var childCoordinator: Coordinator?

    init(windows: UIWindow) {
        self.windows = windows
    }

    func start() {
        showCoordinator()
    }

    private func showCoordinator() {
        navigationController = UINavigationController()
        windows?.rootViewController = navigationController
        windows?.makeKeyAndVisible()

//        let loginCoordinator = LoginCoordinator(navigationController: navigationController)
//        loginCoordinator.start()
//        childCoordinator = loginCoordinator

        let listCoordinator = ListCoordinator(navigationController: navigationController)
        listCoordinator.start()
        childCoordinator = listCoordinator
    }

}
