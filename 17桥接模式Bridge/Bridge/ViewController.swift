//
//  ViewController.swift
//  Bridge
//
//  Created by baiwei－mac on 17/1/12.
//  Copyright © 2017年 YuHua. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let map = Map()
        let camera = Camera()
        //把对应app给控制类，运行控制类的抽象接口，则会运行app的接口实现
        let control = Control(app: map)
        control.open()//打开地图，开始定位！
        control.app = camera
        control.open()//打开摄像头，开始拍照！
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

