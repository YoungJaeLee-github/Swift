//
//  main.swift
//  Ex28
//
//  Created by 이영재 on 2021/07/29.
//
// 고차함수 - map, filter, reduce

//MARK: - 고차함수
//전달인자로 함수를 전달 받거나
//반환 값이 함수인 함수

//MARK: - map
//컨테이너의 데이터를 원하는 형태로 변형(transform)하여 새로운 컨테이너로 반환
let numbers: Array<Int> = [0, 1, 2, 3, 4]
var doubledNumbers: Array<Int> = []
var strings: Array<String> = []

// 기존 for 방식
for number in numbers {
    doubledNumbers.append(number * 2)
    strings.append("\(number)")
}

print(doubledNumbers)
print(strings)

var doubleNumbers: Array<Double> = []
// map 함수 사용
doubleNumbers = numbers.map({(number: Int) -> Double in
    return Double(number * 2)
})
strings = numbers.map({(number: Int) -> String in
    return "\(number)"
})

print(doubleNumbers)
print(strings)

// 클로저 고급 사용
// map의 마지막 전달인자가 클로저 이므로
// 후행클로저 사용 가능
doubledNumbers = numbers.map {(number: Int) -> Int in
    return number * 2
}
print("new doubledNumbers \(doubledNumbers)")

// 반환타입 생략
doubledNumbers = numbers.map({(number: Int) in
    return number * 2
})
print("new doubledNumbers \(doubledNumbers)")

// 단축 인자 이름
strings = numbers.map({"\($0)"})
print(strings)

// 반환 표현 생략
strings = numbers.map({(number: Int) -> String in
    "\(number)"
})
print(strings)

// 모든 축약 사용
doubleNumbers = numbers.map { Double($0) }
strings = numbers.map { "\($0)" }
print(doubleNumbers)
print(strings)

//MARK: - filter
//컨테이너 내부의 값을 조건에 맞는 값으로 걸러서 새로운 컨테이너로 반환
//반환타입이 Bool

let someNumbers: Array<Int> = [0, 1, 2, 3, 4]
var result: Array<Int> = []

//기존 for 사용
for number in someNumbers {
    if number % 2 == 0 {
        result.append(number)
    }
}
print(result)

//filter 함수 사용
let evenNumbers: Array<Int> = someNumbers.filter({(number: Int) -> Bool in
    return number % 2 == 0
})
print(evenNumbers)

//클로저 고급 사용
let oddNumbers: Array<Int> = someNumbers.filter { $0 % 2 != 0 }
print(oddNumbers)

//MARK: - reduce 사용
// 매개변수(전달인자)로 초기값이 존재 하며, 컨테이너 내부의 값을 모두 통합해서 반환(덧셈, 뺼셈, 곱셈, 나눗셈 등 가능)

let someArray: Array<Int> = [2, 4, 6, 8, 10]
var sum: Int = 0

// 기존 for 사용
for number in someArray {
    sum += number
}
print(sum)

// reduce 함수 사용
var reduceSum: Int = someArray.reduce(0, {(first: Int, second: Int) -> Int in
    return first + second
})
print(reduceSum)

var reduceSub: Int = someArray.reduce(0, {(first: Int, second: Int) -> Int in
    return first - second
})
print(reduceSub)

var reduceMul: Int = someArray.reduce(1, {(first: Int, second: Int) -> Int in
    return first * second
})
print(reduceMul)

var reduceDiv: Int = someArray.reduce(1, {(first: Int, second: Int) -> Int in
    return first / second
})
print(reduceDiv)

// 클로저 고급 사용
var sumFromThree: Int = someArray.reduce(3) { $0 + $1 }
print(sumFromThree)