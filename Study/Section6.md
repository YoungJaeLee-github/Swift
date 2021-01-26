## 함수 기본
### 함수선언의 기본형태
<pre>
	func 함수이름(매개변수1이름 : 매개변수1타입, 매개변수2이름 : 매개변수2타입 …) -> 반환타입 {
		함수 구현부
		return 반환값
	}
</pre>

### 반환 값이 없는 함수
<pre>
	func 함수이름(매개변수1이름 : 매개변수1타입 …) -> Void {
		함수 구현부
		(return)
	} 

	func 함수이름(매개변수1이름 : 매개변수1타입 …)  {
		함수 구현부
		(return)
	}
</pre>

### 매개변수가 없는 함수
<pre>
	func 함수이름() -> 반환타입 {
		함수 구현부
		return 반환값
	}
</pre>

### 매개변수와 반환값이 없는 함수
<pre>
	func 함수이름() -> Void {
		함수 구현부
		(return)
	}

	func 함수이름() {
		함수 구현부
		(return)
	}
</pre>