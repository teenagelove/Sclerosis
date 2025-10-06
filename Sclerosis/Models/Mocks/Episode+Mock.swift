//
//  Episode+Mock.swift
//  Sclerosis
//
//  Created by Danil Kazakov on 02.10.2025.
//

import Foundation

extension Episode {
    private static let calendar = Calendar.current
    private static let today = calendar.startOfDay(for: Date()) // Игнорируем время, чтобы даты были только днями

    /// Вспомогательная функция для создания даты из компонентов (для старых, фиксированных дат)
    private static func makeDate(_ year: Int, _ month: Int, _ day: Int) -> Date {
        var comps = DateComponents()
        comps.year = year
        comps.month = month
        comps.day = day
        return calendar.date(from: comps) ?? Date()
    }

    /// Вспомогательная функция для создания даты, отступающей на X дней от сегодняшней
    private static func makeDateFromToday(addingDays days: Int) -> Date {
        calendar.date(byAdding: .day, value: days, to: today) ?? today
    }

    // MARK: - Individual Episode Mocks
    static let bbPilotEpisode = Episode(name: "Пилот", showName: "Во все тяжкие", releaseDate: makeDateFromToday(addingDays: 1))
    static let bbWalletOrLifeEpisode = Episode(name: "Кошелек или жизнь", showName: "Во все тяжкие", releaseDate: makeDateFromToday(addingDays: 2))
    static let bbSevenThirtySevenEpisode = Episode(name: "Семь тридцать семь", showName: "Во все тяжкие", releaseDate: makeDateFromToday(addingDays: 3))
    static let bbGrippyEpisode = Episode(name: "Гриппозный", showName: "Во все тяжкие", releaseDate: makeDate(2009, 3, 15))

    static let gotWinterIsComingEpisode = Episode(name: "Зима близко", showName: "Игра престолов", releaseDate: makeDate(2011, 4, 17))
    static let gotKingsroadEpisode = Episode(name: "Дорога королей", showName: "Игра престолов", releaseDate: makeDate(2011, 4, 24))

    static let chernobylOneTwentyThreeFortyFiveEpisode = Episode(name: "1:23:45", showName: "Чернобыль", releaseDate: makeDate(2019, 5, 6))
    static let chernobylStayCalmEpisode = Episode(name: "Пожалуйста, оставайтесь спокойны", showName: "Чернобыль", releaseDate: makeDate(2019, 5, 13))
}

extension Episode {
    /// Плоский список всех моковых эпизодов из `allMockSeasons`.
    static let MockEpisodes: [Episode] = Season.allMockSeasons.flatMap { $0.episodes }
}
