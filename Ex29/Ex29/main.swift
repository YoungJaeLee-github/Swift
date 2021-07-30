//
//  main.swift
//  Ex29
//
//  Created by 이영재 on 2021/07/30.
//
//Generic

import Foundation

struct Stack<Element> {
    var stack: Array<Element> = []

    func top() -> Element? {
        return stack[stack.count - 1]
    }

    mutating func push(_ data: Element) -> Void {
        stack.append(data)
    }

    mutating func pop() -> Element? {
        return stack.removeLast()
    }

    func isEmpty() -> Bool {
        return stack.count == 0
    }

    func size() -> Int {
        return stack.count
    }
}

var intStack: Stack<Int> = Stack()
intStack.push(1)
intStack.push(2)
print(intStack.top() ?? -1)