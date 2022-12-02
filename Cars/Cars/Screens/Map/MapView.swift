//
//  MapView.swift
//  Cars
//
//  Created by Suh on 02/12/22.
//

import MapKit
import UIKit

final class MapView: UIView {

    let mapaMapView: MKMapView = {
        let view = MKMapView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isHidden = false
        view.backgroundColor = .red
        view.contentMode = .scaleToFill
//        view.isZoomEnabled = true
//        view.showsCompass = true
//        view.isScrollEnabled = true
//        view.isRotateEnabled = true
        return view
    }()

    init() {
        super.init(frame: .zero)
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configurationMap() {
        let coords = CLLocationCoordinate2D(latitude: 34.011_286, longitude: -116.166_868)
        let span = MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02)
        let region = MKCoordinateRegion(center: coords, span: span)
        mapaMapView.region = region
    }

}

extension MapView: CodeView {
    func buidViewHierarchy() {
        addSubview(mapaMapView)
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            mapaMapView.topAnchor.constraint(equalTo: self.topAnchor),
            mapaMapView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            mapaMapView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            mapaMapView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])

    }

    func setupAdditionConfiguration() {

    }

}
