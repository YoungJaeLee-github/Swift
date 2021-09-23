## ARC(Automatic Reference Counting)
* Stack에 저장되는 데이터는 자동으로 제거되기 때문에 특별한 관리가 필요 없고,
* 힙에 저장되는 데이터는 필요하지 않은 시점에 제거해주어야 함
* ARC는 힙에 저장되는 데이터를 관리함, 다시 말하면 클래스 인스턴스의 메모리를 관리함(참조 타입)
* Swift는 ARC 메모리 관리 모델을 사용함

### Ownership Policy & Reference Count
* 인스턴스는 하나 이상의 소유자가 있는 경우 메모리에 유지됨
* 반대로 소유자가 없다면 메모리에서 제거됨
* 제거 시점을 파악하기 위해 소유자수를 저장하게 되는데 이것을 Reference Count라고 함
* 인스턴스는 참조 카운트가 1이상이면 메모리에 유지되고, 참조 카운트가 0이되면 메모리에서 제거됨
* 클래스 인스턴스를 프로퍼티나 변수에 저장하면 그 프로퍼티나 변수가 소유자가 되고 참조카운트는 1이됨(retain)
* 또 다른 변수가 동일한 인스턴스를 소유하면 참조 카운트는 2가 됨(retain)
* 인스턴스가 더이상 필요하지 않다면 소유권을 포기해야 함(release)
* 소유권을 포기하게 되면 참조 카운트는 1 감소하고, 참조 카운트가 0이 되면 메모리에서 해제됨
* MRC 메모리 관리 모델은 소유 정책과 관련된 코드를 다 구현해야 하므로 매우 까다로움
* MRC 메모리 관리 모델의 문제를 해결하기 위해서 ARC가 도입되었음
* Compiler가 메모리 관리 코드를 자동으로 추가해주기 때문에 관련 코드를 작성할 필요가 없음
* 작성해야 할 코드의 양이 감소되고 안정적인 프로그램을 작성할 수 있음
* Objective-C에서는 MRC/ARC 모두 사용하나 특별한 경우가 아니라면 ARC를 사용함

### 강한참조(Strong Reference)
* 기본적으로 클래스 타입의 인스턴스와 소유자는 강한참조로 연결됨
* 클래스 타입의 인스턴스를 소유권을 가질 때마다 참조 카운트가 1 증가, 소유권을 포기할 때마다 1 감소하며 인스턴스는 소유자가 존재하는 동안에는 메모리에서 제거되지 않음
<pre>
	class Person {
		var name: String = “John Doe”
		
		deinit {
			print(“person deinit”)
		}
	}
	
	var person1: Person?
	var person2: Person?
	var person3: Person?
	
	person1 = Person()	//Person 인스턴스의 참조 카운트 : 1
	person2 = person1	//Person 인스턴스의 참조 카운트 : 2
	person3 = person1	//Person 인스턴스의 참조 카운트 : 3
	
	person1 = nil	//Person 인스턴스의 참조 카운트 : 2
	person2 = nil	//Person 인스턴스의 참조 카운트 : 1
	person3 = nil	//Person 인스턴스의 참조 카운트 : 0
	//person deinit
</pre>
* 소멸자(deinit)은 인스턴스가 메모리에서 해제될 때 자동으로 실행됨

### 강한참조 지역변수(상수)의 참조 횟수 확인
<pre>
	func foo() {
		let person: Person = Person() //Person 인스턴스의 참조 카운트 : 1
		
		//함수 종료 시점
		//Person 인스턴스의 참조 카운트 : 0
		//person deinit
	}
	foo()
</pre>

### 강한참조 지역변수(상수)의 참조 횟수 확인과 전역변수
<pre>
	var globalReference: Person?
	func foo() {
		let youngjae: Person = Person() //Person 인스턴스의 참조 카운트 : 1
		globalReference = youngjae	//Person 인스턴스의 참조 카운트 : 2
		
		//함수 종료 시점
		//Person 인스턴스의 참조 카운트 : 1
	}
</pre>

