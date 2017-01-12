//
//  Bridge.swift
//  Bridge
//
//  Created by baiwei－mac on 17/1/12.
//  Copyright © 2017年 YuHua. All rights reserved.
//

import Foundation

//接口协议
protocol InterfaceProtocol {
    var app: RealizeProtocol {get set}
    func open()
}

//实现协议
protocol RealizeProtocol {
    func appOpen()
}

//操作类
class Control: InterfaceProtocol {
    var app: RealizeProtocol
    init(app: RealizeProtocol) {
        self.app = app
    }
    func open() {
        app.appOpen()
    }
}

//地图
class Map: RealizeProtocol {
    func appOpen() {
        print("打开地图，开始定位！")
    }
}

//相机
class Camera: RealizeProtocol {
    func appOpen() {
        print("打开摄像头，开始拍照！")
    }
}
