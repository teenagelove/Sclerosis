//
//  PlusButton.swift
//  Sclerosis
//
//  Created by Danil Kazakov on 24.09.2025.
//

import SwiftUI

struct PlusButton: View {
    let action: () -> Void

    var body: some View {
        Button {
            // Handle plus button
        } label: {
            Image(systemName: .plus)
        }
    }
}

#Preview {
    PlusButton { }
}
