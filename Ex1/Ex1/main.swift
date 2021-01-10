//
//  main.swift
//  Ex1
//
//  Created by Leeyoungjae on 2021/01/10.
//

import Foundation

let age: Int = 26
print("안녕하세요! 저는 \(age)살 입니다.\n")
print("안녕하세요! 저는 5년 뒤에 \(age + 5)살 입니다.\n")

class Person {
    var name: String = "YoungJae"
    var age: Int = 26
}

let youngjae: Person = Person()
print(youngjae)
dump(youngjae)
