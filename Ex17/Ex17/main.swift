//
//  main.swift
//  Ex17
//
//  Created by 이영재 on 2021/06/30.
//
// advanced closure(클로저 고급)

import Foundation

func calculate(a: Int, b: Int, method: (Int, Int) -> Int) -> Int {
    method(a, b)
}

//MARK: - 후행 클로저
var result: Int
result = calculate(a: 10, b: 10) { (left: Int, right: Int) -> Int in
    return left + right
}
print(result)

//MARK: - 반환 타입 생략
result = calculate(a: 10, b: 10, method: { (left: Int, right: Int) in
    return left + right
})
print(result)

// 후행 클로저와 같이 사용
result = calculate(a: 10, b: 10) { (left: Int, right: Int) in
    return left + right
}
print(result)

//MARK: - 단축 인자이름
result = calculate(a: 10, b: 10, method: {
    return $0 * $1
})
print(result)

// 후행 클로저와 같이 사용
result = calculate(a: 10, b: 10) {
    return $0 * $1
}
print(result)

//MARK: - 암시적 반환 표현
result = calculate(a: 10, b: 10) {
    $0 * $1
}
print(result)

// 한 줄로 표현
result = calculate(a: 10, b: 10) {$0 / $1}
print(result)