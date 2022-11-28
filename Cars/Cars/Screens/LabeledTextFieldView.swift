//
//  LabeledTextFieldView.swift
//  Cars
//
//  Created by Suh on 28/11/22.
//

import UIKit

final class LabeledTextFieldView: UIView {

    lazy var textLabel: UILabel = {
        let view = UILabel(frame: .zero)
        view.text = ""
        view.textColor = .black
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    lazy var textField: UITextField = {
        let view = UITextField(frame: .zero)
        view.placeholder = ""
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    lazy var separetorView: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = .systemGray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    lazy var viewStack: UIStackView = {
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

extension LabeledTextFieldView: CodeView {
    func buidViewHierarchy() {
        viewStack.addArrangedSubview(textLabel)
        viewStack.addArrangedSubview(textField)
        addSubview(viewStack)
        addSubview(separetorView)
    }

    func setupConstraints() {
        self.backgroundColor = .white


//        viewStack.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
//        viewStack.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16).isActive = true
//        viewStack.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -16).isActive = true
//        viewStack.bottomAnchor.constraint(equalTo: separetorView.topAnchor,constant: -8).isActive = true
//
//        separetorView.heightAnchor.constraint(equalToConstant: 2).isActive = true
//        separetorView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
//        separetorView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
//        separetorView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true

        NSLayoutConstraint.activate([
            viewStack.topAnchor.constraint(equalTo: self.topAnchor),
            viewStack.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16),
            viewStack.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -16),
            viewStack.bottomAnchor.constraint(equalTo: separetorView.topAnchor,constant: -8),

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
