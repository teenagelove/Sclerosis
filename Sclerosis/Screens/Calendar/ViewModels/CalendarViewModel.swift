//
//  CalendarViewModel.swift
//  Sclerosis
//
//  Created by AI Assistant on 02.10.2025.
//

import Foundation
import Observation

@MainActor
@Observable
final class CalendarViewModel {

    enum State {
        case loading
        case loaded
        case error(Error)
    }

    // Selected date for calendar (nil means show upcoming)
    var selectedDate: Date?
    private(set) var state: State = .loading
    private(set) var episodes: [Episode] = []
    private(set) var show: Show?

    // MARK: - Loading
    func loadEpisodes(isUpdate: Bool = false) async {
        switch (state, isUpdate) {
        case (.loaded, false):
            return
        case (.loaded, true):
            break
        default:
            state = .loading
        }

        do {
            // Simulate network delay
//            try await Task.sleep(for: .seconds(1.5))
//            let allMockEpisodes = Episode.MockEpisodes
//            self.episodes = allMockEpisodes
            episodes = try await TVMazeService.fetchEpisodes(forID: 2993)
            show = try await TVMazeService.fetchShow(url: episodes.first?.showURL)
            state = .loaded
        } catch {
            state = .error(error)
        }
    }
}

// MARK: - Derived Data
extension CalendarViewModel {

    var upcomingEpisodes: [Episode] {
        return episodes
            .filter { $0.releaseDate.startOfDay >= Date().startOfDay }
            .sorted { $0.releaseDate < $1.releaseDate }
    }

    var episodesForSelectedDate: [Episode] {
        guard let selectedDate else { return [] }
        return episodes
            .filter { $0.releaseDate.isSameDay(as: selectedDate) }
            .sorted { $0.releaseDate < $1.releaseDate }
    }

    var episodesToDisplay: [Episode] {
        selectedDate != nil ? episodesForSelectedDate : upcomingEpisodes
    }

    var markedDates: Set<Date> {
        let dates = upcomingEpisodes.map { $0.releaseDate.startOfDay }
        return Set(dates)
    }
}
