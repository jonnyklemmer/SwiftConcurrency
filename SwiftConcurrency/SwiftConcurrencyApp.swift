//
//  SwiftConcurrencyApp.swift
//  SwiftConcurrency
//
//  Created by Jonny Klemmer on 4/24/24.
//

import SwiftUI

@main @MainActor
struct SwiftConcurrencyApp: App {
    let vm = OperationViewModel()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .task {
                    await vm.run()
                }
        }
    }
}
