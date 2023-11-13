//
//  ProgressViewPersonalized.swift
//  Marvel_SwifUi
//
//  Created by Marco Muñoz on 13/11/23.
//

import SwiftUI

struct ProgressViewPersonalized: View {
    var body: some View {
        ProgressView("Loading Series...")
            .font(.title2)
    }
}

#Preview {
    ProgressViewPersonalized()
}
