//
//  ViewController.swift
//  Adapter
//
//  Created by baiwei－mac on 17/1/12.
//  Copyright © 2017年 YuHua. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //定义出游戏ab，分别指定适配器
        let gameA = GameA()
        let gameB = GameB()
        let adapterA = AdapterGameA(game: gameA)
        let adapterB = AdapterGameB(game: gameB)
        //游戏开始了，分别按下asdw按键
        adapterA.a()//Adapter.GameA左移动游戏角色
        adapterA.s()//Adapter.GameA下移动游戏角色
        adapterA.d()//Adapter.GameA右移动游戏角色
        adapterA.w()//Adapter.GameA上移动游戏角色
        adapterB.a()//Adapter.GameB左移动游戏角色
        adapterB.s()//Adapter.GameB蹲下游戏角色
        adapterB.d()//Adapter.GameB右移动游戏角色
        adapterB.w()//Adapter.GameB跳起游戏角色
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

