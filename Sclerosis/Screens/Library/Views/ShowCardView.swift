//
//  ShowCardView.swift
//  Sclerosis
//
//  Created by Danil Kazakov on 22.09.2025.
//

import SwiftUI

struct ShowCardView: View {
    let show: Show

    var body: some View {
        HStack {
            CoverView(url: show.cover)
            description
        }
    }
}

private extension ShowCardView {
    var description: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text(show.name)
                .font(.bold16)

            Text(show.description)
                .font(.regular14)

//            seasonsCount
        }
    }

//    var seasonsCount: some View {
//        Text("\(.seasonsCount): \(show.seasons.count)")
//            .font(.regular14)
//    }
}

#Preview {
    ShowCardView(show: Show.MockShow)
}
