//
//  main.swift
//  Ex04
//
//  Created by 이영재 on 2021/02/05.
//
//

var someAny: Any = 100
someAny = "어떤 타입도 수용 가능함"
someAny = 123.12

// let someDouble: Double = someAny 타입이 다르므로 불가능

class someClass {}
var someAnyObject: AnyObject = someClass()

// someAny = nil 어떤 타입도 수용할 수 있지만 nil(없는 값)은 수용할 수 없음
// someAnyObject = nil 불가능