//
//  Show+Mock.swift
//  Sclerosis
//
//  Created by Danil Kazakov on 22.09.2025.
//

import Foundation

extension Show {
    /// Набор мок-данных для превью/тестов, соответствующий моделям `Show`, `Season`, `Episode`.
    static let MockShows: [Show] = {
        return [
            Show(
                id: "1",
                name: "Во все тяжкие",
                description: "Учитель химии становится варщиком метамфетамина, чтобы обеспечить семью.",
                cover: URL(string: "https://static.tvmaze.com/uploads/images/medium_portrait/501/1253519.jpg"),
//                seasons: [Season.bbSeason1Mock, Season.bbSeason2Mock]
            ),
            Show(
                id: "2",
                name: "Игра престолов",
                description: "Битва за Железный трон и судьбу Семи Королевств.",
                cover: URL(string: "https://avatars.mds.yandex.net/get-kinopoisk-image/1777765/dd78edfd-6a1f-486c-9a86-6acbca940418/600x900"),
//                seasons: [Season.gotSeason1Mock]
            ),
            Show(
                id: "3",
                name: "Чернобыль",
                description: "Драматизация событий вокруг аварии на ЧАЭС 1986 года.",
                cover: URL(string: "https://avatars.mds.yandex.net/get-kinopoisk-image/1600647/3d0b4a89-acd9-49ac-a83e-480c18c41baa/600x900"),
//                seasons: [Season.chernobylSeason1Mock]
            )
        ]
    }()

    static let MockShow = MockShows[0]
}
