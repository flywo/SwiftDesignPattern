//
//  Facade.swift
//  Facade
//
//  Created by baiwei－mac on 17/1/11.
//  Copyright © 2017年 YuHua. All rights reserved.
//

import Foundation

class Robot {
    //只需要调用该接口即可，内部的子系统无需使用者依次调用
    static func creatRobot() {
        Head.createHead()
        Body.createBody()
        Arm.createArm()
        Leg.createLeg()
    }
}


class Head {
    static func createHead() {
        print("制造头")
    }
}

class Body {
    static func createBody() {
        print("制造身体")
    }
}

class Arm {
    static func createArm() {
        print("制造手臂")
    }
}

class Leg {
    static func createLeg() {
        print("制造腿")
    }
}
