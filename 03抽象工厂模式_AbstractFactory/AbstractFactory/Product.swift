//
//  Product.swift
//  AbstractFactory
//
//  Created by baiwei－mac on 17/1/9.
//  Copyright © 2017年 YuHua. All rights reserved.
//

import Foundation

class Product {
    
    var from = "未知"
    
    func sayName() {
        print("子类不知道自己要说什么！")
    }
}

class TV: Product {
   
    internal override func sayName() {
        print("我是\(from)生产的电视")
    }
}

class Freezer: Product {
    
    internal override func sayName() {
        print("我是\(from)生产的冰箱")
    }
}
