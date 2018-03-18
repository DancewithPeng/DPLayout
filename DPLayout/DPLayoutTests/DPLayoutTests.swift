//
//  DPLayoutTests.swift
//  DPLayoutTests
//
//  Created by DancewithPeng on 2018/3/17.
//  Copyright © 2018年 dancewithpeng@gmail.com. All rights reserved.
//

import XCTest
@testable import DPLayout

class DPLayoutTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        let s = CGSize.make(width: 30, height: 60)
        print(s.maxLength)
        print(s.minLength)
        
        let p = CGPoint.make(x: 30, y: 40)
        print(p)                
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
