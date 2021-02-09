//
//  main.swift
//  Ex12
//
//  Created by 이영재 on 2021/02/09.
//
//

struct Sample {
    var mutableProperty: Int = 100
    let immutableProperty: Int = 100

    static var typeProperty: Int = 100

    func instanceMethod() {
        print("instance method")
    }

    static func typeMethod() {
        print("type method")
    }
}

var mutable: Sample = Sample()
mutable.mutableProperty = 200
//mutable.immutableProperty = 200 불가능

let immutable: Sample = Sample()
//immutable.mutableProperty = 200 인스턴스가 불변이기 때문에 불가능

Sample.typeProperty = 300
Sample.typeMethod()
mutable.instanceMethod()

struct Student {
    var name: String = "unknown"
    var `class`: String = "Swift"

    static func selfIntroduce() {
        print("Student 타입 입니다.")
    }

    func selfIntroduce() {
        print("\(self.class)반 \(self.name)입니다.")
    }
}

Student.selfIntroduce()
var youngjae: Student = Student()
youngjae.name = "youngjae"
youngjae.class = "Objective-C"
youngjae.selfIntroduce()

let jina: Student = Student()
//jina.name = "jina" 인스턴스가 불변이므로 불가능
jina.selfIntroduce()