//
//  TVMazeEpisodeDTO+Map.swift
//  Sclerosis
//
//  Created by Danil Kazakov on 2025/12/02.
//

import Foundation

// MARK: - Mapping
extension TVMazeEpisodeDTO {
    var toDomain: Episode {
        Episode(
            id: String(id),
            name: name,
            showName: links.show.name,
            showURL: URL(string: links.show.href),
            releaseDate: airstamp
        )
    }
}
