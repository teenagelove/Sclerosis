//
//  CalendarView.swift
//  Sclerosis
//
//  Created by Danil Kazakov on 02.10.2025.
//

import SwiftUI

struct CalendarView: View {
    // TODO: Needed?
    @Binding var selectedDate: Date?

    // TODO: Needed?
    let markedDates: Set<Date> // expected to be normalized to startOfDay

    // TODO: Remove after moving helpers
    private let calendar: Calendar = .current

    @State private var currentMonthStart: Date

    // TODO: MVP ( NEED TO REWORK)
    init(selectedDate: Binding<Date?>, markedDates: Set<Date>) {
        self._selectedDate = selectedDate
        self.markedDates = markedDates
        self._currentMonthStart = State(initialValue: Date().startOfMonth)
    }

    var body: some View {
        VStack(spacing: 8) {
            header
            weekdayLabels
            daysGrid
        }
        .padding(.vertical, 8)
    }
}

// TODO: Too complicated extension
private extension CalendarView {
    var header: some View {
        HStack {
            Button {
                shiftMonth(by: -1)
            } label: {
                Image(systemName: SFSymbols.chevronLeft)
            }
            .buttonStyle(.plain)

            Spacer()

            Text(currentMonthStart.monthAndYear)
                .font(.headline)

            Spacer()

            Button {
                shiftMonth(by: 1)
            } label: {
                Image(systemName: SFSymbols.chevronRight)
            }
            .buttonStyle(.plain)
        }
        .padding(.horizontal)
    }

    var weekdayLabels: some View {
        HStack(spacing: 0) {
            ForEach(currentMonthStart.weekdaySymbols, id: \.self) { symbol in
                Text(symbol)
                    .font(.caption)
                    .foregroundStyle(.secondary)
                    .frame(maxWidth: .infinity)
            }
        }
        .padding(.horizontal)
    }

    var daysGrid: some View {
        let days = currentMonthStart.calendarGridDays
        let rows = days.count / 7
        return VStack(spacing: 6) {
            ForEach(0..<rows, id: \.self) { row in
                HStack(spacing: 0) {
                    ForEach(0..<7, id: \.self) { col in
                        let index = row * 7 + col
                        dayCell(days[index])
                            .frame(maxWidth: .infinity, minHeight: 36)
                    }
                }
            }
        }
        .padding(.horizontal)
    }

    @ViewBuilder
    func dayCell(_ date: Date?) -> some View {
        if let date {
            let isSelected = selectedDate?.isSameDay(as: date) ?? false
            let isMarked = markedDates.contains(date.startOfDay)

            Button {
                selectedDate = isSelected ? nil : date
            } label: {
                VStack(spacing: 4) {
                    ZStack {
                        // TODO: Thinking. Rework stacks (background and pointing)
                        if isSelected {
                            Circle()
                                .fill(Color.accentColor.opacity(0.2))
                                .frame(width: 44, height: 44)
                        }

                        if date.isToday {
                            Circle()
                                .fill(Color.primary.opacity(0.2))
                                .frame(width: 44, height: 44)
                        }

                        Text("\(date.day)")
                            .font(.body)
                            .fontWeight(isSelected ? .semibold : .regular)
                            .foregroundStyle(.primary)
                    }

                    // Dot marker
                    Circle()
                        .fill(isMarked ? Color.accentColor : Color.clear)
                        .frame(width: 6, height: 6)
                        .opacity(isMarked ? 1.0 : 0.0)
                }
                .frame(maxWidth: .infinity, maxHeight: 44)
//                .frame(height: 44)
//                .overlay(
//                    Circle()
//                        .stroke(isToday ? Color.primary : Color.clear, lineWidth: 1)
//                )
            }
            .buttonStyle(.plain)
        } else {
            Color.clear.frame(height: 44)
        }
    }

    func shiftMonth(by offset: Int) {
        if let newMonthStart = currentMonthStart.byAddingMonths(offset)?.startOfMonth {
            currentMonthStart = newMonthStart
        }
    }
}

#Preview {
    let today = Date().startOfDay
    let marks = Set([today, today.byAddingDays(2)].compactMap { $0 })

    return CalendarView(selectedDate: .constant(nil), markedDates: marks)
}
