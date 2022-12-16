//
//  DetailCarView.swift
//  Cars
//
//  Created by Suh on 01/12/22.
//

import UIKit
import MapKit
import SafariServices

protocol DetailCarViewDelegate: AnyObject {
    func showVideoDetail()
}

public final class DetailCarView: UIView {

    private let detailView: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = .systemGray6
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    let photoImageView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        // imageView.image = UIImage(named: "car")
        imageView.contentMode = .scaleToFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private let principalStackView: UIStackView = {
        let view = UIStackView(frame: .zero)
        view.axis = .vertical
        view.distribution = .equalSpacing
        view.spacing = 8
        view.alignment = .center
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private let infolabelStackView: UIStackView = {
        let view = UIStackView(frame: .zero)
        view.axis = .vertical
        view.spacing = 8
        view.distribution = .fill
        view.contentMode = .scaleToFill
        view.isLayoutMarginsRelativeArrangement = true
        view.layoutMargins = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private let showVideoButton: UIButton = {
        let view = UIButton(frame: .zero)
        view.backgroundColor = .black
        view.layer.cornerRadius = 8.0
        view.setAttributedTitle(
            NSAttributedString(
                string: "Assistir Vídeo",
                attributes: [
                    NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 18.0),
                    NSAttributedString.Key.foregroundColor: UIColor.red
                ]
            ),
            for: .normal)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private let buttonStackView: UIStackView = {
        let view = UIStackView(frame: .zero)
        view.axis = .horizontal
        view.distribution = .fill
        view.alignment = .center
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private let nameInfoText = InfoLabel(title: "nome", subtitle: "")
    private let typeInfoText = InfoLabel(title: "tipo", subtitle: "")
    private let descriptionInfoText = InfoLabel(title: "descrição", subtitle: "")
    private let mapView = MapView()

    weak var delegate: DetailCarViewDelegate?

    var name: String? {
        didSet {
            nameInfoText.subtitle = name ?? ""
        }
    }

    var type: String? {
        didSet {
            typeInfoText.subtitle = type ?? ""
        }
    }

    var descriptionCar: String? {
        didSet {
            descriptionInfoText.subtitle = descriptionCar ?? ""
        }
    }

    var map: MKMapView {
        return mapView.mapaMapView
    }

//    var photo: UIImageView? {
//        didSet {
//            photoImageView.image = UIImage(named: photo)
//        }
//    }

    init() {
        super.init(frame: .zero)
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

extension DetailCarView: CodeView {
    func buidViewHierarchy() {
        addSubview(detailView)
        principalStackView.addArrangedSubview(photoImageView)
        infolabelStackView.addArrangedSubview(nameInfoText)
        infolabelStackView.addArrangedSubview(typeInfoText)
        infolabelStackView.addArrangedSubview(descriptionInfoText)
        principalStackView.addArrangedSubview(infolabelStackView)
        principalStackView.addArrangedSubview(mapView)
        buttonStackView.addArrangedSubview(showVideoButton)
        principalStackView.addArrangedSubview(buttonStackView)
        detailView.addSubview(principalStackView)

    }

    func setupConstraints() {

        NSLayoutConstraint.activate([

            showVideoButton.heightAnchor.constraint(equalToConstant: 44),
            buttonStackView.widthAnchor.constraint(equalToConstant: 150),

            photoImageView.widthAnchor.constraint(equalTo: principalStackView.widthAnchor),
            photoImageView.heightAnchor.constraint(equalToConstant: 150),

            mapView.widthAnchor.constraint(equalTo: principalStackView.widthAnchor),
            mapView.heightAnchor.constraint(equalToConstant: 120),

            detailView.topAnchor.constraint(equalTo: self.topAnchor),
            detailView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            detailView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            detailView.bottomAnchor.constraint(equalTo: self.bottomAnchor),

            principalStackView.topAnchor.constraint(equalTo: detailView.topAnchor, constant: 80),
            principalStackView.leadingAnchor.constraint(equalTo: detailView.leadingAnchor, constant: 8),
            principalStackView.trailingAnchor.constraint(equalTo: detailView.trailingAnchor, constant: -8),
            principalStackView.bottomAnchor.constraint(equalTo: detailView.bottomAnchor, constant: -100)
        ])

    }

    func setupAdditionConfiguration() {
        showVideoButton.addTarget(self, action: #selector(showVideo), for: .touchUpInside)
    }

    @objc private func showVideo() {
        showVideoButton.backgroundColor = .white
        delegate?.showVideoDetail()
    }

}
