//
//  main.swift
//  Ex25
//
//  Created by 이영재 on 2021/07/26.
//
//

import Foundation

protocol Talkable {
    // protocol의 property 요구는 항상 var 키워드 사용
    var topic: String { get set }
    // 읽기 전용 프로퍼티 요구
    var language: String { get }

    func talk()

    init(topic: String, language: String)
}

//MARK: - 프로토콜 채택 및 준수
struct Person: Talkable {
    var topic: String
    var subject: String = ""
//    연산 프로퍼티 대체
//    var topic: String {
//        get {
//            return self.subject
//        }
//        set {
//            self.subject = newValue
//        }
//    }
    let language: String
//    연산 프로퍼티 대체
//    var language: String {
//        return "한국어"
//    }

    func talk() {
        print("\(topic)에 대해 \(language)로 말합니다")
    }

    init(topic: String, language: String) {
        self.topic = topic
        self.language = language
    }
}

//MARK: - 프로토콜 상속
// 클래스와 달리 다중 상속 가능
protocol Readable {
    func read()
}
protocol Writeable {
    func write()
}
protocol ReadSpeakable: Readable {
//    func read()
    func speak()
}
protocol ReadWriteSpeakable: Readable, Writeable {
    func speak()
}

struct SomeType: ReadWriteSpeakable {
    func speak() {
        print("Speak")
    }

    func read() {
        print("Read")
    }

    func write() {
        print("Write")
    }
}

//MARK: - 클래스 상속과 프로토콜
// 클래스 상속을 맨 처음 선언하고 후에 프로토콜 채택 목록 선언.
class SuperClass: Readable {
    func read() {
        print("Read")
    }
}
class SubClass: SuperClass, Writeable, ReadSpeakable {
    func write() {
        print("Write")
    }
    func speak() {
        print("Speak")
    }
}

//MARK: - 프로토콜 준수 확인
// is, as 연산자 사용
let sup: SuperClass = SuperClass()
let sub: SubClass = SubClass()

var someAny: Any = sup
print(someAny is Readable)
print(someAny is ReadSpeakable)

someAny = sub
print(someAny is Readable)
print(someAny is ReadSpeakable)

someAny = sup
if let someReadable: Readable = someAny as? Readable {
    someReadable.read()
}

if let someReadSpeakable: ReadSpeakable = someAny as? ReadSpeakable {
    someReadSpeakable.speak()
}

someAny = sub
if let someReadable: Readable = someAny as? Readable {
    someReadable.read()
}