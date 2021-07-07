//
//  main.swift
//  Ex22
//
//  Created by 이영재 on 2021/07/08.
//
// 옵셔널 체이닝과 nil 병합 연산자
// 옵셔널 요소 내부의 프로퍼티로 또 다시 옵셔널이 연속적으로 연결되는 경우, 옵셔널 바인딩 시 옵셔널 바인딩을 연쇄적으로 구현해야 될 경우에 유용하게 사용할 수 있음

import Foundation

class Person {
    var name: String
    var home: Apartment?
    var job: String?

    init(name: String) {
        self.name = name
    }
}

class Apartment {
    var buildingNumber: String
    var roomNumber: String
    var `guard`: Person?
    var owner: Person?

    init(buildingNumber: String, roomNumber: String) {
        self.buildingNumber = buildingNumber
        self.roomNumber = roomNumber
    }
}

let youngjae: Person? = Person(name: "youngjae")
let apartment: Apartment? = Apartment(buildingNumber: "101", roomNumber: "202")
let superman: Person? = Person(name: "superman")

//MARK: - 옵셔널 체이닝을 사용하지 않고 옵셔널 바인딩을 하는 경우
func guardJobWithoutOptionalChaining(owner: Person?) {
    if let owner = owner {
        if let home = owner.home {
            if let `guard` = home.guard {
                if let guardJob = `guard`.job {
                    print("우리집 경비원의 직업은 \(guardJob)입니다.")
                } else {
                    print("우리집 경비원은 직업이 없습니다.")
                }
            }
        }
    }
}

guardJobWithoutOptionalChaining(owner: youngjae)

//MARK: - 옵셔널 체이닝을 사용해 옵셔널 바인딩을 하는 경우
// 옵셔널 체이닝의 결과값도 nil일 수 있으므로 결과 타입도 옵셔널임
func guardJobWithOptionalChaining(owner: Person?) {
    if let guardJob = owner?.home?.guard?.job {
        print("우리집 경비원의 직업은 \(guardJob)입니다.")
    } else {
        print("우리집 경비원은 직업이 없습니다.")
    }
}

guardJobWithOptionalChaining(owner: youngjae)

print(youngjae?.home?.guard?.job)

youngjae?.home = apartment
print(youngjae?.home)
print(youngjae?.home?.guard)

youngjae?.home?.guard = superman
print(youngjae?.home?.guard)
print(youngjae?.home?.guard?.name)

print(youngjae?.home?.guard?.job)
youngjae?.home?.guard?.job = "경비원"
print(youngjae?.home?.guard?.job)

//MARK: - nil 병합 연선자, ??
// 옵셔널 체이닝을 통한 값이 nil이면 default값 할당, nil이 아니면 옵셔널 체이닝을 통한 결과값 할당
var guardJob: String
guardJob = youngjae?.home?.guard?.job ?? "superman"
print(guardJob)

youngjae?.home?.guard?.job = nil
guardJob = youngjae?.home?.guard?.job ?? "superman"
print(guardJob)