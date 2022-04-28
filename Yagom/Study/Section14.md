## 열거형(enum)
* Upper Camel Case 사용
* 각 case는 Lower Camel Case 사용
* 각 case는 그 자체가 고유의 값을 가짐
* Swift의 enum 타입은 다른 언어와 다른 존재

### 정의
<pre>
	enum 이름 {
		case 이름 1
		case 이름 2
		case 이름 3, 이름 4, 이름 5
		…
	}
</pre>

### 열거형 사용
<pre>
	enum Weekday {
		case mon
		case tue
		case wed
		case thu, fri, sat, sun
	}
	
	var day: Weekday = Weekday.mon
	day = .tue
	print(day)

	switch day {
		case .mon, .tue, .wed, .thu: 
			print(“평일”)
		case Weekday.fri:
			print(“불금”)
		case .sat, .sun:
			print(“주말”)
	}
</pre>

* switch 조건이 열거형인 경우 case가 한정적이라는 것을 컴파일러가 알 수 있기 때문에, switch구문에 열거형의 모든 case를 명시해 줄 경우 default를 구현해 주지 않아도 됨.
* 단, 하나의 case라도 명시해 주지 않으면 default를 반드시 구현해야 함.

### 열거형 rawValue
* c언어 처럼 enum의 각 case가 정수 값을 가질 수도 있으며 원시 값을 가질 수 있음.
* 이 때 rawValue를 사용함
* case 별로 각각 다른 값을 가져야 함.

<pre>
	enum Fruit: Int {
		case apple = 0
		case grape = 1
		case peach
		// 정수형의 경우에 값을 생략 하면 다음 값이 자동으로 할당 됨.
	}

	print(“Fruit.peach.rawValue == \(Fruit.peach.rawValue)”)

	enum School: String {
		case elementary = “초등”
		case middle = “중등”
		case high = “고등”
		case university
		// 정수형과 달리 자동으로 할당 되지 않음.
	}

	print(“School.middle.rawValue == \(School.middle.rawValue)”)
	print(“School.university.rawValue == \(School.university.rawValue)”)
</pre>

### 원시값, rawValue를 통한 열거형 인스턴스 초기화
* rawValue를 통해 case에 해당하는 값으로 인스턴스를 초기화 할 수 있음.
* rawValue가 case에 해당 하지 않을 수 있으므로(열거형에 rawVlaue에 해당하는 case가 없을 수 있으므로) rawValue를 통해 초기화한 인스턴스는 옵셔널 타입

<pre>
	enum Fruit: Int {
		case apple = 0
		case grape = 1
		case peach
	}

	let apple: Fruit? = Fruit(rawValue: 0)
	if let orange: Fruit = Fruit(rawValue: 5) {
		print(orange)
	} else {
		print(“NO”)
	}
</pre>

### 열거형 메서드

<pre>
	enum Month {
		case dec, jan, feb
		case mar, apr, may
		case jun, jul, aug
		case sep, oct, nov

		func printMessage() {
			switch self {
				case .mar, .apr, .may:
					print(“봄”)
				case .jun, .jul, .aug:
					print(“여름”)
				case .sep, .oct, .nov
					print(“가을”)
				case .dec, .jan, .feb
			}
		}
	}

	Month.mar.printMessage()
	let march: Month = Month.mar
	march.printMessage()
</pre>
