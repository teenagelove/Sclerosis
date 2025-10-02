//
//  EpisodeRowView.swift
//  Sclerosis
//
//  Created by Danil Kazakov on 02.10.2025.
//

import SwiftUI

struct EpisodeRowView: View {
    let episode: Episode
    
    var body: some View {
        HStack(alignment: .center, spacing: 12) {
            episodeDetails
            Spacer()
        }
        .padding(.vertical, 8)
        .padding(.horizontal)
        .background(backgroundCard)
    }
}

private extension EpisodeRowView {
    var episodeDetails: some View {
        VStack(alignment: .leading, spacing: 4) {
            episodeNameText
            episodeShowNameText
            episodeReleaseDateText
        }
    }
    
    var episodeNameText: some View {
        Text(episode.name)
            .font(.headline)
            .foregroundStyle(.primary)
            .lineLimit(1)
            .truncationMode(.tail)
    }
    
    var episodeShowNameText: some View {
        Text(episode.showName)
            .font(.subheadline)
            .foregroundStyle(.secondary)
            .lineLimit(1)
            .truncationMode(.tail)
    }
    
    var episodeReleaseDateText: some View {
        Text(episode.releaseDate.fullDayString)
            .font(.caption)
            .foregroundStyle(.secondary)
    }

    // TODO: Think about styles
    var backgroundCard: some View {
        RoundedRectangle(cornerRadius: 10)
            .fill(Color(.systemBackground).opacity(0.8))
            .shadow(color: Color.black.opacity(0.05), radius: 2, x: 0, y: 1)
    }
}

#Preview {
    List {
        EpisodeRowView(episode: .bbPilotEpisode)
        EpisodeRowView(episode: .bbSevenThirtySevenEpisode)
        EpisodeRowView(episode: .gotWinterIsComingEpisode)
    }
}
