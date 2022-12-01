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
        label.backgroundColor = .red
        label.font = .systemFont(ofSize: 20, weight: .semibold)
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
        view.backgroundColor = .brown
        view.spacing = 16
        view.alignment = .center
        view.isLayoutMarginsRelativeArrangement = true
        view.layoutMargins = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    let infolabelStackView: UIStackView = {
        let view = UIStackView(frame: .zero)
        view.axis = .vertical
        view.backgroundColor = .yellow
        view.spacing = 8
        view.distribution = .fill
        view.isLayoutMarginsRelativeArrangement = true
        view.layoutMargins = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    let nameInfoText = InfoLabel(text: "Nome", subText: "Ferrari")
    let typeInfoText = InfoLabel(text: "Nome2", subText: "Ferrari")
    let descriptionInfoText = InfoLabel(text: "Nome3", subText: "hghkfutsrtseaathh  a jsgfoqbsuoc zjbciuabvousfgajosbdf auiebufogaoihfhsihgpis fniheroihioheifaehiofhoieh nn ihnf ih woieh oiheoig hioe oi o hohohohowoihoi  uwehoiwtoihoigwg ")

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

        principalStackView.addArrangedSubview(titleLabel)
        principalStackView.addArrangedSubview(photoImageView)
        infolabelStackView.addArrangedSubview(nameInfoText)
        infolabelStackView.addArrangedSubview(typeInfoText)
        infolabelStackView.addArrangedSubview(descriptionInfoText)

        principalStackView.addArrangedSubview(infolabelStackView)
        principalStackView.addArrangedSubview(photoImageView2)


        detailView.addSubview(principalStackView)


    }

    func setupConstraints() {

        NSLayoutConstraint.activate([
            photoImageView.widthAnchor.constraint(equalTo: principalStackView.widthAnchor),
            photoImageView.heightAnchor.constraint(equalToConstant: 100)
        ])

        NSLayoutConstraint.activate([
            photoImageView2.widthAnchor.constraint(equalTo: principalStackView.widthAnchor),
            photoImageView2.heightAnchor.constraint(equalToConstant: 100)
        ])

        NSLayoutConstraint.activate([
            detailView.topAnchor.constraint(equalTo: self.topAnchor),
            detailView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            detailView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            detailView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])

        NSLayoutConstraint.activate([
            principalStackView.leadingAnchor.constraint(equalTo: detailView.leadingAnchor, constant: 16),
            principalStackView.trailingAnchor.constraint(equalTo: detailView.trailingAnchor, constant: -16),
            principalStackView.centerYAnchor.constraint(equalTo: detailView.centerYAnchor, constant: -70)
        ])

    }

    func setupAdditionConfiguration() {

    }


}
