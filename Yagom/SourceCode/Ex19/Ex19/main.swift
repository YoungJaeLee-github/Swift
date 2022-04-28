//
//  main.swift
//  Ex19
//
//  Created by 이영재 on 2021/07/02.
//
// Property Observer

import Foundation

struct Money {
    var currencyRate: Double = 1100 {
        willSet(newRate) {
            print("환율이 \(currencyRate)에서 \(newRate)으로 변경될 예정입니다.")
        }
        didSet(oldRate) {
            print("환율이 \(oldRate)에서 \(currencyRate)으로 변경되었습니다.")
        }
    }

    var dollar: Double = 0 {
        willSet {
            print("\(dollar)달러 에서 \(newValue)달러로 변경될 예정입니다.")
        }
        didSet {
            print("\(oldValue)달러 에서 \(dollar)달러로 변경되었습니다.")
        }
    }

    // 연산 프로퍼티(Computed Property)는 초기화 할 수 없으며,
    // 프로퍼티 감시자(Property Observer)와 혼용해서 사용할 수 없음.
    var won: Double {
        get {
            return dollar * currencyRate
        }
        set {
            dollar = newValue / currencyRate
        }
    }
}

var moneyInMyPocket: Money = Money()
moneyInMyPocket.currencyRate = 1150
moneyInMyPocket.dollar = 10
print(moneyInMyPocket.won)

var someValue: Int = 100 {
    willSet {
        print("\(someValue)에서 \(newValue)로 변경될 예정입니다.")
    }
    didSet {
        print("\(oldValue)에서 \(someValue)로 변경될 예정입니다.")
    }
}

someValue = 200
print(someValue)