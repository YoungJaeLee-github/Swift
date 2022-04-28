## 옵셔널 추출(Optional Unwrapping)
* Optional Binding - 옵셔널 바인딩
* Force Unwrapping - 강제 추출

### Optional Binding(옵셔널 바인딩)
* 옵셔널의 값을 꺼내오는 방법 중 하나
* nil 체크 + 안전한 값 추출
* if-let 방식을 통해 옵셔널 바인딩을 할 수 있음

<pre>
	func printName(_ name: String) {
		print(name)
	}
	var myName: String? = nil
	// printName(myName) // 전달되는 값의 타입이 String이 아니라 Optional 이기 때문에 타입이 다르므로 컴파일 오류 발생

	if let name: String = myName {
		printName(name)
	} else {
		print(“myName == nil”)
	}
	
	// name 상수는 if-let 구문 안에서만 사용 가능함
	// 상수 사용범위를 벗어났기 때문에 컴파일 오류 발생
	printName(name)
</pre>

<pre>
	var myName: String? = “youngjae”
	var yourName: String? = nil
	
	// 여러 개의 값 옵셔널 바인딩 하는 방법
	if let name = myName, let friend = yourName {
		print(“\(name) and \(friend)”)
	}	// yourName이 nil이기 때문에 실행되지 않음

	yourName = “hana”
	if let name = myName, let friend = yourName {
		print(“\(name) and \(friend)”)
	}
</pre>

### Force Unwrapping(옵셔널 강제 추출)
* ! 를 통해 옵셔널을 강제로 추출(암시적 추출 옵셔널)
* 권장하지는 않는 방법

<pre>
	func printName(_ name: String) {
		print(name)
	}
	
 	var myName: String? = “youngjae”
	printName(myName!)
	myName = nil
	//print(myName!) // 강제 추출시 값이 없으므로 런타임 오류 발생

	var yourName: String! = nil
	printName(yourName) //	nil이 전달되기 때문에 런타임 오류 발생
</pre>
