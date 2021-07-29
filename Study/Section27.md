## 오류처리(Error Handling)
### 오류표현
* Swift에서는 Error 프로토콜과 (주로) 열거형을 통해서 오류를 표현함
<pre>
	enum 오류종류이름: Error {
		case 종류1
		case 종류2
		case 종류3
		…
	}
</pre>

### 자판기 동작 오류의 종류를 표현한 VendingMachineError 열거형
<pre>
	enum VendingMachineError: Error {
		case invalidInput
		case insufficientFunds(moneyNeeded: Int) -> 열거형 연관값(Associated Value)
		case outOfStock
	}
</pre>

### 함수에서 발생한 오류 던지기
* 오류 발생의 여지가 있는 메서드는 throws를 사용하여
* 오류를 내포하는 함수임을 표시하며
* 자신을 호출하는 곳에 오류를 던져줌(throw)
<pre>
	class VendingMachine {
		let itemPrice: Int = 100
		var itemCount: Int = 5
		var deposited: Int = 0
		
		func receiveMoney(_ money: Int) throws {
			// 입력한 돈(매개변수)이 0이하면 오류를 던짐
			guard money > 0 else {
				//호출한 곳에 오류를 던짐
				throw VendingMachineError.invalidInput
			}

			// 오류가 없으면 정상처리
			self.deposited += money
			print(“\(money)원 받음”)
		}

		func vend(numberOfItems numberOfItemsToVend: Int) throws -> String {
			// 원하는 아이템의 수량이 잘못 입력되었으면 오류를 던짐
			guard numberOfItemsToVend > 0 else {
				throw VendingMachineError.invalidInput
			}
			
			// 구매하려는 수량보다 미리 넣어둔 돈이 적으면 오류를 던짐
			guard numberOfItemsToVend * itemPrice <= deposited else {
				let moneyNeeded: Int
				moneyNeeded = numberOfItemsToVend * itemPrice - deposited
				throw VendingMachineError.insufficientFunds(moneyNeeded: moneyNeeded)
			}
	
			// 구매하려는 수량보다 요구하는 수량이 많으면 오류를 던짐
			guard itemCount >= numberOfItemsToVend else {
				throw VendingMachineError.outOfStock
			}
			
			// 오류가 없으면 정상 처리
			let totalPrice = numberOfItemsToVend * itemPrice
			self.deposited -= totalPrice
			self.itemCount -= numberOfItemsToVend

			return “\(numberOfItemsToVend)개 제공함”
		}
	}
	
	// 자판기 인스턴스
	let machine: VendingMachine = VendingMachine()
	// 판매 결과를 전달받을 변수
	var result: String?
</pre>

### 오류처리
* 오류 발생의 여지가 있는 throws 함수(메서드)는
* try를 사용하여 호출해야 함
* try, try?, try!

### do-catch(try)
* 오류 발생의 여지가 있는 throws 함수(메서드)는
* do-catch 구문을 활용하여 오류발생에 대비함
<pre>
	do {
		try machine.receiveMoney(0)
	} catch VendingMachineError.invalidInput {
		print(“입력이 잘못되었습니다.”)
	} catch VendingMachineError.insufficientFunds(let moneyNeeded) {
		print(“\(moneyNeeded)원이 부족합니다”)
	} catch VendingMachineError.outOfStock {
		print(“수량이 부족합니다”)
	} 	// 입력이 잘못되었습니다.

	do {
		try machine.receiveMoney(300)
	} catch /*(let error)*/ -> 생략 가능(암시적으로 넘어오며, 상수명을 변경할 수도 있음) {
		switch error {
			case VendingMachineError.invalidInput:
				print(“입력이 잘못되었습니다.”)
			case VendingMachineError.insufficientFunds(let moneyNeeded):
				print(“(moneyNeeded)원이 부족합니다”)
			case VendingMachineError.outOfStock:
				print(“수량이 부족합니다.”)
			default:
				print(“알 수 없는 오류 \(error)”)
		}
	}	// 300원 받음

	//  일일히 handling 해 줄 필요가 없으면 축약해서 사용 가능
	do {
		result = try machine.vend(numberOfItems: 4)
	} catch {
		print(error)
	}	// insufficientFunds(100)

	// error를 신경쓰지 않을 때 사용 가능
	do {
		result = try machine.vend(numberOfItems: 4)
	}
</pre>	

### try?
* Error가 있을 만한 함수(메서드)를 호출 하는 것으로
* do-catch와 같이 일일히 에러를 처리 할 필요 없이 별도의 오류처리 결과를 통보받지 않고
* 오류가 발생했으면 결과값을 nil로 돌려받을 수 있음
* 정상 동작 후에는 옵셔널 타입으로 반환값을 돌려 받음
<pre>
	result = try? machine.vend(numberOfItems: 2)
	result	// Optional(“2개 제공함”)
	
	result = try? Machine.vend(numberOfItems: 2)
	result 	// nil
</pre>

### try!
* 오류가 발생하지 않을 것이라는 강력한 확신을 가질 때 사용하며
* 정상동작 후에 바로 결과값을 옵셔널타입이 아닌 Unwrapping된 상태로 돌려 받음(Force Unwrapping, 옵셔널 강제 추출)
* 오류가 발생하면 런타임 오류가 발생하여 애플리케이션 동작이 중지 되므로 신중하게 사용해야 함
<pre>
	result = try! Machine.vend(numberOfItems: 1)
	result	// 1개 제공함	
	// result = try! machine.vend(numberOfItems: 1)	runtime error 발생
</pre>
