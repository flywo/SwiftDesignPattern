//
//  AdapterPattern.swift
//  AdapterPattern
//
//  Created by baiwei－mac on 17/1/10.
//  Copyright © 2017年 YuHua. All rights reserved.
//

import Foundation

class Player {
    
    var name: String
    
    init(name: String) {
        self.name = name
    }

    func attack() {
        print("attack失败")
    }
    
    func defense() {
        print("defense失败")
    }
    
}


class ForeignCenter {
    
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    func foreignAttack() {
        print("外国队员\(name)进攻")
    }
    
    func foreignDefense() {
        print("外国队员\(name)防守")
    }
}


class Forwards: Player {
    override func attack() {
        print("\(name)进攻")
    }
    
    override func defense() {
        print("\(name)防守")
    }
}


class Translator: Player {
    
    var foreignCenter: ForeignCenter
    
    override init(name: String) {
        self.foreignCenter = ForeignCenter(name: name)
        super.init(name: name)
    }
    
    override func attack() {
        foreignCenter.foreignAttack()
    }
    
    override func defense() {
        foreignCenter.foreignDefense()
    }
    
}
