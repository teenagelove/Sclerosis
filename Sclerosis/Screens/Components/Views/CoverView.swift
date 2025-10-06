//
//  CoverView.swift
//  Sclerosis
//
//  Created by Danil Kazakov on 06.10.2025.
//

import Kingfisher
import SwiftUI

struct CoverView: View {
    let url: URL

    var body: some View {
        KFImage(url)
            .fade(duration: 0.3)
            .placeholder {
                SkeletonView()
                    .frame(width: 100, height: 160) // hardcode
            }
            .resizable()
            .scaledToFill()
            .frame(maxWidth: 100, maxHeight: 160) // hardcode
            .clipShape(.rect(cornerRadius: 22))
            .shadow(color: .black.opacity(0.4), radius: 5)
    }
}

#Preview {
    CoverView(url: Show.MockShow.cover)
}
