//
//  ListCarsViewController.swift
//  Cars
//
//  Created by Suh on 30/11/22.
//

import UIKit

class ListCarsViewController: UIViewController {

    lazy var tableview: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.scrollsToTop = true
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(ListCarsTableViewCell.self, forCellReuseIdentifier: ListCarsTableViewCell.identifier)
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableview.backgroundColor = .purple
        view.addSubview(tableview)
        configConstraints()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableview.frame = view.bounds
    }

    private func configConstraints() {
        NSLayoutConstraint.activate([
            self.tableview.topAnchor.constraint(equalTo: self.view.topAnchor),
            self.tableview.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.tableview.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            self.tableview.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])
    }

}

extension ListCarsViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 15
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: ListCarsTableViewCell.identifier, for: indexPath
        ) as? ListCarsTableViewCell else {
            fatalError()
        }
        cell.configure(
            name: "Custom + \(indexPath.row+1)",
            photo: indexPath.row % 2 == 0 ? "placeholder" : "car")
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }





}
