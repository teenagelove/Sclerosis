//
//  NetworkServiceProtocol.swift
//  Sclerosis
//
//  Created by Danil Kazakov on 2025/12/02.
//

protocol NetworkServiceProtocol {
    static func fetchEpisodes(forID showID: Int) async throws -> [Episode]
}