### 강한참조 순환 문제(Strong Reference Cycle)
<pre>
	class Person {
		var name = “John Doe”
		var car: Car?
		
		deinit { print(“person deinit”) }
	}
	
	class Car {
		var model: String
		var lessee: Person?
		
		init(model: String) {
			self.model = model
		}
		
		deinit {
			print(“car deinit”)
		}
	}
	
	var person: Person? = Person()	//Person 인스턴스의 참조 카운트 : 1
	var rentedCar: Car? = Car(model: “Porche”)	//Car 인스턴스의 참조 카운트 : 1
	
	person?.car = rentedCar	//Car 인스턴스의 참조 카운트 : 2
	rentedCar?.lessee = person	//Person 인스턴스의 참조 카운트 : 2

	person = nil	//Person 인스턴스의 참조 카운트 : 1
	rentedCar = nil //Car 인스턴스의 참조 카운트 : 1
</pre>
* 인스턴스 끼리 서로가 서로를 강한참조할 때 강한참조 순환 문제가 일어날 수 있음

### 약한참조(Weak Reference)
* 강한참조 순환 문제는 약한참조와 미소유참조를 통해 해결할 수 있음
* 강한참조와 달리 약한 참조는 참조 카운트를 증가시키지 않음
* 약한참조를 통해 인스턴스에 접근할 수 있지만 인스턴스가 사라지지 않도록 유지하는 것은 불가능 함
* 약한참조는 인스턴스를 참조하지만 인스턴스를 소유하지 않고 참조 카운트도 증가하지 않음
* 그래서 인스턴스를 참조하고 있는 동안 대상 인스턴스는 언제든지 사라질 수 있음
* 참조하는 인스턴스가 사라질 경우 자동으로 nil로 초기화됨
* 소유자에 비해 짧은 생명주기를 가진 인스턴스를 참조할 때 주로 사용함
* 그렇기 때문에 항상 var(변수)키워드와 옵셔널 타입이어야 함
* weak 키워드를 통해 정의할 수 있음
<pre>
	class Person {
		var name = “John Doe”
		var car: Car?
		
		deinit { print(“person deinit”) }
	}
	
	class Car {
		var model: String
		weak var lessee: Person?
		
		init(model: String) {
			self.model = model
		}
		
		deinit {
			print(“car deinit”)
		}
	}

	var person: Person? = Person()	//Person 인스턴스의 참조 카운트 : 1
	var rentedCar: Car? = Car(model: “Porche”)	//Car 인스턴스의 참조 카운트 : 1
	
	person?.car = rentedCar	//Car 인스턴스의 참조 카운트 : 2
	rentedCar?.lessee = person	//Person 인스턴스의 참조 카운트 : 1
	
	person = nil //Person 인스턴스의 참조 카운트 : 0, Car 인스턴스의 참조 카운트 : 1
	// person이 메모리에서 해제됨에 따라 Car의 참조 카운트도 1 감소하게 됨
	//이때, 약한참조인 lessee는 person 인스턴스가 메모리에서 해제 되었기 때문에 nil로 초기화됨
	//person deinit

	print(rentedCar?.lessee)	//nil
	
	rentedCar = nil	//Car 인스턴스의 참조 카운트 : 0
	//car deinit
	//강한참조 순환 문제 해결!
</pre>


