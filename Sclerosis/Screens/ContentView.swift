//
//  ContentView.swift
//  Sclerosis
//
//  Created by Danil Kazakov on 21.09.2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            Text(.calendarTitle)
                .tabItem {
                    Label(.calendarTitle, systemImage: .calendar)
                }
            
            Text(.libraryTitle)
                .tabItem {
                    Label(.libraryTitle, systemImage: .library)
                }
        }
    }
}

#Preview {
    ContentView()
}
