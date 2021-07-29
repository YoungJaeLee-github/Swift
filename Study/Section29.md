## 제네릭(Generics)
* 포괄적인, 이라는 개념으로
* 유연하고 재사용성 높은 코드를 작성할 수 있음
* Array와 Dictionary는 Generic 컬렉션
<pre>
	func swapTwoInts(_ a: inout Int, _ b: inout Int) {
		let tempA = a
		a = b
		b = tempA
	}

	func swapTwoDoubles
	func swapTwoStrings
	…
</pre>
* 결국 두 변수를 Swap하는데 타입마다 따로 함수를 만들어줘야 되므로
* 반복을 줄이기 위해 Generic을 사용하게 됨
<pre>
	func swapTwoValues<T>(_a: inout T, _b: inout T) {
		let tempA = a
		a = b
		b = tempA
	}
</pre>
* T는 타입 파라미터 및 placeholder로 이 때 a의 T와 b의 T 타입은 같아야 함
* 함수가 호출될 때 마다 T타입이 결정됨

### 타입 제약(Type Constraint)
* Generic은 모든 타입을 포함하지만
* 특정한 타입만 Generic 함수를 사용하기 위해 타입 제약을 사용할 수 있음
<pre>
	func someFunction<T: SomeClass, U: SomeProtocol>(someT: T, someU: U) {
	}
</pre>
