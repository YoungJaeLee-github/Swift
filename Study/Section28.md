## 고차함수(Higher Order Function)
* Swift의 문법이라고 할 수는 없지만 유용하게 사용됨
* 전달인자로 함수를 전달받거나
* 함수실행의 결과를 함수로 반환하는 함수

### map
* 컨테이너 내부의 기존 데이터를 변형(transform)하여 새로운 컨테이너 생성
<pre>
	let numbers: [Int] = [0, 1, 2, 3, 4]
	var doubledNumbers: [Int]
	var strings: [String]

	// 기존 for 구문 사용
	doubledNumbrers = [Int]()
	strings = [String]()
	
	for number in numbers {
		doubledNumbers.append(number * 2)
		strings.append(“\(number)”)
	}
	
	print(doubledNumbers)	// [0, 2, 4, 6, 8]
	print(strings)	//[“0”, “1”, “2”, “3”, “4”]

	// map 메서드 사용
	// numbers의 각 요소를 2배하여 새로운 배열로 반환
	doubledNumbers = numbers.map({(number: Int) -> Int in
		return number * 2
	})

	// numbers의 각 요소를 문자열로 변환하여 새로운 배열로 반환
	strings = numbers.map({(number: Int) -> String in
		return “\(number)”
	})

	print(doubledNumbers)	// [0, 2, 4, 6, 8]
	print(strings)	//[“0”, “1”, “2”, “3”, “4”]

	// 클로저 고급 사용 가능
	// 매개변수, 반환 타입, 반환 키워드(return) 생략, 후행 클로저
	doubledNumbers = numbers.map {$0 * 2}
	print(doubledNumbers)	// [0, 2, 4, 6, 8]
</pre>

### filter
* 컨테이너 내부의 값을 걸러서 새로운 컨테이너로 추출
* 반환타입이 Bool이기 때문에 조건에 부합한 값만 걸러서 새로운 컨테이너로 추출함
<pre>
	var filtered: [Int] = [Int]()
	
	// 기존 for 사용
	for number in numbers {
		if number % 2 == 0 {
			filtered.append(number)
		}
	}
	print(filtered)	// [0, 2, 4]

	// filter 메서드 사용
	// numbers의 요소 중 짝수를 걸러내어 새로운 배열로 반환
	// 후행 클로저 사용(마지막 전달인자가 클로저인 경우에 사용)
	let evenNumbers: [Int] = numbers.filter {
		(number: Int) -> Bool in 
		return number % 2 == 0
	}

	print(evenNumbers)	// [0, 2, 4]	

	// 매개변수, 반환 타입, 반환 키워드(return) 생략, 후행 클로저
	let oddNumbers: [Int] = numbers.filter { $0 % 2 != 0 }
	
	print(oddNumbers) // [1, 3]
</pre>

### reduce
* 컨테이너 내부의 콘텐츠를 하나로 통합
* 매개변수로 초기값이 존재함
<pre>
	let someNumbers: [Int] = [2, 8, 15]
	
	// 기존 for 사용
	var result: Int = 0
	for number in someNumbers {
		result += number
	}
	print(result) // 25
	
	// reduce 메서드 사용
	// 초기값이 0이고 someNumbers 내부의 모든 값을 더함
	let sum: Int = someNumbers.reduce(0, { (first: Int, second: Int) -> Int in
		return first + second
	})
	print(sum)	// 25
	
	// 초기값이 0이고 someNumbers 내부의 모든 값을 뺌
	var subtract: Int = someNumbers.reduce(0, { first: Int, second: Int) -> Int in
		return first - second
	})
	print(subtract)	// -25

	// 초기값이 3이고 someNumbers 내부의 모든 값을 더함
	// 클로저 고급 사용
	// 단축인자이름, 반환타입생략, 후행클로저, 반환키워드 생략
	let sumFromThree: Int = someNumbers.reduce(3) { $0 + $1 }
	print(sumFromThree)	// 28

	let multiple: Int = someNumbers.reduce(1) { $0 * $1 }
	print(multiple)	// 240
</pre>

### sorted
* 컨테이너 정렬 후 정렬 된 새로운 컨테이너로 반환
<pre>
	let someArray: Array<Int> = [3, 2, 1]
	var sortedArray: Arrat<Int> = someArray.sorted() { $0 < $1 }
	print(sortedArray)	// [1, 2, 3]
</pre>
