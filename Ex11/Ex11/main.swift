//
//  main.swift
//  Ex11
//
//  Created by 이영재 on 2021/02/09.
//
// Optional Unwrapping

func printName(_ name: String) {
    print(name)
}

var myName: String? = nil
// printName(myName)// 전달되는 값이 Optional 이기 때문에 컴파일 오류 발생

// Optional Binding : if-let 구문으로 추출
if let name: String = myName {
    printName(name)
} else {
    print("myName == nil")
}

// "if-let 상수"에서 상수는 블록 안에서만 사용 가능
//printName(name)

var myName2: String? = "youngjae"
var yourName: String? = nil

if let name = myName2, let friend = yourName {
    print("\(name) and \(friend)")
}

yourName = "hana"
if let name = myName2, let friend = yourName {
    print("\(name) and \(friend)")
}

var myName3: String? = "youngjae"
printName(myName3!)
myName3 = nil
//print(myName3!) 강제 추출시 값이 없으므로 런타임 오류 발생

var yourName2: String! = nil
//printName(yourName2) nil이 전달되기 때문에 런타임 오류 발생