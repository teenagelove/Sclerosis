//
//  TVMazeServiceTests.swift
//  SclerosisTests
//
//  Created by Danil Kazakov on 2025/12/02.
//

import Testing
@testable import Sclerosis

struct TVMazeServiceTests {

    @Test func `fetch real valid episodes`() async throws {
        // Given
        let showID = 1
//        let service = TVMazeService

        // When
        let episodes = try await TVMazeService.fetchEpisodes(forID: showID)

        // Then
        #expect(episodes.count > 0, "API should return more at least one episode")

        let firstEpisode = episodes.first!
        #expect(firstEpisode.name != "")

        
        await print(firstEpisode.id)
        await print(firstEpisode.name)
        await print(firstEpisode.showName)
        await print(firstEpisode.showURL!)
        await print(firstEpisode.releaseDate)
    }
}
