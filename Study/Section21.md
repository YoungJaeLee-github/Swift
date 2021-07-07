## 인스턴스의 생성과 소멸(init deinit)
* 이니셜라이저와 디이니셜라이저(init, deinit)
* Swift의 모든 인스턴스는 초기화와 동시에
* 모든 프로퍼티에 유효한 값(초기 값)이 할당되어 있어야 함
* 프로퍼티에 미리 기본값을 할당해두면
* 인스턴스가 생성됨과 동시에 초기값을 지니게 됨
<pre>
	class PersonA {
		// 모든 저장 프로퍼티(stored property)에 기본값 할당
		// 초기 기본 값이 없으면 컴파일 에러 발생
		var name: String = “unknown”
		var age: Int = 0
		var nickName: String = “nick”
	}
	
	let Jason: PersonA = PersonA()
	// print(jason.name)
	jason.name = “jason”
	// print(jason.name)
	// print(jason.age)
	jason.age = 30
	// print(jason.age)
	// print(jason.nickName)
	jason.nickName = “j”
	// print(jason.nickName)
</pre>

### 이니셜라이저(init)
* 프로퍼티 기본값을 지정하기 어려운 경우에
* 이니셜라이저를 통해
* 인스턴스가 가져야 할 초기값을 전달할 수 있음
<pre>
	class PersonB {
		var name: String
		var age: Int
		var nickName: String

		// 이니셜라이저(init)
		init(name: String, age: Int, nickName: String) {
			self.name = name
			self.age = age
			self.nickName = nickName
		}
	}

	let hana: PersonB = PersonB(name: “hana”, age: 20, nickName: “하나”)
</pre>

### 프로퍼티의 초기값이 꼭 필요 없을 때
* 저장 프로퍼티에 대한 초기값이 꼭 필요 없을 때
* 옵셔널을 사용함으로써 초기값 할당, 이니셜라이저를 통해 값을 할당해주지 않아도 됨
<pre>
	class PersonC {
		var name: String
		var age: Int
		// 꼭 필요한 프로퍼티가 아닐 때 옵셔널 사용
		var nickName: String?
		
		// 이니셜라이저가 많아졌을 때 중복을 방지 하기 위해
		// 자기 자신의 이니셜라이저를 사용할 때는
		// 이니셜라이저 앞에 convenience 키워드를 사용
		convenience init(name: String, age: Int, nickName: String) {
			// self.name = name
			// self.age = age
			self.init(name: name, age: age)
			self.nickName = nickName
		}

		init(name: String, age: Int) {
			self.name = name
			self.age = age
		}
	}
	
	let jenny: PersonC = PersonC(name: “jenny”, age: 10) // nickName 값은 nil
	// print(jenny.nickName)
	let mike: PersonC = PersonC(name: “mike”, age: 15, nickName: “m”)
</pre>

### 저장 프로퍼티가 암시적 추출 옵셔널인 경우
* 암시적 추출 옵셔널은
* 인스턴스 사용에 꼭 필요하지만
* 초기값을 할당하지 않고자 할 때 사용
<pre>
	class Puppy {
		var name: String
		var owner: PersonC!

		init(name: String) {
			self.name = name
		}
		
		func goOut() {
			print(“\(name)가 주인 \(owner.name)와 산책을 합니다.”)
		}
	}

	let happy: Puppy = Puppy(name: “happy”)
	// happy.goOut() -> PersonC 타입에 해당하는 owner가 없기 때문에, owner.name을 가져올 수 없어 런타임 에러 발생(nil.name을 호출하는거나 마찬가지 즉, 불가능)
	happy.owner = jenny
	happy,goOut() // jenny.name
</pre>

### 실패 가능한 이니셜라이저
* 이니셜라이저 매개변수로 전달되는 초기값이 잘못 전달되는 경우
* 인스턴스 생성에 실패할 수 있음
* 인스턴스 생성에 실패하면 nil을 반환함
* 따라서 실패 가능한 이니셜라이저의 반환타입은 옵셔널 타입임
<pre>
	class PersonD {
		var name: String
		var age: Int
		var nickName: String?
		
		init?(name: String, age: Int) {
			if (0…120).contains(age) == false {
				return nil
			}

			if name.count == 0 {
				return nil
			}

			self.name = name
			self.age = age
		}
	}
	// let john: PersonD = PersonD(nae: “john”, age: 23) -> 이니셜라이저의 반환 타입이 옵셔널이기 때문에 옵셔널 타입으로 선언해주어야 함.
	let john: PersonD? = PersonD(name: “john”, age: 23)
	let joker: PersonD? = PersonD(name: “joker”, age: 123)
	let batman: PersonD? = PersonD(name: “”, age: 10)

	print(joker)
	print(batman)
</pre>

### 디이니셜라이저(deinit)
* deinit은 클래스의 인스턴스가 메모리에서 해제되는 시점에 호출됨
* 클래스의 인스턴스가 메모리에서 해제되는 시점에 해야할 일을 구현할 수 있음
* 디이니셜라이저 deinit은 class 타입에서만 선언할 수 있음
<pre>
	class PersonE {
 		var name: String
		var pet: Puppy?
		var child: PersonC
		
		init(name: String, child: PersonC) {
			self.name = name
			self.child = child
		}

		// 클래스의 인스턴스가 메모리에서 해제되는 시점에 해야할 동작을 구현할 수 있으며
		// class 타입에서만 사용 가능함
		// 매개변수가 없음
		deinit {
			if let petName = pet?.name {
				print(“\(name)가 \(child.name)에게 \(petName)를 인도합니다.”)
				self.pet?.owner = child
			} 
		}
	}
	
	var donald: PersonE? = PersonE(name: “donald”, child” jenny)
	donald?.pet = happy
	donald = nil // donald 인스턴스가 더 이상 필요 없으므로 메모리에서 해제됨
			      // 이 때 정의해 놓은 디이니셜라이저가 동작함
</pre>
