//
//  main.swift
//  Ex09
//
//  Created by 이영재 on 2021/01/30.
//

var integers : Array<Int> = Array<Int>()
integers = [1, 2, 3]
var people : Dictionary<String, Int> = Dictionary<String, Int>()
people = ["youngjae" : 10, "eric" : 20, "mike" : 15]

for integer in integers {
    print(integer)
}

for (name, age) in people {
    print("\(name): \(age)")
}

for i in 1...10 {
    print(i)
}

while integers.count > 1{
    integers.removeLast()
}

for integer in integers {
    print(integer)
}

repeat {
    integers.removeLast()
} while integers.count > 0

for integer in integers {
    print(integer)
}