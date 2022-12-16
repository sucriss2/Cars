//
//  Request.swift
//  Cars
//
//  Created by Suh on 02/12/22.
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
