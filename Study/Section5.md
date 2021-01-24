## 컬렉션 타입
* 여러 값의 데이터를 묶어로 하나의 변수로 표현할 수 있는 것

### Array
* 순서(index)가 있는 리스트 컬렉션
* 선언 방법은 다양함
<pre>
	var integers : Array< Int > = Array< Int >()

	// Array에 원소를 뒤에 삽입
	integers.append(1) 
	integers.append(100)

	//Array에 해당 원소가 있는지 확인할 때 사용
	integers.contains(100) 
	integers.contains(99)

	integers.remove(at: 0) // Array의 해당 인덱스를 제거할 때 사용
	integers.removeLast() // 마지막 원소를 제거
	integers.removeAll() // 모든 원소를 제거

	integers.count // 원소의 개수

	// 다양한 Array 선언 방법 
	
	// 빈 Double Array 생성
	var doubles : Array<Double> = [Double]()
	
	// 빈 String Array 생성
	var strings : [String] = [String]()
	
	// 빈 Character Array 생성
	var characters : [Character] = []
	
	// let을 사용하여 Array를 선언하면 불변 Array
	let immutableArray = [1, 2, 3]
	// immutableArray.append(4) let 이기 때문에 불가능
	// immutableArray.removeAll() 불가능
</pre>

### Dictionary
* 키와 값의 쌍으로 이루어진 컬렉션
<pre>
	var anyDictionary : Dictionary< String, Any > = [String : Any]()
	anyDictionary[“someKey”] = “value”
	anyDictionary[“anotherKey”] = 100
	
	// 해당 키의 값을 없애고 싶을 때 사용
	anyDictionary.removeValue(forKey: “anotherKey”)
	anyDictionary[“someKey”] = nil

	// 불변의 Dictionary
	let emptyDictionary : [String : String] = [ : ]
	let initializedDictionary : [String : String] = [“name” : “youngjae”, “gender” : “male”]

	// let someValue : String = initializedDictionary[“name”]
	// key에 해당되는 value 가 존재할 수도 있고 존재하지 않을 수도 있기 때문에 불가능 함
</pre>

### Set
* 순서가 없고, 멤버가 유일한 컬렉션(중복이 없음)
* 축약 선언 방법이 없음
<pre>
	var integerSet : Set< Int > = Set< Int >()
	// Set에 원소를 삽입 할 때 사용
	integerSet.insert(1)
	integerSet.insert(100)
	integerSet.insert(99)
	integerSet.insert(99)
	integerSet.insert(99)
	
	// Set에 원소가 있는지 확인할 때 사용
	integerSet.contains(1)
	integerSet.contains(2)

	integerSet.remove(100) //  해당하는 원소를 제거할 때 사용
	integerSet.removeFirst() // 첫번째 원소를 제거할 때 사용

	integerSet.count // Set의 원소의 개수 

	// Set 응용
	let setA : Set< Int > = [1, 2, 3, 4, 5]
	let setB : Set< Int > = [3, 4, 5, 6, 7]

	let union : Set< Int > = setA.union(setB)
	let sortedUnion : [Int] = union.sorted()
	let intersection : Set< Int > = setA.intersection(setB)
	let subtracting : Set< Int > = setA.subtracting(setB) 
</pre>
