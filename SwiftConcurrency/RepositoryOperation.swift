//
//  RepositoryOperation.swift
//  SwiftConcurrency
//
//  Created by Jonny Klemmer on 5/8/24.
//

import Foundation

@MainActor
class Repository {
    var results: [Int] = []

    func add(value: Int) {
        results.append(value)
    }
}

@MainActor
class OperationViewModel: ObservableObject {
    var repo = Repository()

    func run() {
        for value in 0..<3 {
            print("starting task \(value)")
            Task {
                print("starting operation \(value)")
                await Operation(repo: self.repo).execute(value: value)
                print("finished operation \(value)")
            }
            print("moving onto next task from \(value)")
        }
    }
}

struct Operation {
    let repo: Repository

    func execute(value: Int) async {
        await repo.add(value: value)
    }
}
