//
//  ListCarsTableViewCell.swift
//  Cars
//
//  Created by Suh on 30/11/22.
//

import UIKit

class ListCarsTableViewCell: UITableViewCell {

    static let identifier = "ListCarsTableViewCell"

    lazy var nameLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = ""
        label.textColor = .black
        label.numberOfLines = 2
        label.font = .systemFont(ofSize: 18, weight: .semibold)
        label.backgroundColor = .white
        return label
    }()

    let photoImageView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.image = UIImage(named: "placeholder")
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    let cellStackView: UIStackView = {
        let view = UIStackView(frame: .zero)
        view.distribution = .fill
        view.axis = .horizontal
        view.spacing = 16
        view.backgroundColor = .white
        view.isLayoutMarginsRelativeArrangement = true
        view.layoutMargins = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()


    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .cyan
        cellStackView.addArrangedSubview(photoImageView)
        cellStackView.addArrangedSubview(nameLabel)
        contentView.addSubview(cellStackView)
        backgroundColor = .lightGray
        configConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public func configure(name: String, photo: String) {
        nameLabel.text = name
        photoImageView.image = UIImage(named: photo)
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        nameLabel.text = nil
        photoImageView.image = nil
    }

    private func configConstraints() {

        photoImageView.widthAnchor.constraint(equalTo: self.heightAnchor).isActive = true

        NSLayoutConstraint.activate([
            cellStackView.topAnchor.constraint(equalTo: self.topAnchor),
            cellStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            cellStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            cellStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])

    }

}
