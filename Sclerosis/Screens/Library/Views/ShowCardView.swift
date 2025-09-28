//
//  ShowCardView.swift
//  Sclerosis
//
//  Created by Danil Kazakov on 22.09.2025.
//

import Kingfisher
import SwiftUI

struct ShowCardView: View {
    let show: Show

    var body: some View {
        HStack {
            cover
            description
        }
    }
}

private extension ShowCardView {
    var cover: some View {
        KFImage(show.cover)
            .fade(duration: 0.3)
            .placeholder {
                SkeletonView()
                    .frame(width: 100, height: 160) // hardcode
            }
            .resizable()
            .scaledToFill()
            .frame(maxWidth: 100, maxHeight: 160) // hardcode
            .clipShape(.rect(cornerRadius: 12))
            .shadow(color: .black.opacity(0.4), radius: 5)
    }

    var description: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text(show.name)
                .font(.bold16)

            Text(show.description)
                .font(.regular14)

            seasonsCount
        }
    }

    var seasonsCount: some View {
        Text("\(.seasonsCount): \(show.seasons.count)")
            .font(.regular14)
    }
}

#Preview {
    ShowCardView(show: Show.MockShow)
}
