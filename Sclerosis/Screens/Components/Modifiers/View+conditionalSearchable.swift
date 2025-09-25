//
//  ConditionalSearchable.swift
//  Sclerosis
//
//  Created by Danil Kazakov on 25.09.2025.
//

import SwiftUI

extension View {
    @ViewBuilder
    func conditionalSearchable(
        selectedTab: Int,
        text: Binding<String>
    ) -> some View {
        if selectedTab == 1 {
            self.searchable(text: text)
        } else {
            self
        }
    }
}
