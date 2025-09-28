//
//  CalendarView.swift
//  Sclerosis
//
//  Created by Danil Kazakov on 28.09.2025.
//

import Kingfisher
import SwiftUI

struct CalendarView: View {
    var body: some View {
        NavigationStack {
            content
        }
    }
}

private extension CalendarView {
    // MARK: - MVP content
    @ViewBuilder
    var content: some View {
        List {
            Section { calendar } header: {
                Text(.calendarTitle)
                    .font(.largeTitle.bold())
                    .foregroundStyle(.label)
            }

            showList
        }
    }

    var calendar: some View {
        DatePicker(
            .calendarTitle,
            selection: .constant(Date()),
            displayedComponents: .date
        )
            .datePickerStyle(.graphical)
            .tint(.primary)
    }

//    @ViewBuilder
//    var showList: some View {
//        // Tittle
////        HStack {
////            Text(.upcomingTitle)
////                .font(.largeTitle.bold())
////
////            Spacer()
////        }
////        .padding()
//
//        // Upcoming list
////        List(Show.MockShows) { show in
////            showCardView(show: show)
////            ShowCardView(show: show)
////        }
////        .listStyle(.plain)
//
//        ForEach(Show.MockShows) { show in
////            showCardView(show: show)
//            Section {
//                ShowCardView(show: show)
//            }
//        }
//    }

    var showList: some View {
        ForEach(Array(Show.MockShows.enumerated()), id: \.element.id) { index, show in
            Section {
                ShowCardView(show: show)
                    .listRowInsets(EdgeInsets())
                    .listRowSeparator(.hidden)
            } header: {
                if index == 0 {
                    Text(.upcomingTitle)
                        .font(.largeTitle.bold())
                        .foregroundStyle(.label)
                }
            }
        }
    }

    // Upcoming Card View
    func showCardView(show: Show) -> some View {
        HStack {
            // Image
            KFImage(show.cover)
                .fade(duration: 0.3)
                .placeholder {
                    SkeletonView()
                        .frame(width: 80, height: 120) // hardcode
                }
                .resizable()
                .scaledToFill()
                .frame(maxWidth: 60, maxHeight: 100) // hardcode
                .clipShape(.rect(cornerRadius: 12))
                .shadow(color: .black.opacity(0.4), radius: 5)

            // Show title
            VStack(alignment: .center) {
                Text(show.name)
                    .font(.bold16)

                Text(.seasonsCount)
                    .font(.regular14)
            }
        }
    }
}

#Preview {
    CalendarView()
}
