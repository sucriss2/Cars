//
//  DetailCarView.swift
//  Cars
//
//  Created by Suh on 01/12/22.
//

import UIKit

public final class DetailCarView: UIView {

    let detailView: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = .systemGray6
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    let titleLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = "Detalhes"
        label.textColor = .black
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let photoImageView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.image = UIImage(named: "placeholder")
        imageView.contentMode = .scaleToFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    let photoImageView2: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.image = UIImage(named: "placeholder")
        imageView.contentMode = .scaleToFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    let principalStackView: UIStackView = {
        let view = UIStackView(frame: .zero)
        view.axis = .vertical
        view.distribution = .equalSpacing
        view.spacing = 16
        view.alignment = .center
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    let infolabelStackView: UIStackView = {
        let view = UIStackView(frame: .zero)
        view.axis = .vertical
        view.spacing = 8
        view.distribution = .fill
        view.contentMode = .scaleToFill
        view.isLayoutMarginsRelativeArrangement = true
        view.layoutMargins = UIEdgeInsets(top: 8, left: 16, bottom: 8, right: 16)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    let showVideoButton: UIButton = {
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

    let buttonStackView: UIStackView = {
        let view = UIStackView(frame: .zero)
        view.axis = .horizontal
        view.distribution = .fill
        view.alignment = .center
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    let nameInfoText = InfoLabel(text: "nome", subText: "Ferrari")
    let typeInfoText = InfoLabel(text: "tipo", subText: "Ferrari")
    let descriptionInfoText = InfoLabel(text: "descrição", subText: "Hghkfutsrtseaathh  a jsgfoqbsuoc  ")
    let mapView = MapView()

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
        detailView.addSubview(titleLabel)
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
            buttonStackView.widthAnchor.constraint(equalToConstant: 150)
        ])

        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: detailView.safeAreaLayoutGuide.topAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: detailView.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: detailView.safeAreaLayoutGuide.trailingAnchor, constant: -20)
        ])

        NSLayoutConstraint.activate([
            photoImageView.widthAnchor.constraint(equalTo: principalStackView.widthAnchor),
            photoImageView.heightAnchor.constraint(equalToConstant: 100)
        ])

        NSLayoutConstraint.activate([
            mapView.widthAnchor.constraint(equalTo: principalStackView.widthAnchor),
            mapView.heightAnchor.constraint(equalToConstant: 150)
        ])

        NSLayoutConstraint.activate([
            detailView.topAnchor.constraint(equalTo: self.topAnchor),
            detailView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            detailView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            detailView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])

        NSLayoutConstraint.activate([
            principalStackView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 30),
            principalStackView.leadingAnchor.constraint(equalTo: detailView.leadingAnchor),
            principalStackView.trailingAnchor.constraint(equalTo: detailView.trailingAnchor),
            principalStackView.bottomAnchor.constraint(equalTo: detailView.bottomAnchor, constant: -70)
        ])

    }

    func setupAdditionConfiguration() {

    }


}
