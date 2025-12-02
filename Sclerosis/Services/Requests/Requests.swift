//
//  Requests.swift
//  Sclerosis
//
//  Created by Danil Kazakov on 2025/12/02.
//

import Foundation

enum Requests {
    enum EpisodeById {
        static func getUrl(for id: Int) -> URL? {
            URL(string: "\(RequestConstants.baseURL)/shows/\(id)/episodes")
        }
    }
}
