//
//  Car.swift
//  AppCarros
//
//  Created by Suh on 07/11/22.
//
// swiftlint:disable line_length

import Foundation

struct Car: Codable {
    var id: Int
    var name: String
    var type: String
    var description: String?
    var urlPhoto: String?
    var urlVideo: String?
    var latitude: String?
    var longitude: String?

    enum CodingKeys: String, CodingKey {
        case id, urlVideo, latitude, longitude
        case name = "nome"
        case type = "tipo"
        case description = "descricao"
        case urlPhoto = "urlFoto"
    }

}

#if DEBUG
extension Car {
    static func fixture(
        id: Int = 13381,
        name: String = "Ferrari FF",
        type: String = "esportivos",
        description: String? = "Desc Maserati Grancabrio Sport",
        urlPhoto: String? = "https://s3-sa-east-1.amazonaws.com/videos.livetouchdev.com.br/esportivos/Maserati_Grancabrio_Sport.png",
        urlVideo: String? = "https://s3-sa-east-1.amazonaws.com/videos.livetouchdev.com.br/esportivos/renault_megane.mp4",
        latitude: String? = nil,
        longitude: String? = nil
    ) -> Car {
        Car(id: id, name: name, type: type, description: description, urlPhoto: urlPhoto, urlVideo: urlVideo, latitude: latitude, longitude: longitude)
    }
}
#endif
