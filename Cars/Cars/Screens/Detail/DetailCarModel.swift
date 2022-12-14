//
//  DetailCarModel.swift
//  Cars
//
//  Created by Suh on 13/12/22.
//

import Foundation

class DetailCarModel {
    private var car: Car

    var carId: Int {
        return car.id
    }

    var carName: String {
        return car.name
    }

    var carType: String {
        return car.type.capitalized
    }

    var carDescription: String {
        return car.description ?? ""
    }

    var carPhoto: URL {
        return URL(string: car.urlPhoto ?? "") ?? URL(fileURLWithPath: "")
    }

    var carVideo: URL {
        return URL(string: car.urlVideo ?? "") ?? URL(fileURLWithPath: "")
    }

    var carLat: Double {
        return Double(car.latitude ?? "") ?? 0.0
    }

    var carLong: Double {
        return Double(car.longitude ?? "") ?? 0.0
    }

    var hasCoordinates: Bool {
        return car.latitude != nil && car.longitude != nil
    }

    var hasVideo: Bool {
        return car.urlVideo != nil
    }

    init(car: Car) {
        self.car = car
    }

}
