//
//  Command.swift
//  Command
//
//  Created by baiwei－mac on 17/1/12.
//  Copyright © 2017年 YuHua. All rights reserved.
//

import Foundation


enum DoorActionType {
    case open, close, lock, unlock
}


//命令协议，命令需要实现execute方法
protocol CommandProtocol {
    func execute()
}


//门
struct Door {
    var name: String
}


//门可以执行的操作：开门，关门，上锁，解锁
class DoorAction: CommandProtocol {
    
    var actionType: DoorActionType
    var door: Door
    
    init(type: DoorActionType ,door: Door) {
        actionType = type
        self.door = door
    }
    func execute() {
        switch actionType {
        case .open:
            print("\(door.name)执行开门命令！")
        case .close:
            print("\(door.name)执行关门命令！")
        case .lock:
            print("\(door.name)执行上锁命令！")
        case .unlock:
            print("\(door.name)执行解锁命令！")
        }
    }
}


//命令管理者
class DoorManager {
    
    var actions = [CommandProtocol]()
    //添加命令
    func add(_ actions: CommandProtocol...) {
        self.actions += actions
    }
    //执行命令
    func execute() {
        _ = actions.map{$0.execute()}
    }
}

