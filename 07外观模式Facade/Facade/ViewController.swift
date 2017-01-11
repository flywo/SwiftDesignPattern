//
//  ViewController.swift
//  Facade
//
//  Created by baiwei－mac on 17/1/11.
//  Copyright © 2017年 YuHua. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        Robot.creatRobot()
        /*
         制造头
         制造身体
         制造手臂
         制造腿
         */
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

