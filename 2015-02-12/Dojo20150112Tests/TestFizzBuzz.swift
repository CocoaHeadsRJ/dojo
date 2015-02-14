//
//  TestFizzBuzz.swift
//  Dojo20150112
//
//  Created by Walmyr Carvalho on 2/12/15.
//  Copyright (c) 2015 cocoaheads. All rights reserved.
//

import UIKit
import XCTest
import Dojo20150112


class FizzBuzz: NSObject {
    
    var n:Int
    
    init(n:Int) {
        self.n = n
    }
    
    func execute() -> Array<String> {
        
        var ret = Array<String>()
        
        for i in 1...n {
            
            if i % 3 == 0 && i % 5 == 0 {
                ret.append("fizzbuzz")
            } else if i % 3 == 0 {
                ret.append("fizz")
            } else if i % 5 == 0 {
                ret.append("buzz")
            } else {
                ret.append("\(i)")
            }
        }
        
        return ret
    }
}

class TestFizzBuzz: XCTestCase {

    func testFizzBuzz1() {
        let f = FizzBuzz(n: 1)
        XCTAssertEqual(f.execute(), ["1"])
    }
    
    func testFizzBuzz2() {
        let f = FizzBuzz(n: 2)
        XCTAssertEqual(f.execute(), ["1","2"])
    }
    
    func testFizzBuzz3() {
        let f = FizzBuzz(n: 3)
        XCTAssertEqual(f.execute(), ["1","2", "fizz"])
    }
    func testFizzBuzz5() {
        
        let f = FizzBuzz(n: 5)
        XCTAssertEqual(f.execute(), ["1","2","fizz","4","buzz"])
    }
    
    func testFizzBuzz15() {
        
        let f = FizzBuzz(n: 15)
        XCTAssertEqual(f.execute(), ["1","2","fizz","4","buzz", "fizz", "7", "8", "fizz", "buzz", "11", "fizz", "13", "14", "fizzbuzz"])
    }
    
}
