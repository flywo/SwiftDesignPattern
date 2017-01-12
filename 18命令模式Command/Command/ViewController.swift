//
//  ViewController.swift
//  Command
//
//  Created by baiwei－mac on 17/1/12.
//  Copyright © 2017年 YuHua. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //实例化了一个门，定义了门的动作
        let door = Door(name: "客厅门")
        let open = DoorAction(type: .open, door: door)
        let close = DoorAction(type: .close, door: door)
        let lock = DoorAction(type: .lock, door: door)
        let unlock = DoorAction(type: .unlock, door: door)
        //实例化了门管理者
        let manager = DoorManager()
        //添加门的动作
        manager.add(open, close, lock, unlock)
        //执行添加了的命令
        manager.execute()
        /*
         客厅门执行开门命令！
         客厅门执行关门命令！
         客厅门执行上锁命令！
         客厅门执行解锁命令！
         */
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

