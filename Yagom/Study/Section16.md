## 클로저(closure)
* 코드의 블럭, 클로저는 주로 함수의 전달인자로 많이 사용됨
* 일급 시민(first-citizen)
* 변수, 상수 등으로 저장, 전달인자로 전달이 가능
* 함수: 이름이 있는 클로저
* 함수는 클로저의 부분 집합

### 정의
<pre>
	{ (매개변수 목록) -> 반환 타입 in
		실행 코드
	}
</pre>

### 클로저의 사용
<pre>
	// 함수를 사용한다면
	func someFunction(a: Int, b: Int) -> Int {
		return a+b
	}
	var sumResult: Int = sumFunction(a: 1, b: 2)
	print(sumResult)

	// 클로저 사용
	var sum: (Int, Int) -> Int = { (a: Int, b: Int) -> Int in return a+b }
	sumResult = sum(1, 2)
	print(sumResult)
	
	// 함수는 클로저의 일종(이름 있는 클로저) 이므로 
	// sum 변수에는 당연히 함수도 할당 가능
	sum = someFunction(a: b:)
	sumResult = sum(1, 2)
	print(sumResult)
</pre>

### 함수의 전달인자로서의 클로저
<pre>
	let add: (Int, Int) -> Int = { (a: Int, b: Int) -> Int in return a + b }
	let subtract: (Int, Int) -> Int = { (a: Int, b: Int) -> Int in return a - b }
	let divide: (Int, Int) -> Int = { (a: Int, b: Int) -> Int in return a / b }
	
	func calculate(a: Int, b: Int, method: (Int, Int) -> Int) -> Int {
		return method(a, b)
	}
	
	var calculated: Int
	calculated = calculate(a: 50, b: 10, method: add)
	print(calculated)
	
	calculated = calculate(a: 50, b: 10, method: subtract)
	print(calculated)

	calculated = calculate(a: 50, b: 10, method: divide)
	print(calculated)

	calculated = calculate(a: 50, b: 10, method: { (left: Int, right: Int) -> Int in 
			return left * right })
</pre>
