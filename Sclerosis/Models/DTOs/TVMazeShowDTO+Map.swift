//
//  TVMazeShowDTO+Map.swift
//  Sclerosis
//
//  Created by Danil Kazakov on 02.12.2025.
//

import Foundation

extension TVMazeShowDTO {
    var toDomain: Show {
        Show(
            id: String(id),
            name: name,
            description: summary ?? "",
            cover: URL(string: image?.medium ?? ""),
//            seasons: [] // Seasons are fetched separately or not present in this response
        )
    }
}
