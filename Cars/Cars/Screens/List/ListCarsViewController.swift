//
//  ListCarsViewController.swift
//  Cars
//
//  Created by Suh on 30/11/22.
//

import UIKit

protocol ListCarsViewControllerDelegate: AnyObject {
    func showDetailCar(car: Car)
}

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

    weak var delegate: ListCarsViewControllerDelegate?
    var model: ListCarsModel?
    var cars: [Car] {
        model?.cars ?? []
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Carros"
        tableview.backgroundColor = .white
        view.addSubview(tableview)
        configConstraints()
        model?.load()
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
        return cars.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: ListCarsTableViewCell.identifier, for: indexPath
        ) as? ListCarsTableViewCell else {
            fatalError()
        }
        let car = cars[indexPath.row]
        cell.configure(model: car)
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let car = cars[indexPath.row]
        delegate?.showDetailCar(car: car)
    }

}

extension ListCarsViewController: ListCarsModelDelegate {
    func didLoadSucess() {
        DispatchQueue.main.async {
            self.tableview.reloadData()
        }
    }

    func didError(message: String) {
        DispatchQueue.main.async {
            print(message)
        }
    }

}

