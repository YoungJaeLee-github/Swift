## 상속(inheritance)
* Swift의 상속은 클래스, 프로토콜 등에서 가능함
* 열거형(enum), 구조체(struct)에서는 상속이 불가능함
* swift는 다중 상속을 지원하지 않음

### 상속 문법
<pre>
	class 이름: 상속 받을 클래스 이름 {
	
	}
</pre>

<pre>
	class Person {
		var name: String = “”

		func selfIntroduce() {
			print(“저는 \(name) 입니다.”)
		}

		// final 키워드를 사용하여 재정의를 방지할 수 있음
		final func sayHello() {
			print(“hello”)
		}
		
		// 타입 메서드
		// 재정의 불가 타입 메서드 - static
		static func typeMethod() {
			print(“type method - static”)
		}

		// 재정의 가능 타입 메서드 - class
		class func classMethod() {
			print(“type method - class”)
		}

		// 재정의 가능한 class 메서드라도,
		// final 키워드를 사용하면 재정의 불가능
		// 메서드 앞의 `static`과 `final class`는 같은 역할
		final class func finalClassMethod() {
			print(“type method - final class”)
		}
	}
</pre>

### 사용
<pre>
	class Student: Person {
		var major: String = “”

		override func selfIntroduce() {
			print(“저는 \(name)이고, 전공은 \(major)입니다.”)

			// 부모 클래스의 메서드를 사용할 때는 super 키워드 사용.
			// super.selfIntroduce()
		}
		
		override class func classMethod() {
			print(“overridden type method - class")
		}

		/*
			static 키워드를 사용한 타입 메서드는 재정의 불가능
			override static func typeMethod() { }
			
			final 키워드를 사용한 메서드, 프로퍼티는 재정의 불가능
			override func sayHello() { }
			override class func finalClassMethod() { }
		*/
	}
</pre>

### 동작 확인
<pre>
	let youngjae: Person = Person()
	let Hana: Student = Student()
	hana.major = “Computer Engineering”
	
	youngjae.name = “youngjae”
	hana.name = “hana”	// 부모 클래스의 프로퍼티를 사용할 수 있음
	
	youngjae.selfIntroduce()
	hana.selfIntroduce()

	Person.classMethod()
	Person.typeMethod()
	Person.finalClassMethod()
	
	Student.classMethod()

	// 부모 클래스의 재정의가 불가능한 타입 메서드 사용
	Student.typeMethod()	
	Student.finalClassMethod()
</pre>
