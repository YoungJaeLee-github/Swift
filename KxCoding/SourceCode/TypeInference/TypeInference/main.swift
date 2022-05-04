//
//  main.swift
//  TypeInference
//
//  Created by 이영재 on 2022/05/04.
//MARK: - Type Inference

import Foundation

print("1. Type Inference")

let num = 1
print(type(of: num))

let num2 = 1.1
print(type(of: num2))

let str = "Swift"
print(type(of: str))

let ch: Character = " " // Swift 에서는 "" 안에 어떤 문자가 오든 기본적으로 String으로 인식 하기 때문에, Character는 반드시 자료형을 명시해주어야 함
print(type(of: ch))

let isValid = true
print(type(of: isValid))

let isValid2 = false
print(type(of: isValid2))

//MARK: - Type Annotation
print("\n2. Type Annotation")

let number: Int = 1
print(type(of: number))

let number2: Double = 1.1
print(type(of: number2))

let string: String = "Swift"
print(type(of: string))

let validation: Bool = true
print(type(of: validation))

let validation2: Bool = false
print(type(of: validation2))
