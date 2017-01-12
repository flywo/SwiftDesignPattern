//
//  Adapter.swift
//  Adapter
//
//  Created by baiwei－mac on 17/1/12.
//  Copyright © 2017年 YuHua. All rights reserved.
//

import Foundation

//假如说游戏a中，asdw按钮分别代表游戏角色 左 下 右 上 移动，但是在游戏b中，asdw分别代表 左 蹲下 跳跃 右 的动作，此时，适配器模式就体现出用途了，游戏b写一个适配器即可使用asdw按键

//游戏协议，分别定义出asdw四个键按下后需要实现的方法
protocol AdapterProtocol {
    
    func a()
    func s()
    func d()
    func w()
}

//游戏对应的适配器
class AdapterGameA: AdapterProtocol {
    var game: GameA
    init(game: GameA) {
        self.game = game
    }
    func a() {
        game.left()
    }
    func s() {
        game.down()
    }
    func d() {
        game.right()
    }
    func w() {
        game.up()
    }
}

class AdapterGameB: AdapterProtocol {
    var game: GameB
    init(game: GameB) {
        self.game = game
    }
    func a() {
        game.left()
    }
    func s() {
        game.squat()
    }
    func d() {
        game.right()
    }
    func w() {
        game.jump()
    }
}

//两款游戏
class GameA {
    func left() {
        print("\(String(describing: self))左移动游戏角色")
    }
    func down() {
        print("\(String(describing: self))下移动游戏角色")
    }
    func right() {
        print("\(String(describing: self))右移动游戏角色")
    }
    func up() {
        print("\(String(describing: self))上移动游戏角色")
    }
}


class GameB {
    func left() {
        print("\(String(describing: self))左移动游戏角色")
    }
    func squat() {
        print("\(String(describing: self))蹲下游戏角色")
    }
    func right() {
        print("\(String(describing: self))右移动游戏角色")
    }
    func jump() {
        print("\(String(describing: self))跳起游戏角色")
    }
}


