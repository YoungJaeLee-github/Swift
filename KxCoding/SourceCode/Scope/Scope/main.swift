//
//  main.swift
//  Scope
//
//  Created by 이영재 on 2022/05/03.
//MARK: - Scope

//MARK: - Global Scope
let g1: Int = 123

func doSomething() -> Void {
    print(g1) //MARK: - Local Scope에서 상위 Scope에 접근
    
    //MARK: - Local Scope(func doSomething)
    let l1: Int = 234
    
    if true {
        //MARK: - Local Scope(func doSomething -> if)
        print(l1)   //MARK: - 상위 Scope에 접근
    }
}

//MARK: - Global Scope
let g2: Int = 456
print(g1)   //MARK: - 동일한 Scope
print(g2)
