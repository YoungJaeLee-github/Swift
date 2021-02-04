## 옵셔널(Optional)
* 값이 “있을 수도, 없을 수도 있음”

### Optional을 사용하는 이유! (nil의 가능성을 명시적으로 표현)
* nil 가능성을 문서화 하지 않아도 코드만으로 충분히 표현 가능함
* 문서/주석 작성 시간을 절약할 수 있음
* 명시적으로 표현함으로써 전달 받은 값이 옵셔널이 아니라면 nil체크를 하지 않더라도 안심하고 사용할 수 있음
* 효울적인 코딩을 할 수 있음
* 예외 상황을 최소화하는 안전한 코딩을 할 수 있음

<pre>
	// someOptionalParam can be nil
	func someFunction(someOptionalParam: Int?) {
		// insert code
	}

	func someFunction(someParam: Int) {
		//insert code
	}

	someFunction(someOptionalParam: nil)
	// someFunction(someParam: nil) // 옵셔널이 아닌 매개변수이기 때문에 불가능함	

	* 주석이 없어도 에러가 발생하기 때문에 작성 시간을 절약할 수 있음
</pre>

### Optional(enum + general)
* 옵셔널은 enum과 general의 합작품

<pre>
	enum Optional<Wrapped> : ExpressibleNyNilLiteral {
		case none
		case some(Wrapped)
	}
	
	let optionalValue: Optional<Int> = nil // 완전한 문법
	let optionalValue: Int? = nil // 축약 문법 “?”로 표현(띄어쓰기 하면 안됨)
</pre>

### Implicitly Unwrapped Optional
* 암시적 추출 옵셔널
* “!” 기호로 표현(띄어쓰기 하면 안됨)
* 일반 변수처럼 사용 가능하며, nil 할당이 가능함
* Runtime Error를 발생시킬 수 있음

<pre>
	var optionalValue: Int! = 100
	
	switch optionalValue {
		case .none:
			print(“This Optional variable is nil”)
		case .some(let value):
			print(“Value is \(value)”)
	}

	// 암시적 추출 옵셔널 일반 변수 처럼 사용
	optionalValue = optionalValue + 1
	// nil 할당 가능
	optionalValue = nil
	// nil을 할당 함으로써 잘못된 접근으로 인한 런타임 오류 발생
	optionalValue = optionalValue + 1
</pre>

### 일반 Optional
* “?” 기호로 표현(띄어쓰기 하면 안됨)
* 일반 변수처럼 사용 불가능함, Optional 타입이기 때문
* nil을 할당할 수 있음

<pre>
	var optionalValue: Int? = 100
	switch optionalValue {
		case .none:
			print(“This Optional variable is nil”)
		case .some:
			print(“Value is \(value)”)
	}

	// nil 할당 가능
	optionalValue = nil
	// 기존 변수처럼 사용 불가 - 옵셔널과 일반 값은 다른 타입이므로 연산 불가
	//optionalValue = optionalValue + 1
</pre>
