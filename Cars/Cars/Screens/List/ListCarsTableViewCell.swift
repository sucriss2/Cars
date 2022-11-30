//
//  ListCarsTableViewCell.swift
//  Cars
//
//  Created by Suh on 30/11/22.
//

import UIKit

class ListCarsTableViewCell: UITableViewCell {

    static let identifier = "ListCarsTableViewCell"

//    let listCellView: ListCarstCellView = {
//        let view = ListCarstCellView()
//        view.translatesAutoresizingMaskIntoConstraints = false
//        return view
//    }()

    lazy var nameLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Nome do Carro"
        label.textColor = .black
        label.font = .systemFont(ofSize: 18, weight: .bold)
        label.backgroundColor = .white
        return label
    }()

    let photoImageView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.image = UIImage(named: "placeholder")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .cyan
        contentView.addSubview(photoImageView)
        contentView.addSubview(nameLabel)
        backgroundColor = .lightGray
        configConstraints()
    }

    private func configConstraints() {
        
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: self.topAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: photoImageView.trailingAnchor),
            nameLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            nameLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])

        NSLayoutConstraint.activate([
            photoImageView.widthAnchor.constraint(equalTo: self.heightAnchor),
            photoImageView.topAnchor.constraint(equalTo: self.topAnchor),
            photoImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            //photoImageView.trailingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            photoImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
