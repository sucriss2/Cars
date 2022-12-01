//
//  DetailCarCoordinator.swift
//  Cars
//
//  Created by Suh on 01/12/22.
//

import UIKit

class DetailCarCoordinator: Coordinator {
    var navigationController: UINavigationController!

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let loginVC = makeLoginViewController()
        navigationController.pushViewController(loginVC, animated: true)
    }

    private func makeLoginViewController() -> DetailCarViewController {
        let viewController = DetailCarViewController()
        return viewController
    }

}
