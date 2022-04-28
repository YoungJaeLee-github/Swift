## 프로토콜
* 특정 역할을 수행하기 위한
* 프로퍼티, 이니셜라이저, 메서드 등의 요구사항을 정의
* 구조체, 클래스, 열거형은 프로토콜을 채택(Adopted)해서
* 프로토콜의 요구사항을 실제로 구현할 수 있음
* 어떤 프로토콜의 요구사항을 모두 따르는 타입은
* 그 프로토콜을 준수한다(Conform)라고 표현함
* 프로토콜의 요구사항을 충족시키려면 프로토콜이 제시하는 기능을 모두 구현해야 함
* 쉽게 말해 타입(구조체, 클래스, 열거형 등)이 꼭 구현했으면 하는 기능을 정의해 놓은 것

### 정의 문법
<pre>
	protocol 프로토콜 이름 {
		/* 정의부 */
	}
</pre>

### 구현
<pre>
	protocol Talkable {
		//프로퍼티 요구
		//프로퍼티 요구는 항상 var 키워드를 사용함
		//get은 읽기만 가능해도 상관 없다는 뜻이며
		//get과 set을 모두 명시하면
		//읽기 쓰기 모두 가능한 프로퍼티여야 함
		var topic: String { get set }
		var language: String { get }

		//메서드 요구
		func talk()

		// 이니셜라이저 요구
		init(topic: String, language: String)
	}
</pre>

### 프로토콜 채택 및 준수
<pre>
	// Person 구조체는 Talkable 프로토콜을 채택했습니다
	struct Person: Talkable {
		var topic: String
		let language: String
		// 읽기 전용 프로퍼티 요구는 연산 프로퍼티로 대체 가능함
		// var language: String { return “한국어” }

		// 읽기, 쓰기 프로퍼티도 연산 프로퍼티로 대체할 수 있음
		// var subject: String = “”
		// var topic: String {
		//	set {
		//		self.subject = newValue
		//	}
		//	get {
		//		return self.subject
		//	}
		// }
		
		func talk() {
			print(“\(topic)에 대해 \(language)로 말합니다”)
		}
		
		init(topic: String, language: String) {
			self.topic = topic
			self.language = language
		}
	}
</pre>

### 프로토콜 상속
* 프로토콜은 클래스와 다르게 다중상속이 가능함, 클래스는 단일 상속
<pre>
	protocol 프로토콜 이름: 부모 프로토콜 이름 목록 {
		/* 정의부 */
	}
</pre>

### 구현
<pre>
	protocol Readable {
		func read()
	}
	protocol Writeable {
		func write()
	}
	protocol ReadSpeakable: Readable {
		// 상속을 받았기 때문에 부모 프로토콜의 요구도 같이 요구함.
		// func read()
		func speak()
	}
	protocol ReadWriteSpeakable: Readable, Writeable {
		// 상속을 받았기 때문에 부모 프로토콜의 요구도 같이 요구함.
		// func read()
		// func write()
		func speak()
	}
	// 프로토콜을 채택한 타입은 프로토콜을 준수해야 함.
	// 요구사항을 하나라도 구현하지 않은 경우 오류.
	struct SomeType: ReadWriteSpeakable {
		func read() {
			print(“Read”)
		}
		func write() {
			print(“Write”)
		}
		func speak() {
			print(“Speak”)
		}
	}
</pre>

### 클래스 상속과 프로토콜
* 클래스에서 상속과 프로토콜 채택을 동시에 하려면
* 상속 받으려는 클래스를 먼저 명시하고(맨 처음)
* 그 뒤에 채택할 프로토콜 목록을 작성함
<pre>
	class SuperClass: Readable(프로토콜 채택) {
		func read() { print(“read”) }
	}
	class SubClass: SuperClass(상속), Writeable(프로토콜 채택), ReadSpeakable(프로토콜 채택) {
		func write() { print(“write”) }
		func speak() { print(“speak”) }
	}
</pre>

### 프로토콜 준수 확인
* 인스턴스가 특정 프로토콜을 준수하는지 확인할 수 있음
* is, as 연산자 사용
* 인스턴스는 as 연산자를 통해(타입 캐스팅) 특정 프로토콜 기능을 사용할 수 있음
<pre>
	let sup: SuperClass = SuperClass()
	let sub: SubClass = SubClass()
	
	var someAny: Any = sup
	someAny is Readable // true
	someAny is ReadSpeakable // false
	
	someAny = sub
	someAny is Readable // true
	someAny is ReadSpeakable // true

	someAny = sup
	
	if let someReadable: Readable = someAny as? Readable {
		someReadalbe.read() // read
	}

	if let someReadSpeakable: ReadSpeakable = someAny as? ReadSpeakable {
	someReadSpeakable.speak()	// 동작하지 않음
	}
	
	someAny = sub
	
	if let someReadable: Readable = someAny as? Readable {
		someReadable.read()	// read
	}
</pre>
