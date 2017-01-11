//
//  FactoryMethod.swift
//  FactoryMethod
//
//  Created by baiwei－mac on 17/1/11.
//  Copyright © 2017年 YuHua. All rights reserved.
//

import Foundation

//定义一个总的工厂类，让其子类决定创建出什么样的对象
class Factory {
    func createProduct() -> String {
        return "电视"
    }
}

//长虹子类决定只创建长虹电视
class ChangHoneFactory: Factory {
    override func createProduct() -> String {
        return "长虹电视"
    }
}

//海尔子类只创建海尔电视
class HaierFactory: Factory {
    override func createProduct() -> String {
        return "海尔电视"
    }
}
