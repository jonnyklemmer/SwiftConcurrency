//
//  MyActor.swift
//  SwiftConcurrency
//
//  Created by Jonny Klemmer on 5/15/24.
//

import Foundation
import Combine

class MyViewModel {
    var showMeString: String = ""

    private let client = MyDataStore()

    func setupObservation() {
        Task {
            await client.currentItem.sink { error in
                print(error)
            } receiveValue: { value in
                self.showMeString = value!
            }
        }

    }

    func updateButtonTapped() {
        Task {
             await client.updateItems()
        }
    }
    
}

actor MyDataStore {
    private(set) var currentItem = CurrentValueSubject<String?, Error>(nil)
    private var items: [String] = []

    func updateItems() {
        // go make network call to get items
        items = ["new item1", "new item2"]
        currentItem.send(items.first)
    }

    func cycleCurrentItem() {
        currentItem.send(items[1])
    }
}
