//
//  LibraryView.swift
//  Sclerosis
//
//  Created by Danil Kazakov on 22.09.2025.
//

import SwiftUI

struct LibraryView: View {
    @Bindable var viewModel: LibraryViewModel
    @SceneStorage("selectedTab") private var selectedTab: Int = .zero

    var body: some View {
        NavigationStack {
            content
                .navigationTitle(.libraryTitle)
                .animation(.default, value: viewModel.filter)
                .onAppear { viewModel.filter = "" }
                .onChange(of: selectedTab) { _, _ in viewModel.filter = "" }
                .toolbar { ToolbarItem(placement: .topBarTrailing) { PlusButton {} } }
                .task { await viewModel.loadShows() }
                .refreshable { await viewModel.loadShows(isUpdate: true) }
        }
    }
}

private extension LibraryView {
    var content: some View {
        Group {
            switch viewModel.state {
            case .loading:
                LoadingView()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            case .loaded(let shows):
                showsList(shows: shows)
            case .error(let error):
                ErrorView(
                    message: error.localizedDescription,
                    action: { Task { await viewModel.loadShows() } }
                )
            }
        }
    }

    func showsList(shows: [Show]) -> some View {
        List {
            ForEach(shows) { show in
                Section {
                    ShowCardView(show: show)
                        .swipeActions(edge: .trailing, allowsFullSwipe: true) {
                            Button(role: .destructive) {
                                viewModel.deleteShow(show)
                            } label: {
                                Label(.delete, systemImage: .trash)
                            }
                        }
                }
            }
        }
        .conditionalSearchable(
            selectedTab: selectedTab,
            text: $viewModel.filter
        )
    }
}

#Preview {
    NavigationStack {
        LibraryView(viewModel: LibraryViewModel())
    }
}
