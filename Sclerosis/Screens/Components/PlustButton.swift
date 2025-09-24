//
//  PlustButton.swift
//  Sclerosis
//
//  Created by Danil Kazakov on 24.09.2025.
//

import SwiftUI

struct PlustButton: View {
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
    PlustButton() { }
}
