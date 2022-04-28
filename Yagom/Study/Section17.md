## 클로저 고급(advanced closure)
* 너무나 다양한 문법이 있기 때문에 가독성이 좋게 사용하는 것이 좋음.

### 후행 클로저
* 클로저가 함수의 마지막 전달인자라면,
* 마지막 매개변수 이름을 생략한 후
* 함수 소괄호 외부에 클로저를 구현할 수 있음.
<pre>
	func calculate(a: Int, b: Int, method: (Int, Int) -> Int) -> Int {
		return method(a, b)
	}
	
	var result: Int
	result = calculate(a: 10, b: 10) { (left: Int, right: Int) -> Int in 
		return left + right
	}
	print(result)
</pre>

### 반환타입 생략
* calculate 함수의 method 매개변수는
* Int 타입을 반환할 것이라는 사실을 컴파일러가 알고 있기 때문에
* 굳이 클로저에서 반환타입을 명시해 주지 않아도 됨.
* in 키워드는 생략 불가.
<pre>
	func calculate(a: Int, b: Int, method: (Int, Int) -> Int) -> Int {
		return method(a, b)
	}
	
	var result: Int
	result = calculate(a: 10, b: 10, method: { (left: Int, right: Int) in
		return left + right
	}) 
	print(result)

	// 후행 클로저와 같이 사용 가능
	result = calculate(a: 10, b: 10) {(left: Int, right: Int) in 
		return left + right
	})
	print(result)
</pre>

### 단축 인자이름
* 클로저의 매개변수 이름이 굳이 불필요하다면 단축 인자이름을 활용할 수 있음
* 단축 인자이름은 클로저의 매개변수의 순서대로 $0, $1… 처럼 표현함
* 반환타입 생략과 마찬가지로 컴파일러가 calculate 함수의 마지막 method의 매개변수 자료형을 알 고 있기 때문에 생략 가능
* in 키워드도 생략 가능
<pre>
	func calculate(a: Int, b: Int, method: (Int, Int) -> Int) -> Int {
		return method(a, b)
	}
	
	var result: Int
	result = calculate(a: 10, b: 10, method: { 
		return $0 + $1
	}) 
	print(result)

	// 후행 클로저와 같이 사용 가능
	result = calculate(a: 10, b: 10) {
		return $0 + $1
	})
	print(result)
</pre>

### 암시적 반환 표현
* 클로저가 반환하는 값이 있다면,
* 클로저의 마지막 줄의 결과값은 암시적으로 반환값으로 취급하기 때문에 return 키워드 생략 가능
<pre>
	func calculate(a: Int, b: Int, method: (Int, Int) -> Int) -> Int {
		return method(a, b)
	}
	
	var result: Int
	result = calculate(a: 10, b: 10) {
		$0 + $1
	}
	print(result)

	// 간결하게 한 줄로 표현 가능함
	result = calculate(a: 10, b: 10) { $0 + $1 }
	print(result)
</pre>

### 축약하지 않은 클로저 문법과 축약 후의 문법 비교
<pre>
	func calculate(a: Int, b: Int, method: (Int, Int) -> Int) -> Int {
		return method(a, b)
	}
	
	var result: Int
	
	// 축약 X
	result = calculate(a: 10, b: 10, method: { (left: Int, right: Int) -> Int in 
		return left + right
	})
	
	// 축약 O
	result = calculate(a: 10, b: 10) { $0 + $1 }
	
	print(result)
</pre>
