//
//  User.swift
//  Cars
//
//  Created by Suh on 02/12/22.
//

import Foundation

struct User: Codable {
    var id: Int
    var login: String
    var nome: String
    var email: String
    var urlFoto: String
    var token: String
    var roles: [String]
}
