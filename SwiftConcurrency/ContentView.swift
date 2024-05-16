//
//  ContentView.swift
//  SwiftConcurrency
//
//  Created by Jonny Klemmer on 4/24/24.
//

import SwiftUI
import Foundation

struct ContentView: View {
    @State var viewModel = ViewModel()

    @State var welcomeString: String = "Loading..."

    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text(viewModel.myTitle)
        }
        .task {
//            welcomeString = await viewModel.fetchData()
            viewModel.doSomethingOnAppear()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}

@Observable
class ViewModel {
    var myTitle = "title"

    // Example of a labeled dispatch queue!
    let queue = DispatchQueue(label: "my-dispatch-queue")

    func doSomethingOnAppear() {
//        print("im starting")

//         Option 1:
//        Task { @MainActor in
//            await doAsyncWork()
//
//            print("my task is ending")
//        }

        // How to use the dispatch queue
        queue.async {
            self.myTitle = "new title"
//            print("my task is ending")
        }

//        print("im ending")
    }

    @MainActor
    func doAsyncWork() async {
        // Delay the task by 3 seconds:
        try! await Task.sleep(nanoseconds: 3_000_000_000)

        // Perform our operation
//        print("did work")
    }

    func fetchData() async -> String{
        // Delay the task by 3 seconds:
        try! await Task.sleep(nanoseconds: 3_000_000_000)

        // Perform our operation
        return "heres your data"
    }
}
