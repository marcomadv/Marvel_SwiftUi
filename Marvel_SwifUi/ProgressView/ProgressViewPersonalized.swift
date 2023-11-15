//
//  ProgressViewPersonalized.swift
//  Marvel_SwifUi
//
//  Created by Marco Muñoz on 13/11/23.
//

import SwiftUI

struct ProgressViewPersonalized: View {
    var body: some View {
        #if os (watchOS)
        ProgressView("Loading Series...")
            .font(.title3)
        #else
        ProgressView("Loading Series...")
            .font(.title2)
            .id(0)
        #endif
    }
}

#Preview {
    ProgressViewPersonalized()
}
