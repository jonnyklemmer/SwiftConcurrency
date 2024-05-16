//
//  MyActorTests.swift
//  SwiftConcurrencyTests
//
//  Created by Jonny Klemmer on 5/15/24.
//

import Foundation
import XCTest

actor MyActor {
    var value: String = ""
}

final class MyActorTests: XCTestCase {
    func testExample() async throws {
        let actor = MyActor()

        let value = await actor.value
        XCTAssertNil(value)
    }
}
