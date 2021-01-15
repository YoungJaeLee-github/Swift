//
//  main.swift
//  Ex4
//
//  Created by Leeyoungjae on 2021/01/15.
//

/* Any
 * 어떠한 타입도 수용할 수 있음
 */
var someAny : Any = 100
someAny = "어떤 타입도 수용 가능함"
someAny = 123.12

//let someDouble : Double = someAny 불가능

/* AnyObject
 * 모든 클래스 인스턴스를 지칭하는 키워드
 * 클래스 인스턴스를 가짐
 */
class SomeClass {}
var someAnyObject : AnyObject = SomeClass()
//someAnyObject = 123.12 불가능

/* nil
 * 없음을 의미하는 키워드
 */
//someAny = nil 불가능, 어떠한 타입도 수용할 수 있지만, 빈 값은 수용할 수 없음
//someAnyObject = nil 불가능
