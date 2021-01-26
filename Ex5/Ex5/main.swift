//
//  main.swift
//  Ex5
//
//  Created by 이영재 on 2021/01/25.
//

import Foundation

//Collection

// Array
var integers : Array<Int> = Array<Int>()
integers.append(1)
integers.append(100)

print(integers.count)
print(integers.contains(100))
print(integers.contains(99))

integers.remove(at: 0)
integers.removeLast()
integers.removeAll()

var doubles : Array = [Double]()
var strings : [String] = [String]()
var characters : [Character] = []

let immutableArray = [1, 2, 3]

// Dictionary
var anyDictionary : Dictionary<String, Any> = [String : Any]()
anyDictionary["someKey"] = "value"
anyDictionary["anotherKey"] = 100

//print(anyDictionary["someKey"])

anyDictionary.removeValue(forKey: "anotherKey")
anyDictionary["someKey"] = nil

let emptyDictionary : [String : String] = [ : ]
let initializedDictionary : [String : String] = ["name" : "youngjae", "gender" : "male"]

// let someValue : String = initializedDictionary["name"]
// key에 해당하는 value가 존재할 수도 있고, 존재하지 않을 수도 있기 때문에 불가능 함


// Set
var integerSet : Set<Int> = Set<Int>()
integerSet.insert(1)
integerSet.insert(100)
integerSet.insert(99)
integerSet.insert(99)
integerSet.insert(99)

print(integerSet)

print(integerSet.contains(1))
integerSet.remove(100)
integerSet.removeFirst()
print(integerSet.count)

let setA : Set<Int> = [1, 2, 3, 4, 5]
let setB : Set<Int> = [3, 4, 5, 6, 7]

let union : Set<Int> = setA.union(setB)
print(union)

let sortedUnion : [Int] = union.sorted()
print(sortedUnion)

let intersection : Set<Int> = setA.intersection(setB)
print(intersection)

let subtracting : Set<Int> = setA.subtracting(setB)
print(subtracting)
