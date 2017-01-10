//
//  Decorator.swift
//  Decorator
//
//  Created by 余华 on 17/1/10.
//  Copyright © 2017年 余华. All rights reserved.
//

import Foundation


protocol Phone {
    
    func call() -> String
    
    func video() -> String
}


class iPhone: Phone {
    
    func call() -> String {
        return "苹果打电话"
    }
    
    func video() -> String {
        return "苹果看电影"
    }
}


class PhoneDecorator: Phone {
    
    var phone: Phone
    
    init(phone: Phone) {
        self.phone = phone
    }
    
    func call() -> String {
        return phone.call()
    }
    
    func video() -> String {
        return phone.video()
    }
}


final class PhoneDecoratorNet: PhoneDecorator {
    
    override func call() -> String {
        return "流量-\(phone.call())"
    }
    
    override func video() -> String {
        return "流量-\(phone.video())"
    }
}


class PhoneDecoratorWifi: PhoneDecorator {
    
    override func call() -> String {
        return "WIFI-\(phone.call())"
    }
    
    override func video() -> String {
        return "WIFI-\(phone.video())"
    }
}

