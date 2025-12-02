//
//  TVMazeService.swift
//  Sclerosis
//
//  Created by Danil Kazakov on 2025/12/02.
//

import Foundation

struct TVMazeService: NetworkServiceProtocol {
    static let decoder = JSONDecoder()
    static let session = URLSession.shared

    static func fetchEpisodes(forID showID: Int) async throws -> [Episode] {
        guard let url = Requests.EpisodeById.getUrl(for: showID) else {
            throw URLError(.badURL)
        }

        let (data, response) = try await session.data(from: url)

        guard let httpResponse = response as? HTTPURLResponse,
              (200..<300).contains(httpResponse.statusCode) else {
            throw URLError(.badServerResponse)
        }

        decoder.dateDecodingStrategy = .iso8601
        
        let dtos = try decoder.decode([TVMazeEpisodeDTO].self, from: data)
        return dtos.map { $0.toDomain }
    }

    static func fetchShow(url: URL?) async throws -> Show {
        guard let url else { throw URLError(.badURL) }

        let (data, response) = try await session.data(from: url)

        guard let httpResponse = response as? HTTPURLResponse,
              (200..<300).contains(httpResponse.statusCode) else {
            throw URLError(.badServerResponse)
        }

        let dto = try decoder.decode(TVMazeShowDTO.self, from: data)
        return dto.toDomain
    }
}
