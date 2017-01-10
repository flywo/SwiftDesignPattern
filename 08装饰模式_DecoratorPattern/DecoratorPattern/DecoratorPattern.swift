//
//  DecoratorPattern.swift
//  DecoratorPattern
//
//  Created by baiwei－mac on 17/1/10.
//  Copyright © 2017年 YuHua. All rights reserved.
//

import Foundation

class Phone {
    
    func call() -> String {
        return "拨打电话"
    }
    
    func video() -> String {
        return "播放视频"
    }
}


class iPhone: Phone {
    
    override func call() -> String {
        return "苹果拨打电话"
    }
    
    override func video() -> String {
        return "苹果播放视频"
    }
}


//装饰类
class Decorator: Phone {
    
    var phone: Phone
    
    init(phone: Phone) {
        self.phone = phone
    }
    
    override func call() -> String {
        return phone.call()
    }
    
    override func video() -> String {
        return phone.video()
    }
}


//网络
class NetDecorator: Decorator {
    
    override func call() -> String {
        return "正在使用网络:\(phone.call())"
    }
    
    override func video() -> String {
        return "正在使用网络:\(phone.video())"
    }
}


//WIFI
class WifiDecorator: Decorator {
    
    override func call() -> String {
        return "正在使用WIFI:\(phone.call())"
    }
    
    override func video() -> String {
        return "正在使用WIFI:\(phone.video())"
    }
}
