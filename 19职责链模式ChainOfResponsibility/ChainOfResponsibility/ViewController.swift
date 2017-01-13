//
//  ViewController.swift
//  ChainOfResponsibility
//
//  Created by baiwei－mac on 17/1/13.
//  Copyright © 2017年 YuHua. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let stu1 = Student(name: "小明", canAnswerQuestion: "1+1", next: nil)
        let stu2 = Student(name: "小黄", canAnswerQuestion: "1*2", next: stu1)
        let stu3 = Student(name: "小芳", canAnswerQuestion: "2*2", next: stu2)
        let stu4 = Student(name: "小辉", canAnswerQuestion: "3*2", next: stu3)
        
        //从4开始，自动依次调用，直到有人回答或者都没人回答结束
        stu4.answerQuestion(question: "3*2")//小辉回答：1+1=2
        stu4.answerQuestion(question: "2*2")//小芳回答：1+1=2
        stu4.answerQuestion(question: "1*2")//小黄回答：1+1=2
        stu4.answerQuestion(question: "1+1")//小明回答：1+1=2
        stu4.answerQuestion(question: "3*3")//这个问题没人知道答案！
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

