//
//  main.swift
//  Ex34
//
//  Created by 이영재 on 2021/09/24.
//MARK: - 사용자 정의 연산자(Custom Operators)

postfix operator +++
extension Int {
    static postfix func +++(num: inout Int) {
        num += 2
    }
}

var numberOne: Int = 1
numberOne+++
print(numberOne)

//infix operator *+*
//extension Int {
//    static func *+*(left: Int, right: Int) -> Int {
//        return (left * right) + (left * right)
//    }
//}
//
//print(1 *+* 2)

precedencegroup MyPrecedence {
    higherThan: AdditionPrecedence
}

infix operator *+*: MyPrecedence
extension Int {
    static func *+*(left: Int, right: Int) -> Int {
        return (left * right) + (left * right)
    }
}

print(3 + 1 *+* 2)
