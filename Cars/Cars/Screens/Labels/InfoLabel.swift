//
//  InfoLabel.swift
//  Cars
//
//  Created by Suh on 01/12/22.
//

import UIKit

final class InfoLabel: UIView {

    let textLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = ""
        label.textColor = .black
        label.textAlignment = .right
        label.font = .systemFont(ofSize: 12, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let subTextLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = ""
        label.textColor = .black
        label.numberOfLines = 5
        label.font = .systemFont(ofSize: 10, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let labelStackView: UIStackView = {
        let view = UIStackView(frame: .zero)
        view.axis = .horizontal
        view.backgroundColor = .blue
        view.spacing = 16
        view.distribution = .fillEqually
        view.alignment = .fill
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    let text: String
    let subText: String

    init(text: String, subText: String) {
        self.text = text
        self.subText = subText
        super.init(frame: .zero)
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

extension InfoLabel: CodeView {
    func buidViewHierarchy() {
        labelStackView.addArrangedSubview(textLabel)
        labelStackView.addArrangedSubview(subTextLabel)
        addSubview(labelStackView)
    }

    func setupConstraints() {

        NSLayoutConstraint.activate([
            labelStackView.topAnchor.constraint(equalTo: self.topAnchor),
            labelStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            labelStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            labelStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])

    }

    func setupAdditionConfiguration() {
        textLabel.text = text
        subTextLabel.text = subText
    }


}
