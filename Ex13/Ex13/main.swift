//
//  main.swift
//  Ex13
//
//  Created by 이영재 on 2021/04/23.
//
//

import Foundation

class Sample {
    var mutableProperty: Int = 100
    let immutableProperty: Int = 100

    func instanceMethod() -> Void {
        print("instance method")
    }

    static func typeMethod() -> Void {
        print("type method - static")
    }

    class func classMethod() -> Void {
        print("type method - class")
    }
}

var mutableReference: Sample = Sample()
let immutableReference: Sample = Sample()

mutableReference.mutableProperty = 200
//mutableReference.immutableProperty = 200
mutableReference.instanceMethod()

immutableReference.mutableProperty = 200
//immutableReference.immutableProperty = 200
immutableReference.instanceMethod()

Sample.typeMethod()
Sample.classMethod()

class Student {
    var name: String = "unknown"
    var `class`: String = "Swift"

    class func selfIntroduce() -> Void {
        print("학생 타입입니다.")
    }

    func selfIntroduce() -> Void {
        print("저는 \(self.class)반 \(name)입니다")
    }
}

Student.selfIntroduce()

var youngjae: Student = Student()
youngjae.name = "youngjae"
youngjae.class = "Objective-C"
youngjae.selfIntroduce()

let jina: Student = Student()
jina.name = "jina"
jina.class = "Objective-C"
jina.selfIntroduce()