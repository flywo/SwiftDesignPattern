//
//  Singleton.swift
//  Singleton
//
//  Created by baiwei－mac on 17/1/12.
//  Copyright © 2017年 YuHua. All rights reserved.
//

import Foundation


class Singleton {
    
    var index = 0
    
    static let share = Singleton()
    private init() {}
}

