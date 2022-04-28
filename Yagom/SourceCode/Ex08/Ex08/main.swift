//
//  main.swift
//  Ex08
//
//  Created by 이영재 on 2021/01/30.
//
let someInteger : Int  = 100

if someInteger < 100 {
    print("100 미만")
} else if someInteger > 100 {
    print("100 초과")
}
else{
    print("100")
}

switch someInteger {
case 0:
    print("zero")
case 1..<100:
    print("1~99")
case 100:
    print("100")
case 101...Int.max:
    print("over 100")
default:
    print("unknown")
}

switch "youngjae" {
case "Mike":
    print("Mike")
case "youngjae":
    print("youngjae!")
default:
    print("unknown")
}
