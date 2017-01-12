//
//  Memento.swift
//  Memento
//
//  Created by baiwei－mac on 17/1/12.
//  Copyright © 2017年 YuHua. All rights reserved.
//

import Foundation

//假设一款游戏里，一个角色有生命，蓝量两个状态，当用户要打boss前，可以先备份一下，打之前状态，发现打不过时，可以重新开始，从头打BOSS

struct RollState {
    var life: Int
    var blue: Int
}

class Roll {
    var state: RollState
    init(state: RollState) {
        self.state = state
    }
    func saveState() -> RollState {
        return state
    }
    func restoreState(state: RollState) {
        self.state = state
    }
    func kill() {
        state.life = 0
        state.blue = 0
    }
}
