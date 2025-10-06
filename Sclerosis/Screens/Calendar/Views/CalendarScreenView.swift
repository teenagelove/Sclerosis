//
//  CalendarScreenView.swift
//  Sclerosis
//
//  Created by Danil Kazakov on 28.09.2025.
//

import SwiftUI

struct CalendarScreenView: View {
    @State private var viewModel = CalendarViewModel()

    var body: some View {
        NavigationStack { content }
            .task { await viewModel.loadEpisodes() }
            .refreshable { await viewModel.loadEpisodes(isUpdate: true) }
    }
}

private extension CalendarScreenView {
    // MARK: - Content
    @ViewBuilder
    var content: some View {
        Group {
            switch viewModel.state {
            case .loading:
                LoadingView()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            case .loaded:
                List {
                    calendarSection
                    episodesSection
                }
            case .error(let error):
                ErrorView(
                    message: error.localizedDescription,
                    action: { Task { await viewModel.loadEpisodes() } }
                )
            }
        }
    }

    // MARK: - Sections
    var calendarSection: some View {
        Section {
            CalendarView(
                markedDates: viewModel.markedDates,
                selectedDate: $viewModel.selectedDate
            )
        } header: {
            Text(.calendarTitle)
                .font(.largeTitle.bold())
                .foregroundStyle(.title)
        }
    }

    var episodesSection: some View {
        Group {
            if viewModel.episodesToDisplay.isEmpty {
                ContentUnavailableView(
                    .emptyStateTitle,
                    systemImage: SFSymbols.calendar,
                    description: Text(String(localized: .emptyStateTitle))
                )
            } else {
                ForEach(
                    Array(viewModel.episodesToDisplay).enumerated(),
                    id: \.element.id
                ) { index, episode in
                    Section {
                        EpisodeRowView(episode: episode)
                            .listRowInsets(EdgeInsets())
                    } header: {
                        if let selectedDate = viewModel.selectedDate {
                            Text(selectedDate.weekdayName)
                                .font(.largeTitle.bold())
                                .foregroundStyle(.title)
                        } else if index == 0 {
                            Text(.upcomingTitle)
                                .font(.largeTitle.bold())
                                .foregroundStyle(.title)
                        }
                    }
                    .listSectionSpacing(.compact)
                }
            }
        }
    }
}

#Preview {
    CalendarScreenView()
}
