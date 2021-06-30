//
//  main.swift
//  Ex18
//
//  Created by 이영재 on 2021/06/30.
//
// 프로퍼티(Property)

import Foundation

//MARK: - 정의
struct Student {
    // 인스턴스 저장 프로퍼티
    var name: String = ""
    var `class`: String = "Swift"
    var koreanAge: Int = 0

    // 인스턴스 연산 프로퍼티
    var westernAge: Int {
        get {
            return koreanAge - 1
        }
        set(inputValue) {
            koreanAge = inputValue + 1
        }
    }

    // 타입 저장 프로퍼티
    static var typeDescription: String = "학생"

    /*
		//인스턴스 메서드
		func selfIntroduce() {
			print(“저는 \(self.class)반 \(name)입니다”)
		}
	*/

    // 읽기 전용 인스턴스 연산 프로퍼티
    // 쓰기 전용은 없음, 읽기 쓰기 혹은 읽기 전용 프로퍼티만 가능함
    // 메서드 대체 가능.
    var selfIntroduction: String {
        get {
            return "저는 \(self.class)반 \(name)입니다"
        }
    }

    /*
		//타입 메서드
		static func selfIntroduce() {
			print(“학생타입입니다”)
		}
	*/
    //읽기 전용 타입 연산 프로퍼티
    //읽기 전용에서는 get을 생략할 수 있음
    static var selfIntroduction: String {
        return "학생타입입니다"
    }
}

//MARK: - 사용
// 타입 연산 프로퍼티 사용
print(Student.selfIntroduction)

// 인스턴스 생성
var youngjae: Student = Student()
youngjae.koreanAge = 26

// 인스턴스 저장 프로퍼티 사용
youngjae.name = "youngjae"
print(youngjae.name)

// 인스턴스 연산 프로퍼티 사용
print(youngjae.selfIntroduction)
print("제 한국 나이는 \(youngjae.koreanAge)살 이고, 미국 나이는 \(youngjae.westernAge)살 입니다.")

//MARK: - 응용
struct Money {
    // 저장 프로퍼티
    var currencyRate: Double = 1100
    var dollar: Double = 0

    // 연산 프로퍼티
    var won: Double {
        get {
            return dollar * currencyRate
        }
        set {
            // 별 다른 매개변수가 없으면 암시적으로 newValue로 사용 가능함.
            dollar = newValue / currencyRate
        }
    }
}

var moneyInMyPocket: Money = Money()
moneyInMyPocket.won = 11000
print(moneyInMyPocket.won)

moneyInMyPocket.dollar = 10
print(moneyInMyPocket.won)

//MARK: - 지역변수, 전역변수
// 지역/전역 변수에도 저장 프로퍼티, 연산 프로퍼티의 기능을 모두 사용할 수 있음
var a: Int = 10
var b: Int = 20
var sum: Int {
    return a + b
}
print(sum)

var summation: Int {
    get {
        return a + b
    }
    set {
        a += newValue
        b += newValue
    }
}

summation = 20
print(summation)