//
//  main.swift
//  Ex30
//
//  Created by 이영재 on 2021/08/02.
//
// 서브스크립트(Subscript)
// 주로 타입의 시퀀스, 컬렉션, 리스트 등의 요소(데이터)를 반환할 때 사용
// 대표적으로 배열의 Array[index], 딕셔너리의 Dictionary[key]가 서브스크립트.
// 함수처럼 여러 개의 매개변수를 가질 수 있고, 매개변수 기본 값을 가질 수 있으나 입출력(inout) 매개변수는 가질 수 없음

struct Student {
    var name: String
    var number: Int
}

class School {
    var number: Int = 0
    var students: [Student] = [Student]()

    func addStudent(name: String) {
        let student: Student = Student(name: name, number: self.number)
        self.students.append(student)
        self.number += 1
    }

    func addStudents(names: String...) {
        for name in names {
            self.addStudent(name: name)
        }
    }

    subscript(index: Int = 0) -> Student? {
        if index < self.number {
            return self.students[index]
        }
        return nil
    }
}

let highSchool: School = School()
highSchool.addStudents(names: "MiJeong", "JuHyun", "JiYoung", "SeongUk", "MoonDuk")

let aStudent: Student? = highSchool[1]
print("\(aStudent?.number) \(aStudent?.name)")
// 매개변수 기본값 사용.
print(highSchool[]?.name)

// 타입 서브스크립트
// 타입 프로퍼티, 타입 메서드처럼 타입 자체만 사용할 수 있는 서브스크립트
// static 키워드를 사용하여 구현하며, 클래스 타입의 타입 서브스크립트는 상속받았을 시 재정의가 가능한
// class 키워드를 사용하여 구현할 수 있음, static, final class 키워드는 상속 받았을 시 재정의가 불가능함
enum School2: Int {
    case elementary = 1, middle, high, university

    static subscript(level: Int) -> School2? {
        return Self(rawValue: level)
    }
}

let school2: School2? = School2[2]
print(school2)