//
//  UserSession.swift
//  Cars
//
//  Created by Suh on 02/12/22.
//

import Foundation

class UserSession: Codable {
    static let shared = UserSession()

    private(set) var user: User?

    var token: String {
        return user?.token ?? ""
    }

    var bearerToken: String {
        return "Bearer \(token)"
    }

    private init() {}

    func set(user: User?) {
        self.user = user
    }

}
