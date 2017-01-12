//
//  Composite.swift
//  Composite
//
//  Created by baiwei－mac on 17/1/12.
//  Copyright © 2017年 YuHua. All rights reserved.
//

import Foundation

//画图案的协议
protocol DrawProtocol {
    func draw()
}

class Circle: DrawProtocol {
    func draw() {
        print("我负责画圆")
    }
}

class Square: DrawProtocol {
    func draw() {
        print("我负责画方形")
    }
}

class Triangle: DrawProtocol {
    func draw() {
        print("我负责画三角形")
    }
}

class Print: DrawProtocol {
    
    var drawer = [DrawProtocol]()
    
    func addDrawer(_ drawer: DrawProtocol...) {
        self.drawer.append(contentsOf: drawer)
    }
    
    func draw() {
        _ = drawer.map{$0.draw()}
    }
}
