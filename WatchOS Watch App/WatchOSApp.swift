//
//  WatchOSApp.swift
//  WatchOS Watch App
//
//  Created by Marco Muñoz on 15/11/23.
//

import SwiftUI

@main
struct WatchOS_Watch_AppApp: App {
    var body: some Scene {
        WindowGroup {
            PrincipalView(viewModel: PrincipalViewModel())
        }
    }
}
