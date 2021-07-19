## 타입 캐스팅(Type Casting)
* 스위프트의 타입 캐스팅은 인스턴스의 타입을 확인하는 용도
* 또는 클래스의 인스턴스를,
* 부모(조상) 혹은 자식 클래스의 타입으로 사용할 수 있는지
* 확인하는 용도로 사용

### 다른 언어에서의 타입 캐스팅
<pre>
	let someInt: Int = 100
	let someDouble: Double = Double(someInt)
</pre>
* Swift에서 타입 캐스팅은 위와 같은 타입 캐스팅이 아님
* 위와 같은 경우는 Double 타입의 인스턴스를 하나 더 생성해주는 것

### Swift에서의 타입 캐스팅
* 주로 Class 타입에서 많이 사용 함.
* Dictionary, Any, AnyObject를 사용하게 된다면 타입 캐스팅을 많이 사용하게 됨.

<pre>
	 class Person {
		var name: String = “”
		func breath() {
			print(“숨을 쉽니다”)
		}
	}

	class Student: Person {
		var school: String = “”
		func goToSchool() {
			print(“등교를 합니다”)
		}
	}

	class UniversityStudent: Student {
		var major: String = “”
		func goToMT() {
			print(“멤버쉽 트레이닝을 갑니다 신남!”)
		}
	}

	var youngjae: Person = Person()
	var hana: Student = Student()
	var jason: UniversityStudent = UniversityStudent()
</pre>

### 인스턴스 타입확인 - is(Bool)
<pre>
	var result: Bool

	result = youngjae is Person	// true
	result = youngjae is Student	// false
	result = youngjae is UniversityStudent	// false

	result = hana is Person	// true
	result = hana is Student	// true
	result = hana is UniversityStudent	// false

	result = jason is Person	// true
	result = jason is Student	// true
	result = jason is UniversityStudent	// true

	if youngjae is UniversityStudent {
		print(“youngjae는 대학생입니다”)
	} else if youngjae is Student {
		print(“youngjae는 학생입니다”)
	} else if youngjae is Person {
		print(“younjae는 사람입니다”)
	}
	// younjae는 사람입니다

	switch jason {
		case is Person:
			print(“jason은 사람입니다”)
		case is Student:
			print(“jason은 학생입니다”)
		case is UniversityStudent:
			print(“jason은 대학생입니다”)
		default:
			print(“jason은 사람도, 학생도, 대학생도 아닙니다”)
	}
	// jason은 사람입니다

	switch jason {
		case is UniversityStudent:
			print(“jason은 대학생입니다”)
		case is Person:
			print(“jason은 사람입니다”)
		case is Student:
			print(“jason은 학생입니다”)
		default:
			print(“jason은 사람도, 학생도, 대학생도 아닙니다”)
	}
	// jason은 대학생입니다
</pre>

### 업 캐스팅
* as를 사용하여 부모클래스의 인스턴스로 사용할 수 있도록
* 컴파일러에게 타입정보를 전환해줌
* Any 혹은 AnyObject로도 타입정보를 변환할 수 있음
* 이 경우 암시적으로 처리되므로 생략해도 무방함

<pre>
	var mike: Person = UniversityStudent() as Person
	var jenny: Student = Student()
	// var jina: UniversityStudent = Person() as UniversityStudent // 컴파일 오류
	var jina: Any = Person() // as Any 생략 가능
</pre>

### 다운 캐스팅
* as? 또는 as!를 사용해
* 자식 클래스의 인스턴스로 사용할 수 있도록
* 컴파일러에게 인스턴스의 타입 정보를 전환해줌

### 조건부 다운 캐스팅(as?)
<pre>
	var optionalCasted: Student?
	
	optionalCasted = mike as? UniversityStudent 
	optionalCasted = jenny as? UniversityStudent	// nil
	optionalCasted = jina as? UniversityStudent	// nil
	optionalCasted = jina as? Student	// nil
</pre>

### 강제 다운 캐스팅(as!)
* 런타임 에러가 발생할 위험이 있지만
* 반환타입이 옵셔널이 아니기 때문에
* 보다 편하게 활용할 수 있음
<pre>
	var forceCasted: Student

	forceCasted = mike as! UniversityStudent 
	// forceCasted = jenny as? UniversityStudent	// 런타임 오류
	// forceCasted = jina as? UniversityStudent	// 런타임 오류
	// forceCasted = jina as? Student	// 런타임 오류

	// 활용
	// switch 구문을 사용하게 되면 is로 확인 후 타입 캐스팅을 해주어야 함
	func doSomethingWithSwitch(someone: Person) {
		switch someone {
			case is UniversityStudent:
				(someone as! UniversityStudent).goToMT()
			case is Student:
				(someone as! Student).goToSchool()
			case is Person:
				(someone as! Person).breath()
		}
	}

	doSomethingWithSwitch(someone: mike as Person)
	// 멤버쉽 트레이닝을 갑니다 신남!

	doSomethingWithSwitch(someone: mike)
	// 멤버쉽 트레이닝을 갑니다 신남!

	doSomethingWithSwitch(someone: jenny)
	// 등교를 합니다

	doSomethingWithSwitch(someone: youngjae)
	// 숨을 쉽니다

	// if-let 구문을 사용하게 되면 타입 캐스팅과 동시에 사용할 수 있음
	func doSomething(someone: Person) {
		if let universityStudent = someone as? UniversityStudent {
			universityStudent.goToMT()
		} else if let student = someone as? Student {
			student.goToSchool()
		} else if let person = someone as? Person {
			person.breath()
		}
	}

	doSomething(someone: mike as Person)
	// 멤버쉽 트레이닝을 갑니다 신남!

	doSomething(someone: mike)
	// 멤버쉽 트레이닝을 갑니다 신남!

	doSomething(someone: jenny)
	// 등교를 합니다

	doSomething(someone: youngjae)
	// 숨을 쉽니다
</pre>
