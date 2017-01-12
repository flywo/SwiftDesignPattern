//
//  ViewController.swift
//  Memento
//
//  Created by baiwei－mac on 17/1/12.
//  Copyright © 2017年 YuHua. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let state = RollState(life: 100, blue: 100)//初始化角色
        let roll = Roll(state: state)
        
        let mementoState = roll.saveState()
        print(dump(roll))
        /*打印角色初始状态
         ▿ Memento.Roll #0
         ▿ state: Memento.RollState
         - life: 100
         - blue: 100
         Memento.Roll
         */
        roll.kill()
        print(dump(roll))
        /*角色死亡状态
         ▿ Memento.Roll #0
         ▿ state: Memento.RollState
         - life: 0
         - blue: 0
         Memento.Roll
         */
        roll.restoreState(state: mementoState)
        print(dump(roll))
        /*角色恢复后状态
         ▿ Memento.Roll #0
         ▿ state: Memento.RollState
         - life: 100
         - blue: 100
         Memento.Roll
         */
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

