//
//  LoadingView.swift
//  Cars
//
//  Created by Suh on 08/12/22.
//

import UIKit

final class LoadingViewController: UIViewController {

    private let viewLoading: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = .lightGray
        view.alpha = 0.2
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private let containerView: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = .lightGray
        view.alpha = 0.8
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private let loadingIndicator: UIActivityIndicatorView = {
        let view = UIActivityIndicatorView(frame: .zero)
        view.startAnimating()
        view.color = .red
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    init() {
        super.init(nibName: nil, bundle: nil)
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .clear
        viewLoading.backgroundColor = UIColor.gray.withAlphaComponent(0.8)
        containerView.layer.cornerRadius = 8.0
        containerView.layer.masksToBounds = true
    }
}

extension LoadingViewController: CodeView {
    func buidViewHierarchy() {
        containerView.addSubview(loadingIndicator)

        view.addSubview(viewLoading)
        view.addSubview(containerView)
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            viewLoading.topAnchor.constraint(equalTo: self.view.topAnchor),
            viewLoading.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            viewLoading.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            viewLoading.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            containerView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            containerView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            containerView.heightAnchor.constraint(equalToConstant: 90),
            containerView.widthAnchor.constraint(equalToConstant: 90),

            loadingIndicator.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            loadingIndicator.centerYAnchor.constraint(equalTo: containerView.centerYAnchor)
        ])
    }

    func setupAdditionConfiguration() {

    }
}
