//
//  main.swift
//  Ex23
//
//  Created by 이영재 on 2021/07/19.
//
//

import Foundation

class Person {
    var name: String = ""

    func breath() {
        print("숨을 쉽니다")
    }
}

class Student: Person {
    var school: String = ""

    func goToSchool() {
        print("등교를 합니다")
    }
}

class UniversityStudent: Student {
    var major: String = ""

    func goToMT() {
        print("멤버쉽 트레이닝을 갑니다 신남!")
    }
}

//MARK: - 업 캐스팅
var mike: Person = UniversityStudent() as Person
//var jina: UniversityStudent = Person() as UniversityStudent   // 컴파일 오류 자식 클래스에 부모클래스를 할당하려고 함
var jenny: Student = Student()
var jina: Any = Person() as Any // as Any 생략 가능

//MARK: - 다운 캐스팅
// 조건부 다운 캐스팅(as?)
var optionalCasted: Student?

optionalCasted = mike as? UniversityStudent
print(optionalCasted)
optionalCasted = jenny as? UniversityStudent    //nil
print(optionalCasted)
optionalCasted = jina as? UniversityStudent     //nil
print(optionalCasted)

// 강제 다운 캐스팅(as!)
var forceCasted: Student
forceCasted = mike as! UniversityStudent
print(forceCasted)
// 런타임 에러
//forceCasted = jenny as! UniversityStudent
//print(forceCasted)
//forceCasted = jina as! UniversityStudent
//print(forceCasted)

// 활용
func doSomethingWithSwitch(someone: Person) {
    switch someone {
    case is UniversityStudent:
        (someone as! UniversityStudent).goToMT()
    case is Student:
        (someone as! Student).goToSchool()
    case is Person:
        (someone as! Person).breath()
    }
}

func doSomething(someone: Person) {
    if let universityStudent = someone as? UniversityStudent {
        universityStudent.goToMT()
    } else if let student = someone as? Student {
        student.goToSchool()
    } else if let person = someone as? Person {
        person.breath()
    }
}

doSomethingWithSwitch(someone: mike)
doSomethingWithSwitch(someone: mike as Person)

doSomething(someone: mike as Person)
doSomething(someone: mike)