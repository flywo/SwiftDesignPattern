//
//  FacadePattern.swift
//  FacadePattern
//
//  Created by baiwei－mac on 17/1/10.
//  Copyright © 2017年 YuHua. All rights reserved.
//

import Foundation


class Work {
    
    let p1 = P1()
    let p2 = P2()
    
    func meeting() {
        p1.meeting()
        p2.meeting()
    }
}

class P1 {
    
    func meeting() {
        print("p1在开会")
    }
}

class P2 {
    
    func meeting() {
        print("p2在开会")
    }
}

