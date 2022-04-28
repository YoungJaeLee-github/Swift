//
//  main.swift
//  Ex06
//
//  Created by 이영재 on 2021/01/27.
//

import Foundation

// 함수 기본 형태
func func1(a : Int, b : Int) -> Int {
    return a+b
}

// 반환 값이 없는 함수
func func2(a : Int, b : Int) -> Void {
    print(a+b)
}

func func3(a : Int, b : Int) {
    print(a+b)
}

// 매개변수가 없는 함수
func func4() -> Int {
    return Int.max
}

// 매개변수와 반환 값이 없는 함수
func func5() -> Void {
    print("Hello, Swift")
}

func func6() {
    print("Hello, Algorithm")
}

var sum = func1(a: 1, b: 100)
print(sum)

func2(a: 1, b: 10)

func3(a: 4, b: 5)

var max = func4()
print(max)

func5()
func6()
