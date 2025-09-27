//
//  MainTabView.swift
//  Sclerosis
//
//  Created by Danil Kazakov on 22.09.2025.
//

import SwiftUI

struct MainTabView: View {
    @State private var selectedTab: Int = .zero
    @State private var libraryViewModel = LibraryViewModel()

    var body: some View {
        TabView(selection: $selectedTab) {
            Tab(
                String(localizable: .calendarTitle),
                systemImage: .calendar,
                value: 0
            ) {
                NavigationStack {
                    Text(.calendarTitle)
                        .navigationTitle(.calendarTitle)
                }
            }

            Tab(
                String(localizable: .libraryTitle),
                systemImage: .library,
                value: 1
            ) {
                LibraryView(
                    viewModel: libraryViewModel,
                    selectedTab: $selectedTab
                )
            }

            if selectedTab != 0 {
                Tab(
                    String(localizable: .search),
                    systemImage: .search,
                    value: 2,
                    role: .search
                ) {
                    LibraryView(
                        viewModel: libraryViewModel,
                        selectedTab: $selectedTab
                    )
                }
            }
        }
        .tabBarMinimizeBehavior(.onScrollDown)
    }
}

#Preview {
    MainTabView()
}
