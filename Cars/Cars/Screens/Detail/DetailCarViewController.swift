//
//  DetailCarViewController.swift
//  Cars
//
//  Created by Suh on 01/12/22.
//

import UIKit
import Kingfisher

class DetailCarViewController: UIViewController {

    var screen: DetailCarView?
    var model: DetailCarModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .cyan
        self.view = screen
        setupDetailCar()
    }

    func setupDetailCar() {
        guard let model = model else {
            return
            
        }
        screen?.name = model.carName
        screen?.type = model.carType
        screen?.descriptionCar = model.carDescription

    }

}

