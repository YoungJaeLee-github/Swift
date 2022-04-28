//
//  main.swift
//  Ex03
//
//  Created by 이영재 on 2021/01/14.
//

// 기본 자료형
// Bool, Int, UInt, Float, Double, Character, String

// Bool
var someBool : Bool = true
someBool = false
// C언어 처럼 someBool = 0 or someBool = 1 불가능

// Int 기본적으로 64 bits(8 Bytes)
var someInt : Int = 3
//someInt = 100.1 정수 자료형에 실수 대입 불가능

// UInt(UnSignedInt)
var someUInt : UInt = 100
// someUInt = -100 불가능

// Float 기본적으로 32 bits(4Bytes)
var someFloat : Float = 3.14
someFloat = 3 // 실수 자료형에 정수 대입은 가능
//someFloat = someInt 단, 다른 자료형 사이의 직접적인 대입은 불가능

var someDouble : Double = 3.14
someDouble = 3 // 가능
//someDouble = someFloat 불가능
//someDouble = someInt 불가능

var somechar : Character = "A"

var someString : String = "A"
someString = "ABCDEFG"
//someString = somechar 불가능