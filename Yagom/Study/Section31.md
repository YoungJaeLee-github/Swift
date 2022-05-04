## 접근제어
* 접근제어는 코드끼리 상호작용을 할 때 파일 간 또는 모듈 간에 접근을 제한할 수 있는 기능
* 접근제어를 통해 코드의 상세 구현은 숨기고 허용된 기능만 사용하는 인터페이스를 제공할 수 있음

### 접근제어의 필요성
* 객체지향 프로그래밍 패러다임에서 중요한 캡슐화와 은닉화를 구현하는 이유는 외부에서 보거나 접근하면 안되는 코드가 있기 때문
* 불필요한 접근으로 의도치 않은 결과를 초래하거나 꼭 필요한 부분만 제공을 해야하는데 전체 코드가 노출될 가능성이 있을 때 접근제어를 이용함

### 모듈과 소스파일
* Swift의 접근제어는 모듈과 소스파일을 기반으로 설계 되었음
* 모듈은 배포할 코드의 묶음 단위이며, 통상 하나의 프레임워크나 라이브러리 또는 애플리케이션이 모듈 단위가 될 수 있음
* 모듈은 Swift에서 import 키워드를 사용해 불러 올 수 있음
* 소스파일은 하나의 스위프트 소스 코드 파일을 의미함
* Java 혹은 Objective-C와 같은 기존의 프로그래밍 언어에서는 통상 파일 하나에 타입을 하나만 정의함
* Swift에서도 보통 파일 하나에 타입 하나만 정의하지만, 때로는 소스파일 하나에 여러 타입(여러 개의 클래스나 구조체, 열거형 등)이나 함수 등 많은 것을 정의하거나 구현할 수도 있음

### 접근수준
* 접근제어는 접근수준(Access Level) 키워드를 통해 구현할 수 있음. 각 타입(클래스, 구조체, 열거형 등)에 특정 접근수준을 지정할 수 있고, 타입 내부의 프로퍼티, 메서드, 이니셜라이저, 서브스크립트 각각에도 접근수준을 지정할 수 있음
* 접근 수준을 명시할 수 있는 키워드는 open(클래스 및 클래스의 멤버에서만 사용), public, internal, fileprivate, private 다섯 가지
* Swift의 접근수준은 기본적으로 모듈과 소스파일에 따라 구분함
* open -> private으로 갈수록 접근도가 낮아지며 접근할 수 있는 범위가 좁아짐

### 공개 접근수준 - public
* public 키워드로 접근수준이 지정된 요소는 어디서든 쓰일 수 있음
* 자신이 구현된 소스파일은 물론, 그 소스파일이 속해 있는 모듈, 그 모듈을 가져다 쓰는 모듈 등 모든 곳에서 사용할 수 있음
* 공개 접근수준은 주로 프레임워크에서 외부와 연결될 인터페이스를 구현하는데 많이 쓰임
* Swift의 기본 요소는 모두 공개 접근수준으로 구현되어 있다고 생각하면 됨
<pre>
	public struct Bool {
		public init()
	}
</pre>

### 개방 접근수준 - open
* open 키워드로 지정할 수 있는 개방 접근수준은 공개 접근수준 이상으로 높은 접근수준이며, 클래스와 클래스의 멤버에서만 사용할 수 있음
* 기본적으로 공개 접근수준과 비슷하지만 다음과 같은 차이점이 있음
1. 개방 접근수준을 제외한 다른 모든 접근수준의 클래스는 그 클래스가 정의된 모듈 안에서만 상속할 수 있음
2. 개방 접근수준을 제외한 다른 모든 접근수준의 클래스 멤버는 해당 멤버가 정의된 모듈 안에서만 재정의할 수 있음
3. 개방 접근수준의 클래스는 그 클래스가 정의된 모듈 밖의 다른 모듈에서도 상속할 수 있음
4. 개방 접근수준의 클래스 멤버는 해당 멤버가 정의된 모듈 밖의 다른 모듈에서도 재정의할 수 있음
<pre>
	open class NSString : NSObject, NSCopying, NSMutableCopying, NSSecureCoding {
	open var length: Int { get }
	open func character(at index: Int) -> unichar
	public init()
	public init?(coder aDecoder: NSCoder)
}
</pre>

### 내부 접근수준 - internal
* internal 키워드로 지정하는 내부 접근수준은 기본적으로 모든 요소에 암묵적으로 지정하는 기본 접근수준
* 내부 접근수준으로 지정된 요소는 소스파일이 속해 있는 모듈 어디에서든 쓰일 수 있음
* 다만 그 모듈을 가져다 쓰는 외부 모듈에서는 접근할 수 없음
* 보통 외부에서 사용할 클래스나 구조체가 아니며, 모듈 내부에서 광역적으로 사용할 경우 내부 접근 수준을 지정함

