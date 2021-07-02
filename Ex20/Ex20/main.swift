//
//  main.swift
//  Ex20
//
//  Created by 이영재 on 2021/07/03.
//
// 상속(inheritance)

import Foundation

class Person {
    var name: String = ""

    func selfIntroduce() {
        print("저는 \(name)입니다.")
    }

    // 재정의 불가능
    final func sayHello() {
        print("hello")
    }

    // 타입 메서드
    // 재정의 불가능
    static func typeMethod() {
        print("typeMethod - static")
    }

    // 재정의 가능
    class func classMethod() {
        print("typeMethod - class")
    }

    // final 키워드
    // 재정의 불가능
    final class func finalClassMethod() {
        print("typeMethod - final class")
    }
}

class Student: Person {
    // 연산 프로퍼티로 재정의 가능.
//    override var name: String {
//        get {
//            super.name
//        }
//        set {
//            super.name = newValue
//        }
//    }
    var major: String = ""

    override func selfIntroduce() {
        print("저는 \(name)이고, 전공은 \(major)입니다.")
//        super.selfIntroduce()
    }

    override class func classMethod() {
        print("overridden typeMethod - class")
    }
}

let youngjae: Person = Person()
let hana: Student = Student()

youngjae.name = "youngjae"
hana.name = "hana"
hana.major = "Computer Engineering"

youngjae.selfIntroduce()
hana.selfIntroduce()

Person.typeMethod()
Person.classMethod()
Person.finalClassMethod()

Student.typeMethod()    // 부모클래스 메서드
Student.classMethod()   // 재정의한 메서드
Student.finalClassMethod()  //부모클래스 메서드