### 미(비)소유참조(Unowned Reference)
* 미소유참조는 약한참조와 동일한 방식으로 강한참조 순환 문제를 해결함
* 하지만 옵셔널 형식이 아닌 non-Optional 형식임
* 강한참조 순환 문제를 해결하면서 속성을 non-Optional로 선언해야할 때 주로 사용
* 인스턴스의 생명주기가 소유자와 같거나 더 긴 경우에 사용함
* Unowned 키워드를 사용해 정의
* 	non-Optional 이기 때문에 참조하고 있는 인스턴스가 메모리에서 해제되어도 nil로 초기화 되지 않음
* 그래서 해제된 인스턴스에 접근할 경우 런타임 에러가 발생할 수 있기 때문에 주의해서 사용해야 함
<pre>
	class Person {
		var name = “John Doe”
		var car: Car?
		
		deinit { print(“person deinit”) }
	}
	
	class Car {
		var model: String
		unowned var lessee: Person
		
		init(model: String, lessee: Person) {
			self.model = model
			self.lessee = lessee
		}
		
		deinit {
			print(“car deinit”)
		}
	}

	var person: Person? = Person()	//Person 인스턴스의 참조 카운트 : 1
	var rentedCar: Car? = Car(model: “Porche”, lessee: person!)	//Car 인스턴스의 참조 카운트 : 1
	
	person?.car = rentedCar //Car 인스턴스의 참조 카운트 : 2, Person 인스턴스의 참조 카운트 : 1
	person = nil		//Person 인스턴스의 참조 카운트 : 0, Car 인스턴스의 참조 카운트 : 1
	//person deinit

	// print(rentedCar?.lessee) runtime error 발생

	rentedCar = nil //Car 인스턴스의 참조 카운트 : 0
	//car deinit
</pre>

### Closure Capture List
* 클로저에서도 강한참조 순환 문제가 발생할 수 있음
* 클로저가 인스턴스를 캡쳐하고 인스턴스가 클로저를 강한참조로 저장하고 있다면
* 인스턴스가 정상적으로 메모리에서 해제되지 않음
* 이 경우에도 약한참조와, 미소유참조를 통해 강한참조 순환 문제를 해결할 수 있음
* 클로저도 클래스와 같은 참조타입
<pre>
	class Car {
		var totalDrivingDistance = 0.0
		var totalUsedGas = 0.0
		
		lazy var gasMileage: () -> Double = {
			return self.totalDrivingDistance / self.totalUsedGas
		}
		//self는 인스턴스 자체를 나타내는 표현임
		//self를 클로저에서 사용하면 self가 나타내는 인스턴스가 캡쳐되며
		//클로저는 실행이 종료될때까지 self를 강한참조로 캡쳐함
		//self가 나타내는 인스턴스는 클로저의 실행이 완료될 때 까지 메모리에서 해제되지 않음
		//인스턴스를 캡쳐하는 클로저가 인스턴스 속성에 저장되어 있음
		//따라서 Car 인스턴스인 self가 클로저를 강한참조하고 있고, closure는 self를 강한참조하고 있으므로 강한참조 순환 문제가 발생함
		
		func drive() {
			self.totalDrivingDistance = 1200.0
			self.totalUsedGas = 73.0
		}
		
		deinit { print(“car deinit”) }
	}
	
	var myCar: Car? = Car() //Car 인스턴스의 참조 카운트 : 1
	myCar?.drive()

	// myCar = nil	//Car 인스턴스의 참조 카운트 : 0
	//car deinit
	
	myCar?.gasMileage()	//Car 인스턴스의 참조 카운트 : 2
	myCar = nil	//Car 인스턴스의 참조 카운트 : 1
	//강한참조 순환 문제 발생
</pre>

### Closure Capture List 문법
<pre>
	{ [list, …] (parameters, …) -> ReturnType in
		code
	}
	
	// 클로저 고급 문법을 통해 반환타입, 매개변수를 생략할 수 있지만
	// 캡쳐리스트와 코드 부분을 구별하기 위해서 in 키워드는 생략할 수 없음
	
	{ [list,…] in
		code
	}
</pre>

### Value Type에서의 Closure Capture List
<pre>
	{ [valueName,…] in
		code
	}
</pre>
* 값 형식을 캡쳐할 때는 대상의 이름만 표기함
* 클로저가 값을 캡쳐할 때는 복사본이 아닌 참조가 전달 됨
* 값 형식을 클로저 캡쳐 리스트에 추가하게 되면 참조 대신 복사본을 저장하게 됨
<pre>
	var a = 0
	var b = 0
	let closure = { [a] in
		print(a, b)
		b = 20
	}
	a = 10
	b = 10
	closure()	// 0 10
	print(b) // 20
</pre>

