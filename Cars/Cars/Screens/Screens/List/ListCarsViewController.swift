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
        tableView.isScrollEnabled = false
        tableView.separatorStyle = .singleLine
        tableView.separatorColor = .white
        //tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
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
        return 10
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: "cell", for: indexPath)
//        ) as? ListCarsTableViewCell else {
//            fatalError()
//        }
        cell.textLabel?.text = "Hello World"
        return cell
    }





}
