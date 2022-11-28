//
//  Coordinator.swift
//  Cars
//
//  Created by Suh on 28/11/22.
//

import UIKit

protocol Coordinator {
    var navigationController: UINavigationController! { get set }
    func start()
}
 
