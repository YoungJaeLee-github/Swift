//
//  main.swift
//  Ex29
//
//  Created by 이영재 on 2021/07/29.
//
// Generic 예제

//MARK: - Generic을 활용한 Stack 구현
protocol StackNeeded {
    associatedtype T
    // Data를 담을 배열
    var stack: Array<T> { get set }

    // stack의 제일 위에 있는 원소를 return
    func top() -> T?

    // stack의 크기를 return
    func size() -> Int

    // stack이 비었는지 확인
    func empty() -> Bool

    // stack의 제일 위에 있는 원소를 return 후 제거
    mutating func pop() -> T?

    // stack의 원소를 삽입
    mutating func push(data: T)
}

struct Stack<T>: StackNeeded {
    var stack: Array<T> = []

    func top() -> T? {
        guard self.stack.count > 0 else {
            return nil
        }
        return self.stack[stack.count - 1]
    }

    func size() -> Int {
        return self.stack.count
    }

    func empty() -> Bool {
        return self.stack.count == 0 ? true : false
    }

    mutating func pop() -> T? {
        guard self.stack.count > 0 else {
            return nil
        }
        return self.stack.remove(at: stack.count - 1)
    }

    mutating func push(data: T) {
        self.stack.append(data)
    }
}

var stack: Stack = Stack<Int>()
stack.push(data: 1)
stack.push(data: 2)
stack.push(data: 3)

print(stack.pop() ?? -1)
print(stack.top() ?? -1)
print(stack.size())
print(stack.empty())

