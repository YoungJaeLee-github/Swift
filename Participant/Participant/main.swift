//
//  main.swift
//  Participant
//
//  Created by 이영재 on 2021/08/07.
//
// Hash Algorithm

func solution(_ participant: [String], _ completion: [String]) -> String {
    var answer: String = ""
    var dictionary: Dictionary<String, Int> = Dictionary()

    //participant 배열에는 마라톤에 참가한 모든 선수의 이름이 담겨 있으므로
    //해당 배열의 원소를 Key로 지정
    //동명이인까지 생각 했을 때, 인원수로 value를 지정해줌
    for i in participant {
        dictionary[i] = dictionary[i] == nil ? 1 : dictionary[i]! + 1
    }

    //completion 배열의 원소를 key로 인원수를 차감해 나가면
    //동명이인이든 아니든 원소의 값이 1인 경우는 완주 하지 못한 선수

    for i in completion {
        dictionary[i] = dictionary[i]! - 1
    }

    for i in dictionary {
        if i.value != 0 {
            answer += i.key
        }
    }
    return answer
}

print(solution(["leo", "eden", "kiki"], ["eden", "kiki"]))