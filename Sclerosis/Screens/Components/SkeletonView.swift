//
//  SkeletonView.swift
//  Sclerosis
//
//  Created by Danil Kazakov on 22.09.2025.
//

import SwiftUI

struct SkeletonView: View {
    @State private var move: CGFloat = -0.5

    var body: some View {
        Rectangle()
            .fill(Color.gray.opacity(0.2))
            .overlay {
                LinearGradient(
                    gradient: Gradient(colors: [
                        .gray.opacity(0.2),
                        .gray.opacity(0.6),
                        .gray.opacity(0.2)
                    ]),
                    startPoint: .leading,
                    endPoint: .trailing
                )
//                .scaleEffect(x: 3, y: 1, anchor: .center)
                .offset(x: move * UIScreen.main.bounds.width)
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
