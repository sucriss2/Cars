//
//  ListCarsService.swift
//  Cars
//
//  Created by Suh on 12/12/22.
//

import Foundation

struct ListCarsService {
    private var network: Network
    private var userSession: UserSession

    init(network: Network = Network.shared, userSession: UserSession = UserSession.shared) {
        self.network = network
        self.userSession = userSession
    }

    func loadList(
        onComplete: @escaping ([Car]) -> Void,
        onError: @escaping (Error) -> Void
    ) {

        let header: [String: String] = [
            "Content-Type": "text/plain",
            "Accept": "*/*",
            "Authorization": userSession.bearerToken
        ]

        let request = Request(
            baseURL: Config.baseURL,
            path: "carros",
            method: .get,
            header: header
        )

        network.request(request: request, returning: [Car].self) { result in
            switch result {
            case .failure(let error):
                onError(error)
            case .success(let cars):
                onComplete(cars ?? [])
            }
        }

    }

}