### 파일외부비공개 접근수준 - fileprivate
* 파일외부비공개 접근수준으로 지정된 요소는 그 요소가 구현된 소스파일 내부에서만 사용할 수 있음
* 해당 소스파일 외부에서 값이 변경되거나 함수를 호출하면 부작용이 생길 수 있는 경우에 사용하면 좋음

### 비공개 접근수준 - private
* 비공개 접근수준은 가장 한정적인 범위
* 비공개 접근수준으로 지정된 요소는 그 기능을 정의하고 구현한 범위 내에서만 사용할 수 있음
* 비공개 접근수준으로 지정한 기능은 심지어 같은 소스파일 안에 구현한 다른 타입이나 기능에서도 사용할 수 없음

### 접근제어 구현
* 접근제어는 접근수준을 지정해서 구현할 수 있음
* 각각의 접근수준을 요소 앞에 지정해주기만 하면 됨
* internal(내부 접근수준)은 기본 접근수준이므로 굳이 표기해주지 않아도 됨
<pre>
	//개방 접근수준
	//class 타입과 class 타입 멤버에서만 사용 가능
	//어디서든 접근 가능하며 어디서든 상속, 재정의 가능함
	open class OpenClass {
		open var openProperty: Int = 0
		public var publicProperty: Int = 0
		…
	}
	
	// 공개 접근수준
	//어디든 접근 가능
	//public class의 경우 모듈 내에 정의되어 있지 않으면
	//상속, 재정의 불가능
	public class PublicClass {}	
	public struct PublicStruct {}
	…
	
	//내부 접근수준
	//모듈 내에 소스파일에서 접근 가능
	(internal) class InternalClass {}	//internal 접근수준은 생략 가능
	…

	//파일외부비공개 접근수준
	//소스파일 내부에서만 접근 가능
	fileprivate class FilePrivateClass {}

	//외부비공개 접근수준
	//정의하고 구현한 범위 내에서만 사용 가능
	private enum PrivateEnum {}
</pre>

### 접근제어 구현 참고사항
* 모든 타입에 적용되는 접근수준의 규칙은 ‘상위 요소보다 하위 요소가 더 높은 접근수준을 가질 수 없음’
* 함수의 전달인자로 특정 접근수준이 부여된 타입이 매개변수로 전달 받는다면 그 타입의 접근수준보다 함수의 접근수준이 높을 수 없음(타입은 함수보다 상위 요소이기 때문)
* 즉, 상위요소는 하위요소의 접근수준보다 크거나 같아야 하며, 반대로 하위요소는 상위요소의 접근수준보다 작거나 같아야 함

#### 잘못된 접근수준 부여
<pre>
	private class AClass {
		public func someMethod()	// 상위요소인 클래스의 접근수준이 더 낮기 때문에 하위요소인 메서드의 접근수준이 높을 수 없음, 따라서 해당 메서드의 접근수준도 비공개 접근수준으로 취급됨
	}
	
	//하위요소인 함수가 상위요소인 클래스 타입보다 접근수준이 높으므로
	//오류발생
	public func someFunc(a: AClass) -> AClass
</pre>

### private과 fileprivate
* 같은 파일 내부에서 private 접근수준과 fileprivate 접근수준은 사용할 때 분명한 차이가 있음
* fileprivate 접근수준으로 지정한 요소는 같은 파일 어떤 코드에서도 접근할 수 있음
* 반면에 private 접근수준으로 지정한 요소는 같은 파일 내부에 다른 타입의 코드가 있더라도 접근이 불가능함
* 그러나 자신을 확장하는 Extension 코드가 같은 파일에 존재하는 경우에는 접근할 수 있음

### 읽기 전용 구현
* 구조체 또는 클래스를 사용하여 저장 프로퍼티를 구현할 때는 허용된 접근수준에서 프로퍼티 값을 가져갈 수 있음
* 값을 변경할 수 없도록 구현하고 싶다면 설정자만 더 낮은 접근수준을 갖도록 제한할 수 있음
* 요소의 접근수준 키워드 뒤에 `(요소)접근수준 (설정자)접근수준(set)` 처럼 표현하면 설정자의 접근수준만 더 낮도록 지정해줄 수 있음
* 설정자 접근수준 제한은 프로퍼티, 서브스크립트, 변수 등에 적용될 수 있으며, 해당 요소의 접근수준보다 같거나 낮은 수준으로 제한해주어야 함

<pre>
	public struct SomeType {
		public private(set) var publicGetOnlyStoredProperty: Int = 0
	}

	var someInstance: SomeType = SomeType()
	print(someInstance.publicGetOnlyStoredProperty)
	//someInstance.publicGetOnlyStoredProperty = 100	//오류 발생
</pre>