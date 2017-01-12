//
//  ViewController.swift
//  Composite
//
//  Created by baiwei－mac on 17/1/12.
//  Copyright © 2017年 YuHua. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //单个对象可以单独使用draw函数，也可以组合到一起，使用组合后的draw
        let a = Circle()
        let b = Square()
        let c = Triangle()
        a.draw()
        b.draw()
        c.draw()
        let p = Print()
        p.addDrawer(a,b,c)
        p.draw()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

