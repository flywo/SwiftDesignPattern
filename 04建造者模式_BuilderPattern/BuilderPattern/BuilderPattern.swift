//
//  File.swift
//  BuilderPattern
//
//  Created by baiwei－mac on 17/1/10.
//  Copyright © 2017年 YuHua. All rights reserved.
//

import Foundation

class PresionBuilder {
    func buildHead() {
        print("建造头部失败")
    }
    func buildBody() {
        print("建造身体失败")
    }
    func buildArm() {
        print("建造手臂失败")
    }
    func buildLeg() {
        print("建造腿失败")
    }
}


class ThinBuilder: PresionBuilder {
    override func buildArm() {
        print("建造瘦子的手")
    }
    override func buildLeg() {
        print("建造瘦子的腿")
    }
    override func buildBody() {
        print("建造瘦子的身体")
    }
    override func buildHead() {
        print("建造瘦子的头")
    }
}


class FatBuilder: PresionBuilder {
    override func buildHead() {
        print("建造胖子的头")
    }
    override func buildBody() {
        print("建造胖子的身体")
    }
    override func buildLeg() {
        print("建造胖子的腿")
    }
    override func buildArm() {
        print("建造胖子的手")
    }
}


class BuilderDirector {
    
    private var builder: PresionBuilder
    
    init(builder: PresionBuilder) {
        self.builder = builder
    }
    
    func buildPerson() {
        builder.buildArm()
        builder.buildLeg()
        builder.buildBody()
        builder.buildHead()
    }
}
