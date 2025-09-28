//
//  SkeletonView.swift
//  Sclerosis
//
//  Created by Danil Kazakov on 22.09.2025.
//

import SkeletonUI
import SwiftUI

struct SkeletonView: View {
    var body: some View {
        Rectangle()
            .skeleton(with: true, shape: .rounded(.radius(22)))
    }
}

#Preview {
    SkeletonView()
}
