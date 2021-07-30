## 제네릭(Generic)
* 제네릭을 이용해 코드를 구현하면 어떤 타입에도 유연하게 대응할 수 있음
* 제네릭을 이용해 구현한 기능과 타입은 재사용하기도 쉽고, 코드의 중복을 줄일 수 있기에 깔끔하고 추상적인 표현이 가능함

### 정의
<pre>
	제네릭을 사용하고자 하는 타입(struct, class, enum, protocol …) 이름<타입 매개변수>
	제네릭을 사용하고자 하는 함수 이름<타입 매개변수>(함수의 매개변수 …)
</pre>

### 제네릭을 사용하지 않은 swapTwoInts(_: _:) 함수
<pre>
	func swapTwoInts(_ a: inout Int, _ b: inout Int) {
		let temporaryA: Int = a
		a = b
		b = temporaryA
	}

	var numberOne: Int = 5
	var numberTwo: Int = 10

	swapTwoInts(&numberOne, &numberTwo)
	print(“\(numberOne), \(numberTwo)”)	// 10, 5

	func swapTwoStrings(_a: inout String, _ b: inout String) 
	…
</pre>

### 제네릭을 사용한 swapTwoValues(_: _:) 함수 
<pre>
	func swapTwoValues<타입>(_ a: inout T, _ b: inout T) {
		let temporaryA: T = a
		a = b
		b = temporaryA
	}
	var numberOne: Int = 5
	var numberTwo: Int = 10
	
	swapTwoValues(&numberOne, &numberTwo)
	print(“\(numberOne), \(numberTwo)”)	// 10, 5

	var stringOne: String = “A”
	var stringTwo: String = “B”
	swapTwoValues(&stringOne, &stringTwo)
	print(“\(stringOne), \(stringTwo)”)	// “B”, “A”
</pre>

### 제네릭 타입
* 제네릭 함수에 이어 제네릭 타입을 구현할 수 있음
* 사용자 정의 타입인 구조체, 클래스, 열거형 등이 어떤 타입과도 연관되어 동작할 수 있음
* Array와 Dictionary 타입이 자신의 요소로 모든 타입을 대상으로 동작할 수 있는 것과 유사함

### 제네릭을 사용하지 않은 IntStack 구조체 타입
<pre>
	struct IntStack {
		var items = [Int]()
		mutating func push(_ item: Int) {
			items.append(item)
		}
		mutating func pop() -> Int {
			return items.removeLast()
		}
	}
</pre>

### 제네릭을 사용한 Stack 구조체 타입
<pre>
	struct Stack<타입> {	
		var items = [Element]()
		mutating func push(_ item: Element) {
			items.append(item)
		}
		mutating func pop() -> Element {
			return items.removeLast()
		}
	}
</pre>

### 타입 제약
* 종종 제네릭 함수가 처리해야 할 기능이 특정 타입에 한정되어야만 처리할 수 있는 경우,
* 제네릭 타입을 특정 프로토콜을 따르는 타입만 사용할 수 있도록 제약을 두어야 하는 경우 타입 제약을 사용
* 타입 제약은 타입 매개변수가 가져야 할 제약사항을 지정할 수 있는 방법
* 가령, 타입 매개변수 자리에 사용할 실제 타입이 특정 클래스를 상속 받은 타입이어야 한다든지, 특정 프로토콜을 준수하는 타입이어야 한다는 등의 제약을 줄 수 있음
* 타입 제약은 <b>클래스 타입</b> 또는 <b>프로토콜</b>로만 줄 수 있음
* 가령, public struct Dictionary<Key : Hashable, Value> : Collection, ExpressibleByDictionaryLiteral { /* … */ }
* Key 타입 매개변수는 Hashable 프로토콜을 준수하는 타입만 사용 가능 함

### 제네릭을 사용한 뺄셈 함수의 잘못된 구현
<pre>
	func substractTwoValue<타입>(_ a: T, _ b: T) -> T {
		return a - b
	}
</pre>
* 뺄셈 연산이 가능한 타입이어야만 가능 함 -> 타입 제약을 명시해주면 됨.

### 프로토콜의 연관 타입(Associated Type)
* 프로토콜을 정의할 때 연관타입을 함께 정의하면 유용할 때가 있음
* 연관 타입은 프로토콜에서 사용할 수 있는 플레이스홀더 이름
* 제네릭에서는 어떤 타입이 들어올지 모를 때, 타입 매개변수를 통해 표현해 줄 수 있음
<pre>
	protocol Container {
		associatedtype ItemType
		var count: Int { get }
		mutating func append(_ item: ItemType)
		subscript(i: Int) -> ItemType { get }
	}
</pre>
