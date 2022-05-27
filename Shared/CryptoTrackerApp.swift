//
//  CryptoTrackerApp.swift
//  Shared
//
//  Created by Kamil Skrzyński on 24/05/2022.
//

import SwiftUI

@main
struct CryptoTrackerApp: App {
    var body: some Scene {
        WindowGroup {
            MainView()
#if os(macOS)
                .frame(maxWidth: 1200, maxHeight: 600)
#endif
        }
#if os(macOS)
        .windowStyle(.hiddenTitleBar)
#endif
    }
}
