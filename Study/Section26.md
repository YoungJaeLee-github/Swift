## 익스텐션(Extension)
* 익스텐션은 구조체, 클래스, 열거형, 프로토콜 타입에
* 새로운 기능을 추가할 수 있는 기능
* 기능을 추가하려는 타입의 구현된 소스 코드를
* 알지 못하거나 볼 수 없다 해도,
* 타입만 알고 있다면 그 타입의 기능을 확장할 수도 있음
* 연산 타입 프로퍼티 / 연산 인스턴스 프로퍼티
* 타입 메서드 / 인스턴스 메서드
* 이니셜라이저
* 서브스크립트
* 중첩 타입
* 특정 프로토콜을 준수할 수 있도록 기능 추가
* 기존에 존재하는 기능을 재정의할 수는 없음

### 정의 문법
<pre>
	extension 확장할 타입 이름 {
		/* 타입에 추가될 새로운 기능 구현 */
	}
</pre>
* 익스텐션은 기존에 존재하는 타입이
* 추가적으로 다른 프로토콜을 채택할 수 있도록
* 확장할 수도 있음
<pre>
	extension 확장할 타입 이름: 프로토콜1, 프로토콜2, 프로토콜3 … {
		/* 프로토콜 요구사항 구현 */
	}
</pre>

### 익스텐션 구현
* 연산 프로퍼티 추가
<pre>
	extension Int {
		var isEven: Bool {
			return self % 2 == 0
		}
		var isOdd: Bool {
			return self % 2 == 1
		}
	}

	print(1.isEven)
	print(2.isEven)
	print(1.isOdd)
	print(2.isOdd)

	var number: Int = 3
	print(number.isEven)
	print(number.isOdd)

	number = 2
	print(number.isEven)
	print(number.isOdd)
</pre>

* 메서드 추가
<pre>
	extension Int {
		func multiply(by n: Int) -> Int {
			return self * n
		}
	}
	print(3.multiply(by: 2))
	print(4.multiply(by: 5))

	number = 3
	print(number.multiply(by: 2))
	print(number.multiply(by: 3))
</pre>

* 이니셜라이저 추가
<pre>
	extension String {
		init(intTypeNumber: Int) {
			self = “\(intTypeNumber)”
		}
		init(doubleTypeNumber: Double) {
			self = “\(doubleTypeNumber)”
		}
	}
	
	let stringFromInt: String = String(intTypeNumber: 100)
	let stringFromDouble: String = String(doubleTypeNumber: 100.0)
</pre>

### 프로토콜 지향 프로그래밍, 프로토콜 초기 구현
* POP(protocol oriented programming), 프로토콜 지향 프로그래밍 에서는 프로토콜과 익스텐션을 통해 중복된 코드를 피하고
* 기능 모듈화를 보다 효율적이게 할 수 있음
<pre>
	protocol Talkable {
		var topic: String { get set }
		func talk(to: Self)
	}
	
	struct Person: Talkable {
		var topic: String
		var name: String

		init(topic: String, name: String) {
			self.topic = topic
			self.name = name
		}
	}

	extension Talkable {
		func talk(to: Self) {
			print(“\(to)! \(topic)”)
		}
	}
</pre>
