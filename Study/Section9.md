## 반복문
### for-in

<pre>
	for item in items {
		insert code
	}
</pre>

<pre>
	var integers : Array< Int > = Array< Int >()
	integers = [1, 2, 3]
	var people : Dictionary< String, Int > = Dictionary< String, Int >()
	people = ["youngjae" : 10, "eric" : 20, "mike" : 15]

	for integer in integers {
		print(integer)
	}
	
	for (name, age) in people {
		print(“\(name): \(age)”)
	}
</pre>

### while
* () 괄호는 생략 가능
* 조건부분에는 반드시 Bool 타입이 작성되어야 함

<pre>
	while condition {
		insert code
	}
</pre>

<pre>
	while integers.count > 1 {
		integers.removeLast()
	}
</pre>

### repeat-while
* do-while과 매우 유사

<pre>
	repeat {
		insert code
	} while condition
</pre>

<pre>
	repeat {
		integers.removeLast()
	} while integers.count > 0
</pre>
