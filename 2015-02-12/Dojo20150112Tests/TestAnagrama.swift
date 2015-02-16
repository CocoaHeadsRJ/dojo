//
//  TestAnagrama.swift
//  Dojo20150112
//
//  Created by Walmyr Carvalho on 2/12/15.
//  Copyright (c) 2015 cocoaheads. All rights reserved.
//

import UIKit
import XCTest

extension String {
    
    //subscript: https://stackoverflow.com/questions/24092884/get-nth-character-of-a-string-in-swift-programming-language
    subscript (i: Int) -> Character {
        return self[advance(self.startIndex, i)]
    }
    
    subscript (i: Int) -> String {
        return String(self[i] as Character)
    }
    
    //criei pra facilitar leitura do programa principal, deve ter forma melhor de fazer
    func to(i:Int) -> NSString {
        return (self as NSString).substringToIndex(i)
    }
    func from(i:Int) -> NSString {
        return (self as NSString).substringFromIndex(i)
    }
}

//https://github.com/pNre/ExSwift/blob/master/ExSwift/Array.swift
//Obs.: Esse projeto inteiro é excelente
extension Array {
    
    func groupBy<U>(groupingFunction group: (Element) -> U) -> [U: Array]
    {
        var result = [U: Array]()
        for item in self {
            let groupKey = group(item)
            // If element has already been added to dictionary, append to it. If not, create one.
            //adaptando com contains pq não achou o método `has`, deve ser uma extensão de Dictionary dentro do projeto
            if contains(result.keys, groupKey) {
                result[groupKey]! += [item]
            } else {
                result[groupKey] = [item]
            }
        }
        return result
    }
}

//algoritmo: https://stackoverflow.com/questions/9666903/every-combination-of-character-array
func anagrama(palavra:String)->[String]
{
    if countElements(palavra) == 1 {
        return [palavra]
    }
    else {
        //adicionando cálculo de indices para evitar gerar anagramas duplicados
        //ao pegar apenas a primeira ocorrência de cada caractere
        let pArray = Array(palavra)
        let indices = pArray
            .map{c in find(pArray,c)!}
            .groupBy{$0}.keys.array
        
        var result = [String]()
        for i in indices {
            let remaining = palavra.to(i) + palavra.from(i+1)  //pega string sem o caractere da vez
            for permutation in anagrama(remaining) {           //calcula as permutações do resto
                result.append(palavra[i] + permutation)        //caractere da vez é o primeiro caractere, soma-o a todas as permutações
            }
        }
        return result.sorted(<)
    }
}


//Solução alternativa: flatMap

//http://robnapier.net/flatmap
extension Array {
    
    //func flatten<T>(array: [[T]]) -> [T] {
    //    var result = [T]()
    //    for subarray in array {
    //        result.extend(subarray)
    //    }
    //    return result
    //}
    
    //https://stackoverflow.com/questions/24564249/how-to-implement-flatten-as-an-extension-on-an-array-without-type-casting
    //implementação irada do flatten
    private func flatten<T>(array: [[T]]) -> [T] {
        return array.reduce([T](), +)
    }
    
    func flatMap<U>(transform: T -> [U]) -> [U] {
        return flatten(self.map(transform))
    }
}

func anagramaFlatMap(palavra:String)->[String]
{
    if countElements(palavra) == 1 {
        return [palavra]
    }
    else {
        let pArray = Array(palavra)
        return pArray
            .map{c in find(pArray,c)!}
            .groupBy{$0}.keys.array
            .flatMap { i in
                anagramaFlatMap(palavra.to(i) + palavra.from(i+1))
                    .map { p in palavra[i] + p }
            }
            .sorted(<)
    }
}

class TestAnagrama: XCTestCase {

    func testaAnagramaVazio(){
        XCTAssertEqual(anagrama(""), [])
    }
    
    func testaAnagramaUmaLetra(){
        
        XCTAssertEqual(anagrama("a"), ["a"])
    }
    
    func testaAnagramaDuasLetras() {
        XCTAssertEqual(anagrama("ab"), ["ab", "ba"])
    }

    func testaAnagramaTresComRepetidas() {
        XCTAssertEqual(anagrama("aba"), ["aab", "aba", "baa"])
    }

    func testaAnagramaTresLetras() {
        XCTAssertEqual(anagrama("abc"), ["abc", "acb", "bac", "bca", "cab", "cba"])
    }
    
    func testaAnagramaFlatMapVazio(){
        XCTAssertEqual(anagramaFlatMap(""), [])
    }
    
    func testaAnagramaFlatMapUmaLetra(){
        
        XCTAssertEqual(anagramaFlatMap("a"), ["a"])
    }
    
    func testaAnagramaFlatMapDuasLetras() {
        XCTAssertEqual(anagramaFlatMap("ab"), ["ab", "ba"])
    }
    
    func testaAnagramaFlatMapTresComRepetidas() {
        XCTAssertEqual(anagramaFlatMap("aba"), ["aab", "aba", "baa"])
    }
    
    func testaAnagramaFlatMapTresLetras() {
        XCTAssertEqual(anagramaFlatMap("abc"), ["abc", "acb", "bac", "bca", "cab", "cba"])
    }
}
