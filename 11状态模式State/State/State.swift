//
//  State.swift
//  State
//
//  Created by baiwei－mac on 17/1/12.
//  Copyright © 2017年 YuHua. All rights reserved.
//

import Foundation

enum MoodState {
    case happy, sad, normal
}

//状态
struct State {
    var mood: MoodState
}


//一个程序员
class Programmer {
    
    var state: State
    
    init(state: State) {
        self.state = state
    }
    
    func programming() {
        switch state.mood {
        case .happy:
            print("心情不错，开开心心的写程序")
        case .sad:
            print("心情糟糕，不想写程序")
        case .normal:
            print("心情正常，慢慢悠悠的写程序")
        }
    }
}
