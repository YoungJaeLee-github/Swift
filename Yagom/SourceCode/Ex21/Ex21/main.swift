//
//  main.swift
//  Ex21
//
//  Created by 이영재 on 2021/07/07.
//
// 인스턴스 생성과 소멸(init, deinit)

import Foundation

//MARK: - 저장프로퍼티 초기 값
class PersonA {
    // 이니셜라이저가 없는 경우 저장 프로퍼티 초기값이 필요함
    var name: String = "unknown"
    var age: Int = 0
    var nickName: String = "nick"
}
let somePerson: PersonA = PersonA()
print(somePerson.name, somePerson.age, somePerson.nickName)
somePerson.name = "nobody"
somePerson.age = 100
somePerson.nickName = "n"
print(somePerson.name, somePerson.age, somePerson.nickName)

//MARK: - init, 이니셜라이저
class PersonB {
    var name: String
    var age: Int
    var nickName: String

    init(name: String, age: Int, nickName: String) {
        self.name = name
        self.age = age
        self.nickName = nickName
    }
}

let hana: PersonB = PersonB(name: "hana", age: 26, nickName: "h")
print(hana.name)

//MARK: - 옵셔널 저장 프로퍼티, 초기 값이 꼭 필요 없을 때
class PersonC {
    var name: String
    var age: Int
    var nickName: String?

    // 자신의 이니셜라이저를 사용할 때, 중복을 피할 수 있음.
    convenience init(name: String, age: Int, nickName: String) {
        self.init(name: name, age: age)
        self.nickName = nickName
    }

    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}

let jenny: PersonC = PersonC(name: "jenny", age: 10)
let mike: PersonC = PersonC(name: "mike", age: 15, nickName: "m")

//MARK: - 저장 프로퍼티가 암시적 추출 옵셔널인 경우, 프로퍼티가 인스턴스 사용에 꼭 필요하지만 초기값을 할당하지 않고자 할 때 사용
class Puppy {
    var name: String
    var owner: PersonC!

    init(name: String) {
        self.name = name
    }

    func goOut() {
        print("\(name)가 주인 \(owner.name)와 산책을 합니다.")
    }
}

let happy: Puppy = Puppy(name: "happy")
//happy.goOut() -> Runtime Error
happy.owner = jenny
happy.goOut()

//MARK: - 실패 가능한 이니셜라이저, 인스턴스 생성에 실패할 경우 nil을 반환.
class PersonD {
    var name: String
    var age: Int
    var nickName: String?

    init?(name: String, age: Int) {
        if (0...120).contains(age) == false {
            return nil
        }
        if name.count == 0 {
            return nil
        }
        self.name = name
        self.age = age
    }
}

let john: PersonD? = PersonD(name: "john", age: 23)
let joker: PersonD? = PersonD(name: "joker", age: 123)
let batman: PersonD? = PersonD(name: "", age: 10)

print(joker, batman)

//MARK: - deinit, 디이니셜라이저
// 클래스 타입에만 사용가능하며, 클래스 인스턴스가 메모리에서 해제될 때 수행해야할 동작을 구현할 수 있음
class PersonE {
    var name: String
    var pet: Puppy?
    var child: PersonC

    init(name: String, child: PersonC) {
        self.name = name
        self.child = child
    }

    deinit {
        if let petName = pet?.name {
            print("\(name)가 \(child.name)에게 \(petName)를 인도합니다.")
            self.pet?.owner = child
        }
    }
}

var donald: PersonE? = PersonE(name: "donald", child: jenny)    // 메모리 해제 시 nil을 할당 해 주어야 하기 때문에 옵셔널 타입으로 선언
donald?.pet = happy
donald = nil    // 메모리에서 해제될 때 디이니셜라이저가 동작 함.