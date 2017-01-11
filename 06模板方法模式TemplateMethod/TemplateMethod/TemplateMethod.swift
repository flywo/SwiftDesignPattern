//
//  TemplateMethod.swift
//  TemplateMethod
//
//  Created by baiwei－mac on 17/1/11.
//  Copyright © 2017年 YuHua. All rights reserved.
//

import Foundation

//定义了一套问题模板
class Question {
    
    final func question() {
        print("如果有一天，不写程序了，你会去做什么？")
        print("我会去：\(answer())")
    }
    
    //默认是养猪
    func answer() -> String {
        return "养猪"
    }
}

//子类修改answer方法来修改结果
class PersonA: Question {
    
    override func answer() -> String {
        return "下海经商"
    }
}


class PersonB: Question {
    
    override func answer() -> String {
        return "自己开公司"
    }
}
