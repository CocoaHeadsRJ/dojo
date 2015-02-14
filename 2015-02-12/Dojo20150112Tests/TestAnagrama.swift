//
//  TestAnagrama.swift
//  Dojo20150112
//
//  Created by Walmyr Carvalho on 2/12/15.
//  Copyright (c) 2015 cocoaheads. All rights reserved.
//

import UIKit
import XCTest

func anagrama(palavra:String)->[String]
{
    func concatenate(charList:[Character]) -> String {
        var result = String()
        for c in charList {
            result += "\(c)"
        }
        return result
    }
    
    var charList = [Character]()
    if countElements(palavra) == 0 {
        return []
    }
    
    if countElements(palavra) == 1 {
        return [palavra]
    }
    
    
    if countElements(palavra) == 2 {
        return [palavra, concatenate(Array(palavra).reverse())]
    } else {
        
    }
//    for char in palavra {
//        let fixa = char
//        let rest = palavra.stringByReplacingOccurrencesOfString(String(char), withString: "", options: 0, range: NSMakeRange(0, countElements(palavra)))
//        
//        
//    }
    
    return [palavra]
}

class TestAnagrama: XCTestCase {

    func testaVazio(){
        XCTAssertEqual(anagrama(""), [])
    }
    
    func testaAnagramaUmaLetra(){
        
        XCTAssertEqual(anagrama("a"), ["a"])
    }
    
    func testaAnagramaDuasLetras() {
        XCTAssertEqual(anagrama("ab"), ["ab", "ba"])
    }
}
