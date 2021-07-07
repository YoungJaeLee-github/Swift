## 옵셔널 체이닝과 nil 병합 연산자(Optional chaining & nil-coalescing operator)
* 옵셔널 체이닝은 옵셔널 요소 내부의 프로퍼티로
* 또 다시 옵셔널이 연속적으로 연결되는 경우 유용하게 사용할 수 있음
<pre>
	class Person {
		var name: String
		var job: String?
		var home: Apartment?
		
		init(name: String) {
			self.name = name
		}
	}

	class Apartment {
		var buildingNumber: String
		var roomNumber: String
		var `guard`: Person?
		var owner: Person?

		init(dong: String, ho: String) {
			buildingNumber = dong
			roomNumber = ho
		}
	}
	
	let youngjae: Person? = Person(name: “youngjae”)
	let apartment: Apartment? = Apartment(dong: “101”, ho: “202”)
	let superman: Person? = Person(name: “superman”)
</pre>

### 옵셔널 체이닝을 사용하지 않을 경우
<pre>
	func guardJob(owner: Person?) {
		if let owner = owner {
			if let home = owner.home {
				if let `guard` = home.guard {
					if let guardJob = `guard`.job {
						print(“우리집 경비원의 직업은 \(guardJob)입니다.”)
					} else {
						print(“우리집 경비원은 직업이 없습니다.”)
					}
				}
			}
		}	
	}
	guardJob(owner: youngjae)
</pre>

### 옵셔널 체이닝을 사용할 경우
* 옵셔널 체이닝이 실행 후 결과값이 nil일 수 있으므로, 결과 타입도 옵셔널임
<pre>
	func guardJobWithOptionalChaining(owner: Person?) {
		if let guardJob = owner?.home?.guard?.job {	// 하나의 값이라도 nil이 나오게 되면 else 구문으로 바로 이동함.
			print(“우리집 경비원의 직업은 \(guardJob)입니다.”)
		} else {
			print(“우리집 경비원은 직업이 없습니다.”)
		}
	}
	guardJobWithOptionalChaining(owner: youngjae)

	youngjae?.home?.guard?.job	//nil
	
	youngjae?.home = apartment
	
	youngjae?.home	//Optional(Apartment)
	youngjae?.home?.guard	//nil

	youngjae?.home?.guard = superman
	
	youngjae?.home?.guard	//Optional(Person)

	youngjae?.home?.guard?.name	//Optional(superman)
	youngjae?.home?guard?.job	// nil
	
	youngjae?.home?.guard?.job = “경비원”
</pre>

### nil 병합 연산자(nil-coalescing operator, ??)
* 옵셔널 체이닝을 통한 결과 값이 nil일 경우 default 값을 정해줄 때 사용하며 ?? 키워드를 사용함
* 만약 옵셔널 체이닝을 통한 결과 값이 nil이 아니면 해당 값이 할당 되고, nil 이면 ?? 키워드 뒤에 정해준 default값으로 할당 됨
<pre>
	var guardJob: String
	guardJob = youngjae?.home?.guard?.job ?? “슈퍼맨”
	print(guardJob)
	
	youngjae?.home?.guard?.job = nil
	guardJob = youngjae?.home?.guard?.job ?? “슈퍼맨”
	print(guardJob)
</pre>