### Reference Type에서의 Closure Capture List
<pre>
	{ [weak instanceName, unowned instanceName] in
		code
	}
</pre>
* 참조 타입을 캡쳐할 때는 대상 앞의 weak 혹은 unowned 키워드를 선언해야 함
* weak는 약한참조로 캡쳐, unowned는 미소유참조로 캡쳐함
* weak의 경우 옵셔널 타입이기 때문에 메모리에서 해제 될때 nil을 반환하므로 클로저 내부에서 옵셔널 바인딩 혹은 옵셔널 체이닝을 통해 값을 unwrapping 해주어야 함
* unowned의 경우는 non-Optional이기 때문에 별도의 옵셔널 값을 unwrapping 해주지 않아도 되지만, 인스턴스가 메모리에서 해제된 후에 접근하는 경우 run time error를 발생시킬 수 있으므로 주의해서 사용해야 함
* 클로저의 실행이 완료되기 전에 캡쳐한 인스턴스가 메모리에서 해제될 가능성이 있는 경우 약한참조를 사용함
* 미소유참조는 캡쳐 대상인 인스턴스의 생명주기가 클로저와 같거나 더 긴경우에 사용함(런타임 에러가 발생할 수 있기 때문)
<pre>
	class Car {
		var totalDrivingDistance = 0.0
		var totalUsedGas = 0.0
		
		lazy var gasMileage: () -> Double = { [weak self] in
			guard let strongSelf = self else { return 0.0 }
			return strongSelf.totalDrivingDistance / strongSelf.totalUsedGas
		}
		//self는 인스턴스 자체를 나타내는 표현임
		//self를 클로저에서 사용하면 self가 나타내는 인스턴스가 캡쳐되며
		//클로저는 실행이 종료될때까지 self를 강한참조로 캡쳐함
		//self가 나타내는 인스턴스는 클로저의 실행이 완료될 때 까지 메모리에서 해제되지 않음
		//인스턴스를 캡쳐하는 클로저가 인스턴스 속성에 저장되어 있음
		//클로저를 참조하는 인스턴스는 weak 혹은 unowned로 선언되어 있지 않기 때문에 강한 참조 순환 문제가 발생함
		
		func drive() {
			self.totalDrivingDistance = 1200.0
			self.totalUsedGas = 73.0
		}
		
		deinit { print(“car deinit”) }
	}
	
	var myCar: Car? = Car()	//Car 인스턴스의 참조 카운트 : 1
	myCar?.drive()
	
	myCar?.gasMileage()	//Car 인스턴스의 참조 카운트 : 1
	
	myCar = nil	//Car 인스턴스의 참조 카운트 : 0
	//car deinit
</pre>

<pre>
	class Car {
		var totalDrivingDistance = 0.0
		var totalUsedGas = 0.0
		
		lazy var gasMileage: () -> Double = { [unowned self] in
			return self.totalDrivingDistance / self.totalUsedGas
		}
		//self는 인스턴스 자체를 나타내는 표현임
		//self를 클로저에서 사용하면 self가 나타내는 인스턴스가 캡쳐되며
		//클로저는 실행이 종료될때까지 self를 강한참조로 캡쳐함
		//self가 나타내는 인스턴스는 클로저의 실행이 완료될 때 까지 메모리에서 해제되지 않음
		//인스턴스를 캡쳐하는 클로저가 인스턴스 속성에 저장되어 있음
		//클로저를 참조하는 인스턴스는 weak 혹은 unowned로 선언되어 있지 않기 때문에 강한 참조 순환 문제가 발생함
		
		func drive() {
			self.totalDrivingDistance = 1200.0
			self.totalUsedGas = 73.0
		}
		
		deinit { print(“car deinit”) }
	}
	
	var myCar: Car? = Car()	//Car 인스턴스의 참조 카운트 : 1
	myCar?.drive()
	
	myCar?.gasMileage()	//Car 인스턴스의 참조 카운트 : 1
	
	myCar = nil	//Car 인스턴스의 참조 카운트 : 0
	//car deinit
</pre>
