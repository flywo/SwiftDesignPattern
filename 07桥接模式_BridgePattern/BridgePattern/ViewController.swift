//
//  ViewController.swift
//  BridgePattern
//
//  Created by baiwei－mac on 17/1/10.
//  Copyright © 2017年 YuHua. All rights reserved.
//

import UIKit


/*桥接模式
 定义：将抽象部分与它的实现部分分离，使它们都可以独立的变化。是一种对象结构型模式，又称柄体模式或接口模式
 
 现实场景：就像一个游戏，可以用游戏手柄控制，也可以用键盘控制，同时键盘和游戏手柄又可以控制多个游戏
 
 优点：
 1.分离抽象接口和实现部分
 2.桥接模式类似于多继承
 3.提高系统扩充性，扩展任一维度，都不需要修改原有系统
 4.实现细节对客户透明，可以对用户隐藏实现细节
 
 缺点：
 1.会增加系统的理解和设计难度
 2.要求系统能够识别两个独立的维度，使用范围有一定的局限性
 */


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let game = GameSoftware()
        var iPhone = Phone(software: game)
        iPhone.runSoftware()
        
        let address = AddressSoftware()
        iPhone.software = address
        iPhone.runSoftware()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

