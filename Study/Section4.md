## Any, AnyObject, nil

### Any
* Swift의 모든 자료형(타입)을 지칭하는 키워드
* 빈 값(nil)은 수용할 수 없음

<pre>
var someAny : Any = 100
someAny = “어떤 타입도 수용 가능함”
someAny = 123.12
let someDouble : Double = someAny 불가능
</pre>

### AnyObject
* 모든 클래스 타입을 지칭하는 프로토콜 
* 클래스 인스턴스만 가지고 있을 수 있음

<pre>
class SomeClass { }
var someAnyObject : AnyObject = SomeClass()

someAnyObject = 123.12 불가능
</pre>

### nil
* 없음을 의미하는 키워드
* Java의 null과 유사

<pre>
someAny = nil 불가능(어떤 타입도 수용할 수 있지만 빈 값은 수용할 수 없음)
someAnyObject = nil 불가능
</pre>
