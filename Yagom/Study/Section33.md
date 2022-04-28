## 중첩타입(Nested Types)
* 타입 내부의 타입을 뜻함
* 특별한 선언 문법이 필요한 것은 아니고, 단순히 다른 타입 내부에 타입을 선언하면 중첩타입이 됨
* 중첩타입에서 중요한 점은 이름을 표기하는 방식
* “.”을 통해 접근할 수 있음

<pre>
	class One {
		//Nested Type
		struct Two {
			//Nested Type
			enum Three {
				case a

				class Four {
				}
			}
		}
		var a = One.Two()
		//var a = Two() Two 구조체는 One 클래스에 속해 있기 때문에 두 방식 모두 가능함
	}

	let two: One.Two = One.Two()	//One클래스 외부에 있기 때문에 One.Two()를 통해 Two 구조체 타입의 인스턴스를 생성 해야 함
	let someInstance: One.Two.Three.Four = One.Two.Three.Four()
	var someValue: One.Two.Three = One.Two.Three.a
	print(someValue)
</pre>
* 중첩타입의 가장 큰 장점은 가독성임
