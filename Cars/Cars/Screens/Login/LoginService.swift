//
//  LoginService.swift
//  Cars
//
//  Created by Suh on 08/12/22.
//

import Foundation

struct LoginService {
    private let network: Network

    init(network: Network = Network.shared) {
        self.network = network
    }

    func login(
        username: String,
        password: String,
        onComplete: @escaping (User) -> Void,
        onError: @escaping (Error) -> Void
    ) {
        let credentials = Login(username: username, password: password)
        do {
            let encoder = JSONEncoder()
            let credentialsData = try encoder.encode(credentials)

            let header: [String: String] = [
                "Content-Type": "text/plain",
                "Accept": "*/*"
            ]

            let request = Request(
                baseURL: Config.baseURL,
                path: "login",
                method: RequestMethod.post,
                header: header,
                body: credentialsData
            )

            network.request(request: request, returning: User.self) { result in
                switch result {
                case .failure(let error):
                    onError(error)
                case .success(let user):
                    guard let user = user else {
                        return
                    }
                    onComplete(user)
                }
            }
        } catch {
            onError(error)
        }
    }


}
