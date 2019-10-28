//
//  SwiftCoreDataTests.swift
//  SwiftCoreDataTests
//
//  Created by Mushtaque Ahmed on 10/28/19.
//  Copyright © 2019 Mushtaque Ahmed. All rights reserved.
//

import XCTest
@testable import SwiftCoreData

class SwiftCoreDataTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testTaskModelTypes() {
        let task = Task("Homework", "Work", creationDate: Date(), endDate: Date(), priority: 1)
        print(task)
        XCTAssert(type(of: task.title)==String.self)
        XCTAssert(type(of: task.type)==String.self)
        XCTAssert(type(of: task.creationDate)==Date.self)
        XCTAssert(type(of: task.endDate)==Date.self)
        XCTAssert(type(of: task.priority)==Int?.self)
        
    }
    
    func testTaskCreation() {
        let task = Task("Homework", "Work", creationDate: Date(), endDate: Date(), priority: 1)
        let store = Storemanager()
        store.createtasks(for: task)
      //  store.readTask()
    }
    
    func testTaskRetreival() {
        let store = Storemanager()
        store.readTask()
    }
    
    func testDeleteAllTask() {
         let store = Storemanager()
        store.deleteAllTask()
        let task = store.readTask()
        XCTAssert(task.count == 0)
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
