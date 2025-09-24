//
//  MainTabView.swift
//  Sclerosis
//
//  Created by Danil Kazakov on 22.09.2025.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            NavigationStack {
                Text(.calendarTitle)
                    .navigationTitle(.calendarTitle)
            }
            .tabItem {
                Label(.calendarTitle, systemImage: .calendar)
            }

            LibraryView()
                .tabItem {
                    Label(.libraryTitle, systemImage: .library)
                }
        }
    }
}

#Preview {
    MainTabView()
}
