//
//  MonthCalendarView.swift
//  Sclerosis
//
//  Created by Danil Kazakov on 02.10.2025.
//

import SwiftUI

struct MonthCalendarView: View {
    @Binding var selectedDate: Date?
    let markedDates: Set<Date> // expected to be normalized to startOfDay

    private let calendar: Calendar = .current
    @State private var currentMonthStart: Date

    init(selectedDate: Binding<Date?>, markedDates: Set<Date>) {
        self._selectedDate = selectedDate
        self.markedDates = markedDates
        // Initialize currentMonthStart to the start of the month for today
        let today = Date()
        let comps = Calendar.current.dateComponents([.year, .month], from: today)
        self._currentMonthStart = State(initialValue: Calendar.current.date(from: comps) ?? today)
    }

    var body: some View {
        VStack(spacing: 8) {
            header
            weekdayHeader
            monthGrid
        }
        .padding(.vertical, 8)
    }
}

private extension MonthCalendarView {
    var header: some View {
        HStack {
            Button {
                shiftMonth(by: -1)
            } label: {
                Image(systemName: .chevronLeft)
            }
            .buttonStyle(.plain)

            Spacer()

            Text(monthTitle(for: currentMonthStart))
                .font(.headline)

            Spacer()

            Button {
                shiftMonth(by: 1)
            } label: {
                Image(systemName: .chevronRight)
            }
            .buttonStyle(.plain)
        }
        .padding(.horizontal)
    }

    var weekdayHeader: some View {
        let symbols = weekdaySymbolsStartingFromFirstWeekday()
        return HStack(spacing: 0) {
            ForEach(symbols, id: \.self) { symbol in
                Text(symbol)
                    .font(.caption)
                    .foregroundStyle(.secondary)
                    .frame(maxWidth: .infinity)
            }
        }
        .padding(.horizontal)
    }

    var monthGrid: some View {
        let days = daysGrid(for: currentMonthStart)
        return VStack(spacing: 6) {
            ForEach(0..<(days.count / 7), id: \.self) { row in
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
            let isSelected = selectedDate.map { calendar.isDate($0, inSameDayAs: date) } ?? false
            let isToday = calendar.isDateInToday(date)
            let isMarked = markedDates.contains(calendar.startOfDay(for: date))

            Button {
                if isSelected {
                    selectedDate = nil
                } else {
                    selectedDate = date
                }
            } label: {
                VStack(spacing: 4) {
                    ZStack {
                        if isSelected {
                            Circle()
                                .fill(Color.accentColor.opacity(0.2))
                                .frame(width: 32, height: 32)
                        }

                        if isToday {
                            Circle()
                                .fill(Color.primary.opacity(0.2))
                                .frame(width: 32, height: 32)
                        }

                        Text("\(calendar.component(.day, from: date))")
                            .font(.body)
                            .fontWeight(isSelected ? .semibold : .regular)
                            .foregroundStyle(isSelected ? .primary : .primary)
                    }

                    // Dot marker
                    Circle()
                        .fill(isMarked ? Color.accentColor : Color.clear)
                        .frame(width: 6, height: 6)
                        .opacity(isMarked ? 1.0 : 0.0)
                }
                .frame(height: 44)
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
        if let newDate = calendar.date(byAdding: .month, value: offset, to: currentMonthStart) {
            let comps = calendar.dateComponents([.year, .month], from: newDate)
            currentMonthStart = calendar.date(from: comps) ?? newDate
        }
    }

    func monthTitle(for date: Date) -> String {
        let fmt = DateFormatter()
        fmt.locale = Locale.current
        fmt.calendar = calendar
        fmt.dateFormat = "LLLL yyyy"
        return fmt.string(from: date).capitalized
    }

    func weekdaySymbolsStartingFromFirstWeekday() -> [String] {
        // Use veryShortStandaloneWeekdaySymbols to keep compact (e.g., Пн, Вт or single letters)
        var symbols = calendar.shortStandaloneWeekdaySymbols
        // Reorder based on firstWeekday
        let first = calendar.firstWeekday - 1 // convert to 0-based
        if first > 0 { symbols = Array(symbols[first...] + symbols[..<first]) }
        return symbols
    }

    func daysGrid(for monthStart: Date) -> [Date?] {
        var grid: [Date?] = []
        guard let range = calendar.range(of: .day, in: .month, for: monthStart) else { return [] }
        let firstWeekdayOfMonth = calendar.component(.weekday, from: monthStart) // 1...7
        let first = calendar.firstWeekday // 1...7
        let leadingEmpty = (firstWeekdayOfMonth - first + 7) % 7

        // leading nils
        grid.append(contentsOf: Array(repeating: nil, count: leadingEmpty))

        // days of month
        for day in range {
            var comps = calendar.dateComponents([.year, .month], from: monthStart)
            comps.day = day
            guard let date = calendar.date(from: comps) else { return [] }
            grid.append(date)
        }

        // trailing nils to complete rows of 7
        let remainder = grid.count % 7
        if remainder != 0 {
            grid.append(contentsOf: Array(repeating: nil, count: 7 - remainder))
        }

        return grid
    }
}

#Preview {
    let today = Calendar.current.startOfDay(for: Date())
    let marks: Set<Date> = [
        today,
        Calendar.current.date(
            byAdding: .day,
            value: 2,
            to: today
        )!
    ].reduce(into: Set<Date>()) { $0.insert(Calendar.current.startOfDay(for: $1)) }
    return MonthCalendarView(selectedDate: .constant(Date()), markedDates: marks)
        .padding()
}
