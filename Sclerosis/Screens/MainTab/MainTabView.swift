//
//  MainTabView.swift
//  Sclerosis
//
//  Created by Danil Kazakov on 22.09.2025.
//

import SwiftUI

struct MainTabView: View {
    @State private var selectedTab: TabID = .calendar
    @State private var libraryViewModel = LibraryViewModel()

    var body: some View {
        TabView(selection: $selectedTab) {
            Tab(
                .calendarTitle,
                systemImage: SFSymbols.calendar,
                value: TabID.calendar
            ) { CalendarScreenView() }

            Tab(
                .libraryTitle,
                systemImage: SFSymbols.library,
                value: TabID.library
            ) {
                LibraryView(
                    viewModel: libraryViewModel,
                    selectedTab: $selectedTab
                )
            }

            if selectedTab != .calendar {
                Tab(
                    .search,
                    systemImage: SFSymbols.search,
                    value: TabID.search,
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
