//
//  LoadingView.swift
//  Sclerosis
//
//  Created by Danil Kazakov on 26.09.2025.
//

import SwiftfulLoadingIndicators
import SwiftUI

struct LoadingView: View {
    var body: some View {
        LoadingIndicator(animation: .fiveLinesPulse, color: .accent)
    }
}

#Preview {
    LoadingView()
}
