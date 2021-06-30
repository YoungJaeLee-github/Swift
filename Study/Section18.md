## 프로퍼티(Property)
* 구조체, 클래스, 열거형 내부에 구현할 수 있음
* 다만 열거형 내부에는 연산 프로퍼티만 구현할 수 있음
* 연산 프로퍼티는 var로만 선언할 수 있음

### 프로퍼티 종류
* 저장 프로퍼티(stored property)
* 연산 프로퍼티(computed property)
* 인스턴스 프로퍼티(instance property)
* 타입 프로퍼티(type property)

<pre>
	struct Student {
		// 인스턴스 저장 프로퍼티
		var name: String = “”
		var `class`: String = “Swift”
		var koreanAge: Int = 0
		
		//인스턴스 연산 프로퍼티
		var westernAge: Int {
			get  {
				return koreanAge - 1
			}
			set(inputValue) {
				koreanAge = inputValue + 1
			}
		}

		//타입 저장 프로퍼티
		static var typeDescription: String = “학생”

		/*
		//인스턴스 메서드
		func selfIntroduce() {
			print(“저는 \(self.class)반 \(name)입니다”)
		}
		*/
		
		//읽기 전용 인스턴스 연산 프로퍼티
		//쓰기 전용은 없음, 읽기 쓰기 혹은 읽기 전용만 가능함
		var selfIntroduction: String {
			get {
				return “저는 \(self.class)반 \(name)입니다”
			}
		}

		/*
		//타입 메서드
		static func selfIntroduce() {
			print(“학생타입입니다”)
		}
		*/
		
		//읽기 전용 타입 연산 프로퍼티
		//읽기 전용에서는 get을 생략할 수 있음
		static var selfIntroduction: String {
			return “학생타입입니다”
		}
	}
</pre>

#### 사용
<pre>
	// 타입 연산 프로퍼티 사용
	print(Student.selfIntroduction)
	
	// 인스턴스 생성
	var youngjae: Student = Student()
	youngjae.koreanAge = 26
	
	// 인스턴스 저장 프로퍼티 사용
	youngjae.name = “youngjae”
	print(youngjae.name)

	// 인스턴스 연산 프로퍼티 사용
	print(youngjae.selfIntroduction)
	print(“제 한국나이는 \(youngjae.koreanAge)살 이고, 미국나이는 \(youngjae.westernAge)살 입니다.”)
</pre>

#### 응용
<pre>
	struct Money {
		// 저장 프로퍼티
		var currencyRate: Double = 1100
		var dollar: Double = 0

		// 연산 프로퍼티
		var won: Double {
			get {
				return dollar * currencyRate
			}
			// set의 경우 별다른 매개변수가 없으면 newValue로 암시적으로 표현 가능.
			set {
				dollar = newValue / currencyRate
			}
		}
	}

	var moneyInMyPocket = Money()
	moneyInMyPocket.won = 11000
	print(moneyInMyPocket.won)

	moneyInMyPocket.dollar = 10
	print(moneyInMyPocket.won)
</pre>

#### 지역 변수, 전역 변수
* 앞서 살펴본 저장프로퍼티와 연산 프로퍼티 기능은
* 함수, 메서드, 클로저, 타입 등의 외부에 위치한 
* 지역/전역 변수에도 모두 사용 가능
<pre>
	var a: Int = 100
	var b: Int = 200
	//읽기 전용
	var sum: Int {
		return a + b
	}
	print(sum)
</pre>
