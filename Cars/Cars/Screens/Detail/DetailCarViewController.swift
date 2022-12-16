//
//  DetailCarViewController.swift
//  Cars
//
//  Created by Suh on 01/12/22.
//

import UIKit
import Kingfisher
import MapKit

protocol DetailCarViewControllerDelegate: AnyObject {
    func showVideo(url: URL)
}

class DetailCarViewController: UIViewController {

    var screen: DetailCarView?
    var model: DetailCarModel?
    weak var delegate: DetailCarViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Detalhes"
        self.view.backgroundColor = .cyan
        self.view = screen
        setupDetailCar()
    }

    private func setupDetailCar() {
        guard let model = model else {
            return
        }

        screen?.photoImageView.kf.setImage(with: model.carPhoto)
        // screen?.photo?.kf.setImage(with: model.carPhoto)
        screen?.name = model.carName
        screen?.type = model.carType
        screen?.descriptionCar = model.carDescription
        showMap()
    }

    private func showMap() {
        guard let model = model else {
            return
        }

        screen?.map.isHidden = true
        if model.hasCoordinates {
            screen?.map.isHidden = false
            let coords = CLLocationCoordinate2D(latitude: model.carLat, longitude: model.carLong)
            let span = MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02)
            let region = MKCoordinateRegion(center: coords, span: span)
            screen?.map.region = region
        }
    }

}

extension DetailCarViewController: DetailCarViewDelegate {
    func showVideoDetail() {
        guard let model = model else {
            return
        }
        delegate?.showVideo(url: model.carVideo)
    }

}
