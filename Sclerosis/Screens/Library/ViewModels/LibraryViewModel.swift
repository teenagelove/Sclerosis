//
//  LibraryViewModel.swift
//  Sclerosis
//
//  Created by Danil Kazakov on 22.09.2025.
//

import Foundation
import Observation

@MainActor
@Observable
final class LibraryViewModel {

    enum State {
        case loading
        case loaded([Show])
        case error(Error)
    }

    var filter = "" {
        didSet { scheduleFilter() }
    }

    private(set) var state: State = .loading
    private var shows: [Show] = []
    private var filterTask: Task<Void, Never>?

    func loadShows(isUpdate: Bool = false) async {
        switch (state, isUpdate) {
        case (.loaded, false):
            return

        case (.loaded, true):
            filter = ""

        default:
            state = .loading
        }

        do {
            try await Task.sleep(for: .seconds(2))
            let shows = Show.MockShows
            self.shows = shows
            state = .loaded(shows)
        } catch {
            state = .error(error)
        }
    }

    func deleteShow(_ show: Show) {
        if let index = shows.firstIndex(where: { $0.id == show.id }) {
            shows.remove(at: index)
        }
    }
}

// MARK: - Private Methods
private extension LibraryViewModel {
    var trimmedText: String { filter.trimmingCharacters(in: .whitespacesAndNewlines) }

    func scheduleFilter() {
        if case .loading = state { return }
        guard !trimmedText.isEmpty else {
            state = .loaded(shows)
            return
        }

        filterTask?.cancel()

        filterTask = Task { [weak self] in
            try? await Task.sleep(for: .seconds(1))
            guard !Task.isCancelled else { return }
            self?.filterShows()
        }
    }

    func filterShows() {
        let filteredShows = shows.filter { $0.name.localizedCaseInsensitiveContains(trimmedText) }
        state = .loaded(filteredShows)
    }
}
