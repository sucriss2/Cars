//
//  ListCarsModel.swift
//  Cars
//
//  Created by Suh on 12/12/22.
//

import Foundation

protocol ListCarsModelDelegate: AnyObject {
    func didLoadSucess()
    func didError(message: String)
}

class ListCarsModel {
    private(set) var cars: [Car]
    weak var delegate: ListCarsModelDelegate?
    var service: ListCarsService?

    init() {
        cars = []
    }

    func load() {

        service?.loadList(
            onComplete: { [weak self] cars in
                guard let self = self else { return }
                self.cars.append(contentsOf: cars)
                self.delegate?.didLoadSucess()
            },
            onError: { error in
                self.delegate?.didError(message: "\(error.localizedDescription)")
            })

    }


}
