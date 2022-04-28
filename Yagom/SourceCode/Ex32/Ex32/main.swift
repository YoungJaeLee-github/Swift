//
//  main.swift
//  Ex32
//
//  Created by 이영재 on 2021/09/23.
//ARC(Automatic Reference Counting)

class Person {
    var name: String = "Jhone Apple"
    
    deinit { print("person deinit") }
}

var person1: Person? = Person()
var person2: Person? = person1
var person3: Person? = person1

person1 = nil
person2 = nil
person3 = nil

func foo() -> Void {
    let person: Person = Person()
}
foo()

var globalReference: Person?
func foo2() -> Void {
    let youngjae: Person = Person()
    globalReference = youngjae
//    globalReference = nil
}
foo2()

class Person2: Person {
    var car: Car?
}

class Car {
    var model: String
//    var lessee: Person2?
//    weak var lessee: Person2?
    unowned var lessee: Person2?
    
    init(model: String) {
        self.model = model
    }
    
    deinit {
        print("car deinit")
    }
}

var person4: Person2? = Person2()
var rentedCar: Car? = Car(model: "Porche")

person4?.car = rentedCar
rentedCar?.lessee = person4

person4 = nil
//print(rentedCar?.lessee)  runtime error
rentedCar = nil

class Car2 {
    var totalDrivingDistance: Double = 0.0
    var totalUsedGas: Double = 0.0
    
//    lazy var gasMileage: () -> Double = {
//        return self.totalDrivingDistance / self.totalUsedGas
//    }
    
//    lazy var gasMileage: () -> Double = { [weak self] in
//        guard let strongSelf = self else { return 0.0 }
//        return strongSelf.totalDrivingDistance / strongSelf.totalUsedGas
//    }
    
    lazy var gasMileage: () -> Double = { [unowned self] in
        return self.totalDrivingDistance / self.totalUsedGas
    }
    
    func drive() {
        self.totalDrivingDistance = 1200.0
        self.totalUsedGas = 73.0
    }
    
    deinit {
        print("car2 deinit")
    }
}

var myCar: Car2? = Car2()
myCar?.drive()
//myCar = nil

print(myCar?.gasMileage())
myCar = nil
