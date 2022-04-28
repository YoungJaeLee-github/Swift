//
//  main.swift
//  Ex10
//
//  Created by 이영재 on 2021/02/05.
//
//

func someFunction(someOptionalParam: Int?) {
    //insert code...
}

func someFunction(someParam: Int) {
    //insert code...
}

someFunction(someOptionalParam: nil)
//someFunction(someParam: nil)

let optionalValue: Optional<Int> = nil
let optionalValue2: Int? = nil

var optionalValue3: Int! = 100
switch optionalValue3{
case .none:
    print("This Optional variable is nil")
case .some:
    print("Value is \(optionalValue3)")
}

optionalValue3 = optionalValue3 + 1
print(optionalValue3)
optionalValue3 = nil
print(optionalValue3)
//optionalValue3 = optionalValue3 + 1
//print(optionalValue3)

var optionalValue4: Int? = 100
switch optionalValue4 {
case .none:
    print("This Optional variable is nil")
case .some:
    print("Value is \(optionalValue4)")
}

//optionalValue4 = optionalValue4 + 1
optionalValue4 = nil