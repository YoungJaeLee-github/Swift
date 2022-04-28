## 구조체(Struct)
* Swift 대부분의 타입이 구조체로 이루어져있을 정도로 중요한 역할을 담당함
* Upper Camel Case 사용

### 구조체 정의 및 프로퍼티 & 메서드
* 프로퍼티: 구조체 내의 인스턴스 변수 or 상수, 타입 프로퍼티: 구조체 자체만 사용할 수 있는 변수 or 상수
* 인스턴스 메서드: 구조체 내의 인스턴스 함수, 타입 메서드: 구조체 자체만 사용할 수 있는 함수
* static 키워드는 구조체 자체가 사용할 수 있는 변수, 상수, 메소드 - 새로 만들어준 인스턴스로는 사용 불가능
* var(변수)로 구조체 인스턴스를 만들어 주더라도 프로퍼티가 let(상수)이면 변경 불가능
* let(상수)로 구조체 인스턴스를 생성했을 때 프로퍼티가 var(변수)이더라도 변경 불가능

<pre>
	struct 이름 {
		// 구현부
	}

	struct Sample {
		var mutableProperty: Int = 100	// 가변 프로퍼티
		let immutableProperty: Int = 100 // 불변 프로퍼티
		
		static var typeProperty: Int = 100 // 타입 프로퍼티

		// 인스턴스 메서드(함수)
		func instanceMethod() {
			print(“instance method”)
		}

		// 타입 메서드
		static func typeMethod() {
			print(“type method”)
		}
	}
</pre>

### 구조체 사용

<pre>
	// 가변 인스턴스
	var mutable: Sample = Sample()
	mutable.mutableProperty = 200
	// mutable.immutableProperty = 200 프로퍼티가 let이기 때문에 불변

	// 불변 인스턴스
	let immutable: Sample = Sample()
	// immutable.mutableProperty = 200 // 인스턴스가 let 이기 때문에 불변
	// immutable.immutableProperty = 200 // 인스턴스가 let 이기 때문에 불변

	// 타입 프로퍼티 및 메서드
	// 구조체(타입) 자체만 사용 가능
	Sample.typeProperty = 300
	Sample.typeMethod()

	//mutable.typeProperty = 400 // 불가능
</pre>

<pre>
	struct Student {
		var name: String = “unknown”
		var `class`: String = “Swift”

		static func selfIntroduce() {
			print(“Student 타입 입니다.”)
		}
		
		func selfIntroduce() {
			print(“저는 \(self.class)반 \(name)입니다.”)
		}
	}

	Student.selfIntroduce()

	var youngjae: Student = Student()
	youngjae.name = “youngjae”
	youngjae.class = “스위프트”
	youngjae.selfIntroduce()

	// 불변 인스턴스 이므로 프로퍼티 값 변경 불가
	let jina: Student = Student()
	// jina.name = “jina” 컴파일 오류 발생
	jina.selfIntroduce()
</pre>
