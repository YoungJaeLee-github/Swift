//
//  main.swift
//  Ex24
//
//  Created by 이영재 on 2021/07/20.
//
//

import Foundation

//MARK: - assert
//함수 형태이며, 디버깅 모드에서만 동작함, 실제 배포하는 애플리케이션에서는 제외
//디버깅 모드에서 조건의 검증을 위해 사용

var someInt: Int = 0
assert(someInt == 0, "someInt != 0")
someInt = 1
//assert(someInt == 0)
//assert(someInt == 0, "someInt != 0")

func functionWithAssertion(age: Int?) {
    assert(age != nil, "age == nil")
    assert((age! >= 0) && (age! <= 130), "나이 값 입력이 잘못되었습니다")
    print("당신의 나이는 \(age)세 입니다")
}

functionWithAssertion(age: 50)
//functionWithAssertion(age: -1)
//functionWithAssertion(age: nil)

//MARK: - guard(Early Exit)
//else 구문을 항상 동반하며, return(함수 종료), break(반복문 종료)도 항상 동반해야 함
//디버깅 모드 뿐만 아니라 실제 배포된 애플리케이션에서도 특정 구문을 검사해 조건에 맞지 않으면
//빠르게 종료할 수 있도록 처리할 수 있음
//타입캐스팅, 옵셔널에 많이 쓰이며 단순 조건 검사에도 많이 쓰임

func functionWithGuard(age: Int?) {
    guard let unwrappedAge = age, unwrappedAge < 130, unwrappedAge >= 0 else {
        print("나이 값 입력이 잘못되었습니다")
        return
    }

    // 옵셔널 바인딩(if-let)과 달리 변수를 블록 밖에서도 사용 가능
    print("당신의 나이는 \(unwrappedAge)세 입니다")
}

func someFunction(info: [String: Any]) {
    //딕셔너리 값은 키에 해당하는 값이 없을 수 있으므로 항상 옵셔널 타입
    guard let name = info["name"] as? String else {
        return
    }
    guard let age = info["age"] as? Int, age > 0, age <= 130 else {
        return
    }

    print("\(name): \(age)")
}

someFunction(info: ["name": "hana", "age": "10"])
someFunction(info: ["name": "mike"])
someFunction(info: ["name": "youngjae", "age": 26])