//
//  main.swift
//  Ex07
//
//  Created by 이영재 on 2021/01/30.
//

// 매개변수 기본 값
// 가장뒤에 위치하는 것이 좋음
// 호출 시 생략 가능
func greeting(friend : String, me : String = "YoungJae") -> Void {
    print("Hello \(friend)! I'm \(me)")
}

greeting(friend: "Lion")
greeting(friend: "Lion", me: "Lee")

// 전달인자 레이블
// 매개변수를 좀더 명확하게 표현하고 싶을 때 사용
// 함수 내부에서는 매개변수 이름으로 인식, 호출 할 때는 전달인자 레이블로 명시해주어야 함
// 같은 이름의 함수 중복처리에 용이함
func greeting(to friend: String, from me: String) -> Void {
    print("Hello \(friend)! I'm \(me)")
}

greeting(to: "Hana", from: "Youngjae")

// 가변 매개변수
// 가장 뒤에 위치하는 것이 좋음
// 함수당 하나만 가질 수 있음
// 전달 받을 인자의 개수가 명확하지 않을 때 사용
func sayHelloToFriends(me: String, friends: String...) -> String {
//    print(type(of: friends))
    return "Hello \(friends)! I'm \(me)!"
}

print(sayHelloToFriends(me: "youngjae", friends: "hana", "eric", "wing"))
// 생략 가능
print(sayHelloToFriends(me: "youngjae"))

// 데이터 타입으로서의 함수
// 객체로서 상수, 변수에 할당이 가능하며 매개변수로도 사용할 수 있음
// 반환 타입을 생략할 수 없음

var someFunction : (String, String) -> Void = greeting(to:from:)
someFunction("Eric", "YoungJae")

someFunction = greeting(friend:me:)
someFunction("Eric", "Youngjae")

//someFunction = sayHelloToFriends(me: <#T##String#>, friends: <#T##String...##String#>) // 타입이 다른 함수는 할당할 수 없음

// 매개변수로 전달
func runAnother(function: (String, String) -> Void) {
    function("Jenny", "Mike")
}

runAnother(function: greeting(friend:me:))
runAnother(function: someFunction)