//
//  FizzBuzz.swift
//  Dojo20150112
//
//  Created by Walmyr Carvalho on 2/12/15.
//  Copyright (c) 2015 cocoaheads. All rights reserved.
//

import UIKit

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