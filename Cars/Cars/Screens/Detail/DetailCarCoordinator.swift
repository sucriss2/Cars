//
//  DetailCarCoordinator.swift
//  Cars
//
//  Created by Suh on 01/12/22.
//

import UIKit

class DetailCarCoordinator: Coordinator {
    private var car: Car
    var navigationController: UINavigationController!

    init(car: Car, navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.car = car
    }

    func start() {
        let loginVC = makeLoginViewController()
        navigationController.pushViewController(loginVC, animated: true)
    }

    private func makeLoginViewController() -> DetailCarViewController {
        let model = DetailCarModel(car: car)
        let screen = DetailCarView()
        let viewController = DetailCarViewController()

        viewController.model = model
        viewController.screen = screen

        return viewController
    }

}
