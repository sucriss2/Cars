//
//  ListCarstCellView.swift
//  Cars
//
//  Created by Suh on 30/11/22.
//

import UIKit

class ListCarstCellView: UIView {

    let photoImage: UIImageView = {
        let view = UIImageView(frame: .zero)
        view.image = UIImage(named: "placeholder")
        view.tintColor = .systemBlue
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    lazy var nameLabel: UILabel = {
        let view = UILabel(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "Nome do Carro"
        view.textColor = .black
        view.backgroundColor = .white
        return view
    }()

    lazy var listStackView: UIStackView = {
        let view = UIStackView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.spacing = 0
        view.axis = .horizontal
        view.distribution = .fill
        view.layoutMargins = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        return view
    }()

    init() {
        super.init(frame: .zero)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}


