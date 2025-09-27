//
//  View+conditionalSearchable.swift
//  Sclerosis
//
//  Created by Danil Kazakov on 25.09.2025.
//

import SwiftUI

extension View {
    @ViewBuilder
    func conditionalSearchable(
        selectedTab: TabID,
        text: Binding<String>
    ) -> some View {
        if selectedTab == .search {
            self.searchable(text: text)
        } else {
            self
        }
    }
}
