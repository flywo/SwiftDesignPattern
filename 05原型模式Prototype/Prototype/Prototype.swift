//
//  Prototype.swift
//  Prototype
//
//  Created by baiwei－mac on 17/1/11.
//  Copyright © 2017年 YuHua. All rights reserved.
//

import Foundation


//定义了一个程序员原型，假设有一大群程序员，他们之间的区别就是姓名不同，其余都相同
class Programmer {
    
    var name: String?
    var age: Int
    var sex: String
    var language: String
    
    init(age: Int, sex: String, language: String) {
        self.language = language
        self.age = age
        self.sex = sex
    }
    
    //可以克隆自己
    func clone() -> Programmer {
        return Programmer(age: age, sex: sex, language: language)
    }
    
}
