//
//  DetailCarCoordinator.swift
//  Cars
//
//  Created by Suh on 01/12/22.
//

import UIKit
import SafariServices

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
        viewController.delegate = self
        screen.delegate = viewController

        return viewController
    }

    private func makeVideoController(url: URL) {
           let safariViewController = SFSafariViewController(url: url)
           navigationController.pushViewController(safariViewController, animated: true)
       }

}

extension DetailCarCoordinator: DetailCarViewControllerDelegate {
    func showVideo(url: URL) {
        makeVideoController(url: url)
    }

}
