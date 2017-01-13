//
//  Mediator.swift
//  Mediator
//
//  Created by baiwei－mac on 17/1/13.
//  Copyright © 2017年 YuHua. All rights reserved.
//

import Foundation

//制造协议
protocol CreateProtocol {
    var name: String {get set}
    func create() -> Any
}

//钢铁
struct Steel {
    var name: String
    var createFrom: String
}

//机器人结构体
struct Robot {
    var name: String
    var steel: Steel
    var createFrom: String
}

//优质造铁厂
class SteelFactory: CreateProtocol {
    var name: String
    init(name: String) {
        self.name = name
    }
    func create() -> Any {
        return Steel(name: "优质钢材", createFrom: name)
    }
}

//劣质造铁厂
class SteelFactoryLow: CreateProtocol {
    var name: String
    init(name: String) {
        self.name = name
    }
    func create() -> Any {
        return Steel(name: "劣质钢材", createFrom: name)
    }
}

//制造机器人的公司
class RobotCompany: CreateProtocol {
    var mediator: Mediator
    var name: String
    init(mediator: Mediator, name: String) {
        self.name = name
        self.mediator = mediator
    }
    //机器人制造公司需要钢材，然后向中介者要钢材，中介者去向工厂要。中介者和工厂没有相互引用，工厂可以被替换。
    func create() -> Any {
        return Robot(name: "阿狸机器人", steel: mediator.needSteel(), createFrom: name)
    }
}

//中介者
class Mediator {
    var steelFactory: CreateProtocol
    init(stellFactory: SteelFactory) {
        self.steelFactory = stellFactory
    }
    //向中介者要钢材
    func needSteel() -> Steel {
        return steelFactory.create() as! Steel
    }
}

