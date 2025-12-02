//
//  Episode.swift
//  Sclerosis
//
//  Created by Danil Kazakov on 22.09.2025.
//

import Foundation

struct Episode: Identifiable {
    let id: String
    let name: String
    let showName: String
    let showURL: URL?
    let releaseDate: Date
}
