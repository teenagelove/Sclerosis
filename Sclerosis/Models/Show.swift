//
//  Show.swift
//  Sclerosis
//
//  Created by Danil Kazakov on 22.09.2025.
//

import Foundation

struct Show: Identifiable {
    let id = UUID()
    let name: String
    let description: String
    let cover: URL
    let seasons: [Season]
}
