//
//  main.swift
//  Ex31
//
//  Created by 이영재 on 2021/08/26.
//
//MARK: - 접근제어(Access Control)
//접근제어의 필요성 - 소스코드에 대한 불필요한 접근으로 의도치 않은 결과를 초래하거나 꼭 필요한 부분만 제공을 해야하는데
//전체 코드가 노출될 가능성이 있을때 접근수준을 통해 접근제어를 구현해 이를 방지할 수 있음

//open 개방 접근수준은 클래스와 클래스 멤버만 사용가능
//상위 요소보다 하위요소의 접근수준이 더 높아서는 안됨
open class OpenClass {
    open var openProperty: Int = 0
    public var publicProperty: Int = 0
}

// 공개 접근수준
public class PublicClass {}
// 내부 접근수준
internal class InternalClass {} // internal 접근수준 키워드는 생략 가능
// 파일외부비공개 접근수준
fileprivate class FilePrivateClass {}
// 외부비공개 접근수준
private class PrivateClass {}

//MARK: - 읽기 전용 구현
//구조체 또는 클래스를 사용하여 저장 프로퍼티를 구현할 때는 허용된 접근수준에서 프로퍼티 값을 가져갈 수 있음
//값을 변경할 수 없도록 구현하고 싶다면 설정자(setter)만 더 낮은 접근수준을 갖도록 제한할 수 있음

public struct SomeType {
    //설정자만 접근수준이 더 낮도록 구현
    //지정된 접근수준보다 같거나 낮아야 함
    public private(set) var publicGetOnlyStoredProperty: Int = 100
}

var someInstance: SomeType = SomeType()
print(someInstance.publicGetOnlyStoredProperty)
//someInstance.publicGetOnlyStoredProperty = 200    // 오류 발생, private(set) 때문