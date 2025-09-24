//
//  LibraryView.swift
//  Sclerosis
//
//  Created by Danil Kazakov on 22.09.2025.
//

import SwiftUI

struct LibraryView: View {
    @State private var viewModel = LibraryViewModel()
    @State private var searchableText: String = ""

    private var filteredShows: [Show] {
        let query = searchableText.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !query.isEmpty else { return viewModel.shows }
        return viewModel.shows.filter { show in
            show.name.localizedCaseInsensitiveContains(query)
        }
    }

    var body: some View {
        List {
            ForEach(filteredShows) { show in
                Section {
                    ShowCardView(show: show)
                        .swipeActions(edge: .trailing, allowsFullSwipe: true) {
                            Button(role: .destructive) {
                                delete(show)
                            } label: {
                                Label(.delete, systemImage: .trash)
                            }
                        }
                }
            }
        }
        .searchable(text: $searchableText)
        .navigationTitle(.libraryTitle)
        .animation(.default, value: searchableText)
        .toolbar { ToolbarItem(placement: .topBarTrailing) { PlustButton { } } }
    }

    private func delete(_ show: Show) {
        viewModel.shows.removeAll(where: { $0.id == show.id }) // hardcode
    }
}

#Preview {
    NavigationStack {
        LibraryView()
    }
}
