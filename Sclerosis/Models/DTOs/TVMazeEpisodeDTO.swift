//
//  TVMazeEpisodeDTO.swift
//  Sclerosis
//
//  Created by Danil Kazakov on 02.12.2025.
//

import Foundation

struct TVMazeEpisodeDTO: Decodable {
    struct Links: Decodable {
        let show: ShowLink
    }

    struct ShowLink: Decodable {
        let href: String
        let name: String
    }

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case airstamp
        case links = "_links"
    }

    let id: Int
    let name: String
    let airstamp: Date
    let links: Links
}
