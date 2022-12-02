//
//  Request.swift
//  AppCarros
//
//  Created by Suh on 03/11/22.
//

import Foundation

enum RequestMethod: String {
    case get = "GET"
    case post = "POST"
}

struct Request {
    var baseURL: String
    var path: String
    var method: RequestMethod
    var header: [String: String]
    var body: Data?
}
