//
//  CalendarView.swift
//  Sclerosis
//
//  Created by Danil Kazakov on 28.09.2025.
//

import SwiftUI

struct CalendarView: View {
    @State private var viewModel = CalendarViewModel()
    
    var body: some View {
        NavigationStack { content }
            .task { await viewModel.loadEpisodes() }
            .refreshable { await viewModel.loadEpisodes(isUpdate: true) }
    }
}

private extension CalendarView {
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
            MonthCalendarView(
                selectedDate: $viewModel.selectedDate,
                markedDates: viewModel.markedDates
            )
            .tint(Color.accentColor)
        } header: {
            Text(.calendarTitle)
                .font(.largeTitle.bold())
                .foregroundStyle(.title)
        }
    }
    
    var episodesSection: some View {
        Section {
            if viewModel.episodesToDisplay.isEmpty {
                Text(.emptyStateTitle)
                    .foregroundStyle(.secondary)
            } else {
                ForEach(viewModel.episodesToDisplay, id: \.id) { episode in
                    EpisodeRowView(episode: episode)
                }
            }
        } header: {
            if let selectedDate = viewModel.selectedDate {
                Text(selectedDate.fullDayString)
                    .font(.largeTitle.bold())
                    .foregroundStyle(.title)
            } else {
                Text(.upcomingTitle)
                    .font(.largeTitle.bold())
                    .foregroundStyle(.title)
            }
        }
    }
}

#Preview {
    CalendarView()
}
