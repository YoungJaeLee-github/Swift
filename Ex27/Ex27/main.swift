//
//  main.swift
//  Ex27
//
//  Created by 이영재 on 2021/07/29.
//
// 오류 처리, Error Handling
// Error 프로토콜과 (주로) 열거형 사용

//MARK: - Error 정의
enum VendingMachineError: Error {
    case invalidInput
    case insufficientFunds(moneyNeeded: Int) // 열거형 연관값(Associated Value)
    case outOfStock
}

//MARK: - Error throws, throw
class VendingMachine {
    let itemPrice: Int = 100
    var itemCount: Int = 5
    var deposited: Int = 0

    // 오류가 발생할 가능성이 있는 경우
    // 함수에 throws 키워드 사용
    func receiveMoney(_ money: Int) throws -> Void {
        guard money > 0 else {
            // Error를 던짐
            throw VendingMachineError.invalidInput
        }
        // 정상 처리
        self.deposited += money
        print("\(money)원 받음.")
    }

    func vend(numberOfItems numberOfItemsToVend: Int) throws -> String {
        guard numberOfItemsToVend > 0 else {
            throw VendingMachineError.invalidInput
        }

        guard numberOfItemsToVend * itemPrice <= deposited else {
            let moneyNeeded: Int = numberOfItemsToVend * itemPrice - deposited
            throw VendingMachineError.insufficientFunds(moneyNeeded: moneyNeeded)
        }

        guard itemCount >= numberOfItemsToVend else {
            throw VendingMachineError.outOfStock
        }

        self.deposited -= numberOfItemsToVend * itemPrice
        self.itemCount -= numberOfItemsToVend

        return "\(numberOfItemsToVend)개 제공함"
    }
}

//MARK: - Error Handling
let machine: VendingMachine = VendingMachine()
var result: String?

//MARK - do-catch(try), try?, try!
// 에러 발생 가능성이 있는 함수를 호출 할 때는
// try, try?, try! 키워드 사용
// do-catch(try)
do {
    try machine.receiveMoney(0)
} catch VendingMachineError.invalidInput {
    print("입력이 잘못되었습니다.")
} catch VendingMachineError.insufficientFunds(let moneyNeeded){
    print("\(moneyNeeded)원이 부족합니다.")
} catch VendingMachineError.outOfStock {
    print("수량이 부족합니다.")
}

do {
    try machine.receiveMoney(300)
} catch(let error) {
    switch error {
    case VendingMachineError.invalidInput:
        print("입력이 잘못되었습니다.")
    case VendingMachineError.insufficientFunds(let moneyNeeded):
        print("\(moneyNeeded)원이 부족합니다.")
    case VendingMachineError.outOfStock:
        print("수량이 부족합니다.")
    default:
        print("알 수 없는 에러 \(error)")
    }
}

do {
    result = try machine.vend(numberOfItems: 4)
} catch {
    print(error)
}

do {
    result = try machine.vend(numberOfItems: 4)
}

// try?
// error가 발생하면 nil을 반환, 정상적으로 작동하면 optional값을 반환

result = try? machine.vend(numberOfItems: 2)
print(result!)

result = try? machine.vend(numberOfItems: 2)
if let printValue = result {
    print(printValue)
} else {
    print("nil")
}

// try!
// error가 발생하지 않을 것이라고 확신 할 때 사용
// 정상적으로 값이 반환되었을 때 옵셔널을 추출해서 받을 수 있다는 장점이 있지만,
// 오류가 발생하여 nil을 반환받을 경우 Runtime Error가 발생하므로
// 신중하게 사용 해야 함
result = try! machine.vend(numberOfItems: 1)
print(result!)

//result = try! machine.vend(numberOfItems: 1) // Runtime Error
//print(result!)

