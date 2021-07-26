//
//  main.swift
//  Ex26
//
//  Created by 이영재 on 2021/07/26.
//
//

import Foundation

//MARK: - 연산 프로퍼티 추가(확장)
extension Int {
    var isEven: Bool {
        return self % 2 == 0
    }
    var isOdd: Bool {
        return self % 2 == 1
    }
}
print(1.isEven)
print(2.isEven)
print(3.isOdd)
var number: Int = 3
print(number.isOdd)
print(number.isEven)

//MARK: - 메서드 추가(확장)
extension Int {
    func multiply(by n: Int) -> Int {
        return self * n
    }
}

print(2.multiply(by: 3))
print(number.multiply(by: 3))

//MARK: - 이니셜라이저 추가(확장)
extension String {
    init(intTypeNumber: Int) {
        self = "\(intTypeNumber)"
    }
    init(doubleTypeNumber: Double) {
        self = "\(doubleTypeNumber)"
    }
}

let stringFromInt: String = String(intTypeNumber: 3)
let stringFromDouble: String = String(doubleTypeNumber: 3.0)
print(type(of: stringFromInt))
print(type(of: stringFromDouble))

//MARK: - 프로토콜 지향 프로그래밍, 프로토콜 초기 구현
protocol Talkable {
    var topic: String { get set }
    func talk(to: Self)
}

extension Talkable {
    func talk(to: Self) {
        print("\(to)! \(topic)")
    }
}

struct Person: Talkable {
    var topic: String
    var name: String

    init(topic: String, name: String) {
        self.topic = topic
        self.name = name
    }
}

let somePerson: Person = Person(topic: "Swift", name: "Youngjae")
let yagom: Person = Person(topic: "Swift5", name: "yagom")
somePerson.talk(to: yagom)