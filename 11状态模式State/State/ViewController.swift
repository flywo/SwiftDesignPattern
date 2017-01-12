//
//  ViewController.swift
//  State
//
//  Created by baiwei－mac on 17/1/12.
//  Copyright © 2017年 YuHua. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //修改programmer的state状态，即修改了programmer的programming()的行为
        let happy = State(mood: .happy)
        let programmer = Programmer(state: happy)
        programmer.programming()//心情不错，开开心心的写程序
        
        let sad = State(mood: .sad)
        programmer.state = sad
        programmer.programming()//心情糟糕，不想写程序
        
        let normal = State(mood: .normal)
        programmer.state = normal
        programmer.programming()//心情正常，慢慢悠悠的写程序
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

