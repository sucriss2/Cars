//
//  DetailCarViewController.swift
//  Cars
//
//  Created by Suh on 01/12/22.
//

import UIKit

class DetailCarViewController: UIViewController {

    let screen = DetailCarView()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .cyan
        self.view = screen

    }


}
