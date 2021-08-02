## 서브스크립트(Subscript)
* 클래스, 구조체, 열거형에는 컬렉션, 리스트, 시퀀스 등 타입의 요소에 접근하는 단축 문법인 서브스크립트를 정의할 수 있음
* 서브스크립트는 별도의 설정자(Setter), 접근자(Getter)등의 메서드를 구현하지 않아도
* 인덱스를 통해 값을 설정하거나 가져올 수 있음
* 가령, Array 인스턴스의 index, Dictionary의 key를 통해 Array[index], Dictionary[key] 와 같이 인덱스를 통해 해당 값을 가져오는 표현이 서브스크립트
* 클래스와 구조체는 필요한 만큼 얼마든지 서브스크립트를 구현할 수 있음
* 서브스크립트를 여러 개 구현해도 외부에서 서브스크립트를 사용할 때는 서브스크립트를 사용할 때 전달한 값의 타입을 유추하여 적절한 서브스크립트를 선택하여 실행함
* 여러 서브스크립트를 한 타입에 구현하는 것을 서브스크립트 중복 정의(Subscript Overloading) 라고함

### 서브스크립트 매개변수
* 서브스크립트는 통상 하나의 매개변수를 갖는 것이 보통이지만
* 타입에 따라 여러 매개변수를 갖는 경우도 있음
* 매개변수의 타입과 반환타입에는 제한이 없음
* 함수와 마찬가지로 여러 개의 매개변수를 가질 수 있고, 매개변수 기본값을 가질 수 있지만, 입출력 매개변수는 가질 수 없음


### 서브스크립트 문법
<pre>
	subscript(index: Int) -> Int {
		get {
			
		}
		set(newValue) {
			
		}
	}
</pre>
* 설정자(set)에 newValue의 타입은 반환 타입과 같음
* 연산 프로퍼티와 유사한 문법임을 알 수 있음

### 서브스크립트 구현
* 서브스크립트는 자신이 가지는 시퀀스나 컬렉션, 리스트 등의 요소를 반환하고 설정할 때 주로 사용함
* 함수와 마찬가지로 서브스크립트는 여러 개의 매개변수를 가질 수 있고, 매개변수 기본값을 가질 수 있음
* 하지만 입출력 매개변수는 가질 수 없음
<pre>
	struct Student {
		var name: String
		var number: Int
	}

	class School {
		var number: Int = 0
		var students: [Student] = [Student]()
		
		func addStudent(name: String) {
			let student: Student = Student(name: name, number: self.number)
			self.students.append(student)
			self.number += 1
		}

		func addStudents(names: String…) {
			for name in names {
				self.addStudent(name: name)
			}
		}

		subscript(index: Int = 0) -> Student? {
			if index < self.number {
				return self.students[index]
			}
			return nil
		}
	}
	
	let highSchool: School = School()
	highSchool.addStudents(names: “MiJeong”, “JuHyun”, “JiYoung”, “SeongUk”, “MoonDuk”)
	
	let aStudent: Student? = highSchool[1]
	print(“\(aStudent?.number) \(aStudent?.name)”)	
	// 매개변수 기본값 사용
	print(hightSchool[]?.name)
</pre>

### 복수 서브스크립트
* 하나의 타입이 여러개의 서브스크립트를 가질 수 있음
* 다양한 매개변수 타입을 사용하여 서브스크립트를 구현하면 여러 용도로 서브스크립트를 사용할 수 있다는 뜻

### 타입 서브스크립트
* 타입 서브스크립트는 클래스, 구조체 등 타입에서 타입 프로퍼티, 타입 메서드와 같이
* 타입을 할당 받은 인스턴스가 아닌 타입 자체가 사용할 수 있는 서브스크립트를 말함
* 타입 프로퍼티, 타입 메서드와 마찬가지로 subscript앞에 static 키워드를 붙여주면 됨.
* class의 경우 class 키워드를 사용할 수도 있음
* 이 경우 static은 상속이 불가능한 것은 마찬가지
<pre>
	enum School: Int {
		case elementary = 1, middle, high, university
		static subscript(level: Int) -> School? {
			return Self(rawValue: level)
			// return School(rawValue: level)과 같은 표현
		}
	}

	// rawValue에 해당하는 case가 없을 수 있으므로
	// optional 타입이어야 함
	let school: School? = School[2]
	print(school)
</pre>
