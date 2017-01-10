//
//  Proxy.swift
//  Proxy
//
//  Created by 余华 on 17/1/10.
//  Copyright © 2017年 余华. All rights reserved.
//

import Foundation

//虚拟代理
protocol Action {
    
    func run()
    func cry()
}


class Children: Action {
    
    func run() {
        print("孩子跑了")
    }
    
    func cry() {
        print("孩子哭了")
    }
}


class Youth: Action {
    
    lazy private var children: Children = Children()
    
    func run() {
        children.run()
    }
    
    func cry() {
        children.cry()
    }
}


//保护代理

protocol Door {
    
    func open()
}


class Child: Door {
    
    func open() {
        print("好的，马上来开门！")
    }
}


class Parent: Door {
    
    private var child: Child!
    
    func haveChild(have: Bool) {
        
        guard have else {
            return
        }
        child = Child()
    }
    
    func open() {
        guard child != nil else {
            print("没有孩子，我自己来开门")
            return
        }
        child.open()
    }
}



