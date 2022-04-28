//
//  main.swift
//  Ex15
//
//  Created by 이영재 on 2021/04/24.
//
//

import Foundation

struct Sample {
    var someValue: Int = 100
}
var someInstance: Sample = Sample()

func someFunction(newInstance: Sample) -> Void {
    var instance: Sample = newInstance
    instance.someValue = 200
}

someFunction(newInstance: someInstance)
print(someInstance.someValue)

class ReferenceSample {
    var someValue: Int = 100
}

var someReference: ReferenceSample = ReferenceSample()
func someReferenceFunction(newReference: ReferenceSample) -> Void {
    let referenceInstance = newReference
    referenceInstance.someValue = 200
}

someReferenceFunction(newReference: someReference)
print(someReference.someValue)