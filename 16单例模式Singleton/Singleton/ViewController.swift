//
//  ViewController.swift
//  Singleton
//
//  Created by baiwei－mac on 17/1/12.
//  Copyright © 2017年 YuHua. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //single是单例
        let single = Singleton.share
        print(single.index)//0
        single.index = 100
        print(single.index)//100
        //无论获取多少次，都是同一个实例
        print(Singleton.share.index)//100
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

