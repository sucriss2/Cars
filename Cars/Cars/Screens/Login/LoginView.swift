//
//  LoginView.swift
//  Cars
//
//  Created by Suh on 28/11/22.
//

import UIKit

protocol LoginViewDelegate: AnyObject {
    func didTapLogin()
}

public final class LoginView: UIView, UITextFieldDelegate {

    private let mainView: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = .clear
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private let mainBackgroundImage: UIImageView = {
        let image = UIImageView(frame: .zero)
        image.image = UIImage(named: "login")
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()


    private let titleLabel: UILabel = {
        let view = UILabel(frame: .zero)
        view.text = "Carros"
        view.backgroundColor = .gray
        view.textAlignment = .center
        view.textColor = .black
        view.font = UIFont.boldSystemFont(ofSize: 30)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private let labeledStackView: UIStackView = {
        let view = UIStackView(frame: .zero)
        view.distribution = .fill
        view.axis = .vertical
        view.spacing = 6
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private let buttonStackView: UIStackView = {
        let view = UIStackView(frame: .zero)
        view.axis = .horizontal
        view.distribution = .equalCentering
        view.alignment = .fill
        view.spacing = 4
        view.isLayoutMarginsRelativeArrangement = true
        view.layoutMargins = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private let logIntoLabel: UILabel = {
        let view = UILabel(frame: .zero)
        view.text = "Manter Logado"
        view.textColor = .black
        view.font = UIFont.systemFont(ofSize: 12)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private let logSwitch: UISwitch = {
        let view = UISwitch(frame: .zero)
        view.onTintColor = .green
        view.isOn = false
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private let creatAccountStackView: UIStackView = {
        let view = UIStackView(frame: .zero)
        view.axis = .horizontal
        view.distribution = .fill
        view.alignment = .center
        view.isLayoutMarginsRelativeArrangement = true
        view.layoutMargins = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private let createAccountLabel: UILabel = {
        let view = UILabel(frame: .zero)
        view.text = "Ainda não tem cadastro?"
        view.textColor = .gray
        view.font = UIFont.systemFont(ofSize: 12)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private let loginButton: UIButton = {
        let view = UIButton(frame: .zero)
        view.backgroundColor = .black
        view.layer.cornerRadius = 8.0
        view.setAttributedTitle(
            NSAttributedString(
                string: "Login",
                attributes: [
                    NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 18.0),
                    NSAttributedString.Key.foregroundColor: UIColor.white
                ]
            ),
            for: .normal)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private let loginButtonStackView: UIStackView = {
        let view = UIStackView(frame: .zero)
        view.axis = .horizontal
        view.distribution = .fill
        view.alignment = .center
        view.isLayoutMarginsRelativeArrangement = true
        view.layoutMargins = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private let helpStackView: UIStackView = {
        let view = UIStackView(frame: .zero)
        view.axis = .horizontal
        view.distribution = .fill
        view.alignment = .fill
        view.spacing = 0
        view.isLayoutMarginsRelativeArrangement = true
        view.layoutMargins = UIEdgeInsets(top: 0, left: 100, bottom: 8, right: 100)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private let helpIconImage: UIImageView = {
        let view = UIImageView(frame: .zero)
        view.image = UIImage(systemName: "questionmark.circle.fill")
        view.tintColor = .systemBlue
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()


    private let loginTextFieldView = LabeledTextField(title: "Login", placeholder: "Digite seu login")
    private let passwordTextFieldView = LabeledTextField(title: "Senha", placeholder: "Digite sua senha")
    private let lostPasswordButton = UnderlinedButton(style: .primary)
    private let createAccountButton = UnderlinedButton(style: .primary)
    private let helpButton = UnderlinedButton(style: .primary)

    // MARK: - Public Properties
    weak var delegate: LoginViewDelegate?

    var userName: String {
        return loginTextFieldView.text ?? ""
    }

    var password: String {
        return passwordTextFieldView.text ?? ""
    }

    var startLoginButton: UIButton {
        return loginButton
    }

    var keepLogged: Bool {
        return logSwitch.isOn
    }

    // ----
    public init() {
        super.init(frame: .zero)
        setupView()
    }

    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

extension LoginView: CodeView {
    func buidViewHierarchy() {

        addSubview(mainBackgroundImage)
        addSubview(mainView)

        labeledStackView.addArrangedSubview(titleLabel)
        labeledStackView.addArrangedSubview(loginTextFieldView)
        labeledStackView.addArrangedSubview(passwordTextFieldView)

        buttonStackView.addArrangedSubview(logSwitch)
        buttonStackView.addArrangedSubview(logIntoLabel)
        buttonStackView.addArrangedSubview(UIView())
        buttonStackView.addArrangedSubview(lostPasswordButton)

        loginButtonStackView.addArrangedSubview(loginButton)

        creatAccountStackView.addArrangedSubview(createAccountLabel)
        creatAccountStackView.addArrangedSubview(UIView())
        creatAccountStackView.addArrangedSubview(createAccountButton)

        helpStackView.addArrangedSubview(helpButton)
        helpStackView.addArrangedSubview(helpIconImage)

        labeledStackView.addArrangedSubview(buttonStackView)
        labeledStackView.addArrangedSubview(loginButtonStackView)
        labeledStackView.addArrangedSubview(creatAccountStackView)
        labeledStackView.addArrangedSubview(helpStackView)

        mainView.addSubview(labeledStackView)
    }

    func setupConstraints() {

        NSLayoutConstraint.activate([

            titleLabel.heightAnchor.constraint(equalToConstant: 60),

            helpButton.widthAnchor.constraint(equalToConstant: 100),

            loginButton.heightAnchor.constraint(equalToConstant: 44),

            mainView.topAnchor.constraint(equalTo: self.topAnchor),
            mainView.leftAnchor.constraint(equalTo: self.leftAnchor),
            mainView.rightAnchor.constraint(equalTo: self.rightAnchor),
            mainView.bottomAnchor.constraint(equalTo: self.bottomAnchor),

            mainBackgroundImage.topAnchor.constraint(equalTo: self.topAnchor),
            mainBackgroundImage.leftAnchor.constraint(equalTo: self.leftAnchor),
            mainBackgroundImage.rightAnchor.constraint(equalTo: self.rightAnchor),
            mainBackgroundImage.bottomAnchor.constraint(equalTo: self.bottomAnchor),

            labeledStackView.leftAnchor.constraint(equalTo: mainView.leftAnchor, constant: 32),
            labeledStackView.rightAnchor.constraint(equalTo: mainView.rightAnchor, constant: -32),
            labeledStackView.centerYAnchor.constraint(equalTo: mainView.centerYAnchor)
        ])

    }

    func setupAdditionConfiguration() {
        lostPasswordButton.setTitle("Esqueci a senha", for: .normal)
        createAccountButton.setTitle("Criar uma conta", for: .normal)
        helpButton.setTitle("Ajuda    ", for: .normal)

        loginButton.addTarget(self, action: #selector(executeLogin), for: .touchUpInside)
    }

    @objc private func executeLogin() {
        loginButton.backgroundColor = .systemTeal
        delegate?.didTapLogin()

    }

}
