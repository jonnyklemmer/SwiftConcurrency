//
//  ContentView.swift
//  SwiftConcurrency
//
//  Created by Jonny Klemmer on 4/24/24.
//

import SwiftUI

struct ContentView: View {
    let viewModel = ViewModel()

    @State var welcomeString: String = "Loading..."

    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text(welcomeString)
        }
        .task {
            welcomeString = await viewModel.fetchData()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}

struct ViewModel {
    func doSomethingOnAppear() {
        print("im starting")

        // Option 1:
        Task { @MainActor in
            await doAsyncWork()

            print("my task is ending")
        }

        print("im ending")
    }

    @MainActor
    func doAsyncWork() async {
        // Delay the task by 3 seconds:
        try! await Task.sleep(nanoseconds: 3_000_000_000)

        // Perform our operation
        print("did work")
    }

    func fetchData() async -> String{
        // Delay the task by 3 seconds:
        try! await Task.sleep(nanoseconds: 3_000_000_000)

        // Perform our operation
        return "heres your data"
    }
}
