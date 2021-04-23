## 클래스
* 값 타입인 구조체와 달리 클래스는 참조 타입
* 값이 전달 될 때 값 타입은 복사 되서 전달 되고 참조 타입은 같은 주소를 가리키게 되므로 참조 타입의 값 변경 시 원래 데이터에 영향을 주게 됨.
* Swift의 클래스는 다중 상속이 되지 않음.
* 구조체와 동일하게 타입 이므로 Upper Camel Case

### 정의

<pre>
	class 클래스명 {
		/* 구현부 */
	}
</pre>

### 프로퍼티 및 메서드

<pre>
	class Sample {
		var mutableProperty: Int = 100		// 가변 프로퍼티
		let immutableProperty: Int = 100	// 불변 프로퍼티

		// 인스턴스 메서드
		func instanceMethod() {
			print(“instance method”)
		}

		//	타입 프로퍼티
		static var typeProperty: Int = 100 

		// 상속을 받았을 때 재정의가 불가능한 타입 메서드(static 키워드)
		static func typeMethod() {
			print(“type method - static”)
		}

		// 상속을 받았을 때 재정의가 가능한 타입 메서드(class 키워드)
		class func classMethod() {
			print(“type method - class”)
		}
	}
</pre>

### 클래스 사용
* 구조체는 선언한 인스턴스가 상수 혹은 변수냐에 따라 프로퍼티의 값의 가변 불변이 결정되고(인스턴스가 불변이면 프로퍼티가 가변이어도 변경 불가능) 클래스는 클래스의 프로퍼티가 상수 혹은 변수냐에 따라 값의 가변 불변이 결정됨(인스턴스가 불변(let)이어도 프로퍼티가 가변(var)이면 변경 가능)
<pre>
	var mutableReference: Sample = Sample()

	mutableReference.mutableProperty = 200
	// mutableReference.immutableProperty = 200 불가능

	let immutableReference: Sample = Sample()

	immutableReference.mutableProperty = 200
	// immutableReference.immutableProperty = 200 불가능
	
	// immutableReference = mutableReference

	// 타입 프로퍼티
	Sample.typeProperty = 300
	Sample.typeMethod()

	// mutableReference.typeProperty = 400 불가능
	// mutableReference.typeMethod() // 불가능
</pre>

<pre>
	class Student {
		var name: String = “unknown”
		var `class`: String = “Swift”
		
		// 재정의 가능한 타입 메서드
		class func selfIntroduce() {
			print(“학생 타입입니다.”)
		}

		func selfIntroduce() {
			print(“저는 \(self.class)반 \(name)입니다”)
		}
	}

	Student.selfIntroduce()

	var youngjae: Student = Student()
	youngjae.name = “youngjae”
	youngjae.class = “Objective-C”
	youngjae.selfIntroduce()

	let jina: Student = Student()
	// 인스턴스가 불변이지만 프로퍼티가 가변이므로 변경 가능.(구조체는 불가능) 
	jina.name = “jina”
	jina.class = “Objective-C”
	jina.selfIntroduce()
</pre>
