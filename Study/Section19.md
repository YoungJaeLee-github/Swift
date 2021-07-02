## 프로퍼티 감시자(Property Observer)
* 프로퍼티 감시자를 사용하면 프로퍼티 값이 변경될 때 원하는 동작을 수행할 수 있음.
<pre>
	struct Money {
		// 프로퍼티 감시자 사용
		var currencyRate: Double = 1100 {
			willSet(newRate) {
				print(“환율이 \(currencyRate)에서 \(newRate)으로 변경될 예정입니다.”)
			}
			didSet(oldRate) {
				print(“환율이 \(oldRate)에서 \(currencyRate)으로 변경되었습니다.”)
			}
		}

		var dollar: Double = 0 {
			// willSet의 암시적 매개변수 이름 newValue
			willSet {
				print(“\(dollar)달러에서 \(newValue)달러로 변경될 예정입니다.”)
			}
			// didSet의 암시적 매개변수 이름 oldValue
			didSet {
				print(“\(oldValue)달러 에서 \(dollar)달러로 변경되었습니다.”)
			}
		}
	}
</pre>

### 연산 프로퍼티(Computed Property)
<pre>
	var won: Double {
		get {
			return dollar * currencyRate
		}
		set {
			dollar = newValue / currencyRate
		}
	}

	/*
		프로퍼티 감시자와 연산 프로퍼티 기능을 동시에 사용할 수 없음.
		willSet {
		}
		didSet {
		}
	*/
</pre>

### 사용
<pre>

	struct Money {
		// 프로퍼티 감시자 사용
		var currencyRate: Double = 1100 {
			willSet(newRate) {
				print(“환율이 \(currencyRate)에서 \(newRate)으로 변경될 예정입니다.”)
			}
			didSet(oldRate) {
				print(“환율이 \(oldRate)에서 \(currencyRate)으로 변경되었습니다.”)
			}
		}

		var dollar: Double = 0 {
			// willSet의 암시적 매개변수 이름 newValue
			willSet {
				print(“\(dollar)달러에서 \(newValue)달러로 변경될 예정입니다.”)
			}
			// didSet의 암시적 매개변수 이름 oldValue
			didSet {
				print(“\(oldValue)달러 에서 \(dollar)달러로 변경되었습니다.”)
			}
		}

		var won: Double {
			get {
				return dollar * currencyRate
			}
			set {
				dollar = newValue / currencyRate
			}
		}
	}

	var moneyInMyPocket: Money = Money()
	moneyInMyPocket.currencyRate = 1150
	moneyInMyPocket.dollar = 10
	print(moneyInMyPocket.won)
</pre>

### 지역/전역 변수
* 프로퍼티 감시자 기능은
* 기존 프로퍼티와 마찬가지로 함수, 메서드, 클로저, 타입 등의 외부에 위치한
* 지역/전역 변수에 모두 사용 가능함
<pre>
	var someValue: Int = 100 {
		willSet {
			print(“\(someValue)에서 \(newValue)로 변경될 예정입니다.”)
		}
		didSet {
			print(“\(oldValue)에서 \(someValue)로 변경되었습니다.”)
		}
	}
		someValue = 200
</pre>
