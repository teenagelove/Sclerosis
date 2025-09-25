//
//  SkeletonView.swift
//  Sclerosis
//
//  Created by Danil Kazakov on 22.09.2025.
//

import SwiftUI

struct SkeletonView: View {
    @State private var move: CGFloat = 0

    var body: some View {
        GeometryReader { geometry in
            Rectangle()
                .fill(Color.gray.opacity(0.2))
                .overlay {
                    LinearGradient(
                        gradient: Gradient(colors: [
                            .gray.opacity(0.1),
                            .gray.opacity(0.3),
                            .gray.opacity(0.5)
                        ]),
                        startPoint: .leading,
                        endPoint: .trailing
                    )
                    .offset(x: move * geometry.size.width)
                }
        }
        .onAppear {
            withAnimation(.easeInOut(duration: 1.5).repeatForever(autoreverses: false)) {
                move = 1.5
            }
        }
    }
}

#Preview {
    SkeletonView()
}
