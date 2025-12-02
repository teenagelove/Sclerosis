//
//  TVMazeShowDTO.swift
//  Sclerosis
//
//  Created by Danil Kazakov on 02.12.2025.
//

import Foundation

struct TVMazeShowDTO: Codable {
    let id: Int
    let name: String
    let summary: String?
    let image: Image?
    
    struct Image: Codable {
        let medium: String
        let original: String
    }
}
