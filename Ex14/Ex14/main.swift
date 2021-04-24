//
//  main.swift
//  Ex14
//
//  Created by 이영재 on 2021/04/24.
//
//

import Foundation

enum Weekday {
    case mon
    case tue
    case wed
    case thu, fri, sat, sun
}

var day: Weekday = Weekday.mon
day = .tue
print(day)

switch day {
case .mon, .tue, .wed, .thu:
    print("평일")
case .fri:
    print("불금")
case .sat, .sun:
    print("주말")
}

enum Fruit: Int {
    case apple = 0
    case grape = 1
    case peach
}

print("Fruit.peach.rawValue == \(Fruit.peach.rawValue)")

enum School: String {
    case elementary = "초등"
    case middle = "중등"
    case high = "고등"
    case university
}

print("School.middle.rawValue == \(School.middle.rawValue)")
print("School.university.rawValue == \(School.university.rawValue)")

let apple: Fruit? = Fruit(rawValue: 0)
if let orange: Fruit = Fruit(rawValue: 5) {
    print(orange)
} else {
    print("NO")
}

enum Month {
    case dec, jan, feb
    case mar, apr, may
    case jun, jul, aug
    case sep, oct, nov

    func printMessage() -> Void {
        switch self {
        case .mar, .apr, .may:
            print("봄")
        case .jun, .jul, .aug:
            print("여름")
        case .sep, .oct, .nov:
            print("가을")
        case .dec, .jan, .feb:
            print("겨울")
        }
    }
}

Month.mar.printMessage()
let march: Month = Month.mar
march.printMessage()
