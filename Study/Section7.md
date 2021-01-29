## 함수 고급
### 매개변수 기본 값
* 함수의 매개변수의 값이 들어오지 않아도 자동으로 매개변수를 갖게 되는 것
* 매개변수 목록 중 가장 뒤쪽에 위치하는 것이 좋음
* 기본 값을 가지는 매개변수는 호출 시 생략할 수 있음

<pre>
	func 함수이름(매개변수1이름: 매개변수1타입, 매개변수2이름 : 매개변수2타입 = 매개변수 기본값 …) -> 반환타입 {
		함수 구현부
		return 반환값
	}
</pre>

<pre>
	func greeting(friend : String, me: String = “YoungJae”) {
		print(“Hello \(friend)! I’m \(me)”)
	}

	greeting(friend: “Lion”)  // Hello Lion! I’m YoungJae
	greeting(friend: “Lion”, me: “Lee”) // Hello Lion! I’m Lee
</pre>

### 전달인자 레이블
* 함수를 호출할 때 매개변수의 역할을 좀 더 명확하게 하거나 함수 사용자의 입장에서 표현하고자 할 때 사용함
* 전달인자 레이블을 사용하면, 함수의 중복처리도 쉽게 할 수 있음

<pre>
	func 함수이름(전달인자 레이블 매개변수이름 : 매개변수타입, …) -> 반환타입 {
		함수 구현부
		return 반환 값
	}

</pre>

<pre>
	// 함수 내부에서 전달인자 레이블을 사용할 때에는 매개변수 이름을 사용함
	func greeting(to friend: String, from me: String) {
		print(“Hello \(friend)! I’m \(me)”)
	}

	// 함수를 호출할 때에는 전달인자 레이블을 사용해야 함
	greeting(to: “Hana”, from: “youngjae”)
</pre>

### 가변 매개변수
* 전달해야 할 매개변수의 개수가 명확하지 않은 경우에 사용할 수 있음
* 가변 매개변수는 함수당 하나만 가질 수 있음
* 가장 뒤에 위치하는 것이 좋음

<pre>
	func 함수이름(매개변수1이름: 매개변수1타입, 전달인자 레이블 매개변수2이름 : 매개변수2타입…) -> 반환타입 {
		함수 구현부
		return 반환 값
	}
</pre>

<pre>
	func sayHelloToFriends(me: String, friends: String…) -> String {
		return “Hello \(friends)! I’m\(me)!”
	}

	print(sayHelloToFriends(me: “youngjae”, friends: “hana, “eric”, “wing”))
	// Hello ["hana”, “eric”, “wing”]! I’m youngjae!

	print(sayHelloToFriends(me: “youngjae”))
	// 생략하고 싶을땐 레이블을 없애주면 됨
	// Hello []! I’m youngjae!
</pre>

#### 함수의 다양한 모양은 모두 섞어서 사용 가능 함

### 데이터 타입으로서의 함수
* Swift는 함수형 프로그래밍 패러다임을 포함하는 다중 패러다임 언어
* Swift의 함수는 일급객체이므로 변수, 상수 등에 저장이 가능함
* 매개변수를 통해 전달할 수 있음

### 함수의 타입표현
* 반환 타입을 생략할 수 없음

<pre>
	(매개변수1타입, 매개변수2 타입 …) -> 반환타입
</pre>

<pre>
	var someFunction: (String, String) -> Void = greeting(to:from)
	someFunction(“Eric”, “youngjae”) // Hello Eric!, I’m youngjae

	someFunction = greeting(friend:me:)
	someFunction(“Eric”, “youngjae”) // Hello Eric!, I’m youngjae
</pre>

* 타입이 다른 함수는 할당할 수 없음

<pre>
	// someFunction = sayHelloToFriends(me: friends:) //타입이 다른 함수는 할당 할 수 없음
</pre>

<pre>
	func runAnother(function: (String, String) -> Void) {
		function(“Jenny”, “Mike”)
	}

	runAnother(function: greeting(friend:me:)) // Hello Jenny! I’m Mike
	runAnother(function: someFunction) // Hello Jenny! I’m Mike
</pre>
