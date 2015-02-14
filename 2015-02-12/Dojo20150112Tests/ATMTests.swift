//
//  ATMTests.swift
//  Dojo20150112
//
//  Created by Walmyr Carvalho on 2/12/15.
//  Copyright (c) 2015 cocoaheads. All rights reserved.
//

import UIKit
import XCTest

class ATM {
    
    var n: Int
    
    let notas:[Int] = [100, 50, 20, 10]

    init (n: Int) {
        self.n = n
    }
    
    func sacar() -> Dictionary<Int,Int> {
        // chave == tipo de nota
        // valor == quantidade de nota
        var valor : Int = n
        
        var retorno = Dictionary<Int,Int>()
        
        for nota in notas {
            if valor / nota > 0 {
                var qtdNotas = valor / nota
                retorno[nota] = qtdNotas
                valor = valor % nota
            }
        }
        
        return retorno
    }
}

class ATMTests: XCTestCase {

    func testNegativebucks() {
        let atm = ATM(n: -10)
        let notas = atm.sacar()
        let resultado = Dictionary<Int,Int>()
        
        XCTAssertEqual(atm.sacar(),resultado)
    }
    
    func test0bucks() {
        let atm = ATM(n: 0)
        let notas = atm.sacar()
        let resultado = Dictionary<Int,Int>()
        
        XCTAssertEqual(atm.sacar(),resultado)
    }
    
    func test10bucks() {
        let atm = ATM(n: 10)
        let notas = atm.sacar()
        let resultado = [10:1]
        
        XCTAssertEqual(atm.sacar(),resultado)
    }
    
    func test20bucks() {
        let atm = ATM(n: 20)
        let notas = atm.sacar()
        let resultado = [20:1]
        
        XCTAssertEqual(atm.sacar(),resultado)
    }
    
    func test30bucks() {
        let atm = ATM(n: 30)
        let notas = atm.sacar()
        let resultado = [20:1, 10:1]
        
        XCTAssertEqual(atm.sacar(),resultado)
    }

    func test90bucks() {
        let atm = ATM(n: 90)
        let notas = atm.sacar()
        let resultado = [50:1, 20:2]
        
        XCTAssertEqual(atm.sacar(), resultado)
    }
    
    func test1630bucks() {
        let atm = ATM(n: 1630)
        let notas = atm.sacar()
        let resultado = [100:16, 20:1, 10:1]
        
        XCTAssertEqual(atm.sacar(), resultado)
    }
}
