//
//  User.swift
//  AppCarros
//
//  Created by Suh on 03/11/22.
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
