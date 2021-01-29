## 조건문
###  if-else
* () 괄호는 생략 할 수 있음
* {} 괄호는 생략 할 수 불가능
* 조건문에는 반드시 Bool 타입만 작성할 수 있음

<pre>
	if condition {
		statements
	} else if condition {
		statements
	} else {
		statements
	}
</pre>

<pre>
	let someInteger : Int = 100

	if someInteger < 100 {
		print(“100 미만”)
	} else if someInteger > 100 {
		print(“100 초과”)
	} else {
		print(“100”)
	}
</pre>

### switch
* 범위 연산자를 활용하면 더욱 쉽고 유용함
* ..< 인 경우 ~이상 ~미만
* … 인 경우 ~이상 ~이하
* break를 생략해도 됨
* 다른 언어와 같이 break를 작성하지 않았을 때의 결과를 얻고 싶으면 fallthrough 를 작성하면 됨
* case가 모두 명확히 작성되지 않는 한 꼭 default 문을 작성해야 함.

<pre>
	switch value {
		case pattern :
			code
		default : 
			code
	}
</pre>

<pre>
	switch someInteger {
		case 0:
			print(“zero”)
		case 1..<100:
			print(“1~99”)
		case 100:
			print(“100”)
		case 101…Int.max:
			print(“over 100”)
		default:
			print(“unknown”)
	}
</pre>

* 정수 외의 대부분의 기본 타입을 사용할 수 있음

<pre>
	switch “youngjae” {
		case “Jake” :
			print(“Jake”)
		case “mina” :
			print(“mina”)
		case “youngjae”:
			print(“youngjae!”)
		default : 
			print(“unknown”)
</pre>
