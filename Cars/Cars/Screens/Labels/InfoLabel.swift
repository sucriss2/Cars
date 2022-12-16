//
//  InfoLabel.swift
//  Cars
//
//  Created by Suh on 01/12/22.
//

import UIKit

final class InfoLabel: UIView {

    private lazy var textLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.textColor = .black
        label.numberOfLines = 0
        label.textAlignment = .right
        label.font = .systemFont(ofSize: 17, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var subTextLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.textColor = .black
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 17, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    var title: String {
        didSet {
            textLabel.text = title
        }
    }

    var subtitle: String {
        didSet {
            subTextLabel.text = subtitle
        }
    }

    init(title: String, subtitle: String) {
        self.title = title
        self.subtitle = subtitle
        super.init(frame: .zero)
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

extension InfoLabel: CodeView {
    func buidViewHierarchy() {
        addSubview(textLabel)
        addSubview(subTextLabel)
    }

    func setupConstraints() {

        NSLayoutConstraint.activate([
            textLabel.widthAnchor.constraint(equalToConstant: 100),
            textLabel.topAnchor.constraint(equalTo: self.topAnchor),
            textLabel.leftAnchor.constraint(equalTo: self.leftAnchor),
            textLabel.bottomAnchor.constraint(lessThanOrEqualTo: self.bottomAnchor),

            subTextLabel.topAnchor.constraint(equalTo: textLabel.topAnchor),
            subTextLabel.rightAnchor.constraint(equalTo: self.rightAnchor),
            subTextLabel.bottomAnchor.constraint(lessThanOrEqualTo: self.bottomAnchor),
            subTextLabel.leftAnchor.constraint(equalTo: textLabel.rightAnchor, constant: 8.0)
        ])

    }

    func setupAdditionConfiguration() {
        textLabel.text = title
        subTextLabel.text = subtitle

    }

}
