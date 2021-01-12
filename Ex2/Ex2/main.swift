//
//  main.swift
//  SwiftStudy
//
//  Created by 이영재 on 2021/01/12.
//

let constant : String = "차후에 변경이 불가능한 상수 let"
var variable : String = "차후에 변경이 가능한 변수 var"

variable = "변수는 이렇게 차후에 다른 값을 할당할 수 있음"
//constant = "상수는 차후에 값을 변경할 수 없음"

// 상수 선언 후 나중에 값 할당
// 나중에 할당할 경우 타입을 반드시 명시해 주어야 함
let sum : Int
let inputA: Int = 100
let inputB: Int = 200

// 선언 후 첫 할당
sum = inputA + inputB
//sum = 1 후에 값 변경 불가능(상수)

// 변수 선언 후 나중에 값 할당
// 나중에 할당할 경우 타입을 반드시 명시해ㅔ 주어야 함
var nickName : String
// 값 할당 전에 변수 사용 불가능 Initialize 해줘야 함
nickName = "LYJ"

// 후에 값 변경 가능(변수)
nickName = "YoungJae"
