## 사용자 정의 연산자(Custom Operators)
* 기존에 없던 새로운 연산자를 구현하는 것
* 연산자 선언은 모든 범위에서 접근할 수 있도록 전역변수로 선언함
<pre>
	prefix operator operator(특수문자)	//연산자가 앞에 있는 경우
	postfix operator operator(특수문자)	//연산자가 뒤에 있는 경우
	infix operator operator(특수문자)	//연산자가 중간에 있는 경우
</pre>
* 모든 특수문자를 연산자로 사용할 수 있는 것은 아님

### 단독으로 사용할 수 없는 특수문자
<pre>
	(, ), {, }, [, ], ., ,, :, ;, =, @, #, &(prefix operator), ->, `, ?, !(postfix operator)
</pre>
* 반드시 다른 문자와 조합해서 사용해야 함

### 첫 번째로 사용해야 하는 특수문자
<pre>
	/, =, -, +, !, *, %, <, >, &, |, ^, ?, ~
</pre>
* 유니코드에 나와있는 문자도 첫번째로 사용할 수 있지만
* 코드의 가독성을 위해 위 문자를 첫번째로 사용해야 좋음

### 사용자 정의 연산자 작성 규칙
* 1. 연산자는 가능한 단순한 형태로 선언해야 함
* 2. 기존에 있는 연산자와 함께 사용했을 때 모호함이 없도록 선언해야 함

### 연산자 메소드
* 사용자 정의 연산자가 어떠한 동작을 하는지 구현하는 메소드
<pre>
	static prefix func operator(parameters) -> ReturnType {
	}

	static postfix func operator(parameters) -> ReturnType {
	}

	//infix(이항 연산자)의 경우 연산자 메소드에서 infx 키워드를 생략해야 함
	static func operator(parameters) -> ReturnType {
	}
</pre>

### 사용자 정의 연산자 구현
<pre>
	prefix operator +++
	extension Int {
		static prefix func +++(num: inout Int) {
			num += 2
		}
	}
	var someValue = 1
	+++a
	print(a)

	infix operator *+*
	extension Int {
		static infix func *+*(left: Int, right: Int) -> Int {
			return (left * right) + (left * right)
		}
	}

	print(1 *+* 2)
</pre>

### 우선순위 그룹(Precedence Groups)
* 사용자 정의 연산자는 별도로 우선순위 그룹을 지정해주지 않은 경우에는 기본 그룹에 추가됨(Default Precedence Groups)
* 계산식에서 결과를 얻기 위해서는 연산자의 우선순위가 필요함
* 이 때 사용하는 것이 우선순위 그룹
* 우선순위가 높은 그룹에 속한 연산자가 먼저 실행됨
* 사용자 정의 연산자 선언 시점에 우선순위 그룹을 지정함
* 우선순위 그룹은 infix(이항) 연산자를 선언할 때 함께 선언함

### 사용자 정의 연산자 우선순위 그룹
* 이미 구현되어 있는 우선순위 그룹을 지정해줄 수도 있고, 사용자가 직접 정의해서 지정해 줄 수도 있음
* 우선순위 그룹을 직접 만들 때는 UpperCamelCase로 이름을 짓는 것이 관례
<pre>
	precedencegroup Name {
		higherThan: LowerGroupName	//새로 만드려는 우선순위보다 낮은 우선순위 그룹
		lowerThan: HigherGroupName	//새로 만드려는 우선순위보다 높은 우선순위 그룹
		associativity: associativity	//연산자의 결합 규칙을 지정함 left, right, none(기본 값) -> 생략하는 경우 none으로 지정됨
	}	
</pre>
* 위 3가지 속성 모두 생략 가능하지만 higherThan 혹은 lowerThan중 1개는 반드시 지정해주어야 함

<pre>

	precedencegroup MyPrecedence {
		higherThan: Additionprecedence
	}

	infix operator *+*: MyPrecedence
	//	infix operator *+*: MultiplicationPrecedence	

	extension Int {
		static func *+*(left: Int, right: Int) -> Int {
			return (left * right) + (left * right)
		}
	}

	print(3 + 1 *+* 2)
</pre>
