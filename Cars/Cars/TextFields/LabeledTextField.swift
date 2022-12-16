//
//  LabeledTextField.swift
//  Cars
//
//  Created by Suh on 28/11/22.
//

import UIKit

final class LabeledTextField: UIView {

    private let textLabel: UILabel = {
        let view = UILabel(frame: .zero)
        view.text = ""
        view.textColor = .black
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private let textField: UITextField = {
        let view = UITextField(frame: .zero)
        view.text = ""
        view.placeholder = ""
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private let separetorView: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = .systemGray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private let viewStack: UIStackView = {
        let view = UIStackView(frame: .zero)
        view.backgroundColor = .white
        view.distribution = .fillEqually
        view.alignment = .leading
        view.axis = .vertical
        view.spacing = 8
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    let title: String
    let placeholder: String

    var text: String? {
        get {
            return textField.text
        }

        set {
            textField.text = newValue
        }
    }

    init(title: String, placeholder: String) {
        self.title = title
        self.placeholder = placeholder
        super.init(frame: .zero)
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

extension LabeledTextField: CodeView {
    func buidViewHierarchy() {
        viewStack.addArrangedSubview(textLabel)
        viewStack.addArrangedSubview(textField)
        addSubview(viewStack)
        addSubview(separetorView)
    }

    func setupConstraints() {
        self.backgroundColor = .white

        NSLayoutConstraint.activate([
            viewStack.topAnchor.constraint(equalTo: self.topAnchor, constant: 8),
            viewStack.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16),
            viewStack.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -16),
            viewStack.bottomAnchor.constraint(equalTo: separetorView.topAnchor, constant: -8),

            separetorView.heightAnchor.constraint(equalToConstant: 2),
            separetorView.leftAnchor.constraint(equalTo: self.leftAnchor),
            separetorView.rightAnchor.constraint(equalTo: self.rightAnchor),
            separetorView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])

    }

    func setupAdditionConfiguration() {
        textLabel.text = title
        textField.placeholder = placeholder
    }

}
