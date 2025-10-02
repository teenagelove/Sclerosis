//
//  Season+Mock.swift
//  Sclerosis
//
//  Created by Danil Kazakov on 02.10.2025.
//

import Foundation

extension Season {
    // MARK: - Individual Season Mocks
    static let bbSeason1Mock = Season(episodes: [
        Episode.bbPilotEpisode,
        Episode.bbWalletOrLifeEpisode
    ])
    static let bbSeason2Mock = Season(episodes: [
        Episode.bbSevenThirtySevenEpisode,
        Episode.bbGrippyEpisode
    ])
    static let gotSeason1Mock = Season(episodes: [
        Episode.gotWinterIsComingEpisode,
        Episode.gotKingsroadEpisode
    ])
    static let chernobylSeason1Mock = Season(episodes: [
        Episode.chernobylOneTwentyThreeFortyFiveEpisode,
        Episode.chernobylStayCalmEpisode
    ])

    /// Набор всех моковых сезонов.
    static let allMockSeasons: [Season] = [
        .bbSeason1Mock,
        .bbSeason2Mock,
        .gotSeason1Mock,
        .chernobylSeason1Mock
    ]
}
