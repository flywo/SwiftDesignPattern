//
//  ChainOfResponsibility.swift
//  ChainOfResponsibility
//
//  Created by baiwei－mac on 17/1/13.
//  Copyright © 2017年 YuHua. All rights reserved.
//

import Foundation

//问题协议
protocol QuestionProtocol {
    //指定自己回答不出来，下一个回答的人
    var next: QuestionProtocol? {get set}
    //该方法用于问问题
    func answerQuestion(question: String)
}

struct Student: QuestionProtocol {
    var name: String
    var canAnswerQuestion: String
    var next: QuestionProtocol?
    func answerQuestion(question: String) {
        switch question {
        case canAnswerQuestion:
            print("\(name)回答：1+1=2")
        case canAnswerQuestion:
            print("\(name)回答：1*2=2")
        case canAnswerQuestion:
            print("\(name)回答：2*2=4")
        case canAnswerQuestion:
            print("\(name)回答：3*2=6")
        default:
            if let next = next {
                next.answerQuestion(question: question)
            }else {
                print("这个问题没人知道答案！")
            }
        }
    }
}
