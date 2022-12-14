//
//  ListCarsCoordinator.swift
//  Cars
//
//  Created by Suh on 30/11/22.
//

import UIKit

class ListCarsCoordinator: Coordinator {
    var navigationController: UINavigationController!
    private var childCoordinator: DetailCarCoordinator?

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let loginVC = makeLoginViewController()
        navigationController.pushViewController(loginVC, animated: true)
    }

    private func makeLoginViewController() -> ListCarsViewController {
        let model = ListCarsModel()
        let service = ListCarsService()
        let viewController = ListCarsViewController()

        viewController.model = model
        model.service = service
        model.delegate = viewController
        viewController.delegate =  self

        return viewController
    }

}

extension ListCarsCoordinator: ListCarsViewControllerDelegate {
    func showDetailCar(car: Car) {
        let detailCarCoordinator = DetailCarCoordinator(car: car, navigationController: navigationController)
        detailCarCoordinator.start()
        childCoordinator = detailCarCoordinator
    }

}
