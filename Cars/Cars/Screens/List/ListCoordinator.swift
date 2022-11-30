//
//  ListCoordinator.swift
//  Cars
//
//  Created by Suh on 30/11/22.
//

import UIKit

class ListCoordinator: Coordinator {
    var navigationController: UINavigationController!

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let loginVC = makeLoginViewController()
        navigationController.pushViewController(loginVC, animated: true)
    }

    private func makeLoginViewController() -> ListCarsViewController {
        let viewController = ListCarsViewController()
        return viewController
    }

}
