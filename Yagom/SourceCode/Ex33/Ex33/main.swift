//
//  main.swift
//  Ex33
//
//  Created by 이영재 on 2021/09/24.
//MARK: - 중첩타입(Nested Types)
class One {
    struct Two {
        enum Three {
            case a
            
            class Four {
                
            }
        }
    }
    var a = One.Two()
//    var a = Two()
}

let two: One.Two = One.Two()
let four: One.Two.Three.Four = One.Two.Three.Four()
let someValue: One.Two.Three = One.Two.Three.a
print(type(of: someValue))

