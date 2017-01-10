//
//  BridgePattern.swift
//  BridgePattern
//
//  Created by baiwei－mac on 17/1/10.
//  Copyright © 2017年 YuHua. All rights reserved.
//

import Foundation


struct Phone {
    
    var software: Software
    
    func runSoftware() {
        software.run()
    }
}


class Software {
    func run() {
        print("没有正确运行")
    }
}

class GameSoftware: Software {
    override func run() {
        print("运行游戏")
    }
}

class AddressSoftware: Software {
    override func run() {
        print("运行地址簿")
    }
}

