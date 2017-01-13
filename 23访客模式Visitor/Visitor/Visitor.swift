//
//  Visitor.swift
//  Visitor
//
//  Created by baiwei－mac on 17/1/13.
//  Copyright © 2017年 YuHua. All rights reserved.
//

import Foundation

//假设一个人要去访问朋友ABCD
//访客协议
protocol VisitorProtocol {
    func visit(planet: FriendA)
    func visit(planet: FriendB)
    func visit(planet: FriendC)
    func visit(planet: FriendD)
}

//朋友的协议
protocol FriendProtocol {
    func accept(vistor: VisitorProtocol)
}

//A
class FriendA: FriendProtocol {
    func accept(vistor: VisitorProtocol) {
        vistor.visit(planet: self)
    }
}

//B
class FriendB: FriendProtocol {
    func accept(vistor: VisitorProtocol) {
        vistor.visit(planet: self)
    }
}

//C
class FriendC: FriendProtocol {
    func accept(vistor: VisitorProtocol) {
        vistor.visit(planet: self)
    }
}

//D
class FriendD: FriendProtocol {
    func accept(vistor: VisitorProtocol) {
        vistor.visit(planet: self)
    }
}

//访客
class Visitor: VisitorProtocol {
    var address = ""
    func visit(planet: FriendA) {
        address = "访问了朋友A"
    }
    func visit(planet: FriendB) {
        address = "访问了朋友B"
    }
    func visit(planet: FriendC) {
        address = "访问了朋友C"
    }
    func visit(planet: FriendD) {
        address = "访问了朋友D"
    }
}


