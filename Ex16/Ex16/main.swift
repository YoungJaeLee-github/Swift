//
//  main.swift
//  Ex16
//
//  Created by 이영재 on 2021/04/24.
//
//

import Foundation

func someFunction(a: Int, b: Int) -> Int {
    a + b
}

var sumResult: Int = someFunction(a: 1, b: 2)
print(sumResult)

var sum: (Int, Int) -> Int = { (a: Int, b: Int) -> Int in
    a + b
}
sumResult = sum(1, 2)
print(sumResult)

sum = someFunction(a:b:)
sumResult = sum(1, 2)
print(sumResult)

let add: (Int, Int) -> Int = { (a: Int, b: Int) -> Int in
    a + b
}
let subtract: (Int, Int) -> Int = { (a: Int, b: Int) -> Int in
    a - b
}
let divide: (Int, Int) -> Int = { (a: Int, b: Int) -> Int in
    a / b
}

func calculate(a: Int, b: Int, method: (Int, Int) -> Int) -> Int {
    method(a, b)
}

var calculated: Int
calculated = calculate(a: 50, b: 10, method: add)
print(calculated)

calculated = calculate(a: 50, b: 10, method: subtract)
print(calculated)

calculated = calculate(a: 50, b: 10, method: divide)
print(calculated)

calculated = calculate(a: 50, b: 10, method: { (left: Int, right: Int) -> Int in left * right })
print(calculated)