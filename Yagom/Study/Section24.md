## assert와 guard(assertion, early exit)
* 애플리케이션이 동작 도중에 생성하는 다양한 결과값을
* 동적으로 확인하고 안전하게 처리할 수 있도록
* 확인하고 빠르게 처리할 수 있음

### Assertion
* 어떤 결과, 조건들을 확인하는데에 사용할 수 있음
* 함수형태 이며 디버깅 모드에서만 동작함
* 배포하는 애플리케이션에서는 제외되며, 주로 디버깅 중 조건의 검증을 위해 사용함
<pre>
	var someInt: Int = 0
	assert(someInt == 0, “someInt != 0”)
	someInt = 1
	// assert(someInt == 0)	// 동작 중지, 검증 실패
	// assert(someInt == 0, “someInt != 0”) 	// 동작 중지, 검증 실패, 적어놓은 메시지 출력
	
	func functionWithAssert(age: Int?) {
		assert(age != nil, “age == nil”)
		assert((age! >= 0) && (age! <= 130), “나이값 입력이 잘못되었습니다”)
		print(“당신의 나이는 \(age!)세 입니다”)
	}
	
	functionWithAssert(age: 50)
	functionWithAssert(age: -1)	// 동작 중지, 검증 실패
	functionWithAssert(age: nil)	// 동작 중지, 검증 실패
</pre>

### guard(early exit)
* guard를 사용하여 잘못된 값의 전달 시
* 특정 실행 구문을 빠르게 종료함
* 디버깅 모드 뿐만 아니라 어떤 조건에서도 동작함
* guard의 else 블럭 내부에는
* 특정 코드블럭을 종료하는 지시어(return, break 등)가 꼭 있어야 함
* 타입 캐스팅, 옵셔널과도 자주 사용됨
* 그 외 단순 조건 판단 후 빠르게 종료할 때도 용이함

<pre>
	func functionWithGuard(age: Int?)  {
			guard let unwrappedAge = age, unwrappedAge < 130, unwrappedAge >= 0 else {
			print(“나이값 입력이 잘못되었습니다”)
			return
		}

		print(“당신의 나이는 \(unwrappedAge)세 입니다”)
	}

	var count = 1
	while true {
		guard count < 3 else {
			break
		}
		print(count)
		count += 1
	}
	
	func someFunction(info: [String: Any]) {
		guard let name = info[“name”] as? String else {
			return
		}

		guard let age = info[“age”] as? Int, age >= 0 else {
			return
		}

		print(“\(name): \(age)”)

		someFunction(info: [“name”: “Jenny”, “age”: “10”])
		someFunction(info: [“name”: “mike”])
		someFunction(info: [“name”: “youngjae”, “age”: 10])
	}
</pre>
