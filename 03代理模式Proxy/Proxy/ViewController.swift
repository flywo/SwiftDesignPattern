//
//  ViewController.swift
//  Proxy
//
//  Created by 余华 on 17/1/10.
//  Copyright © 2017年 余华. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //虚拟代理
        let virtual = Youth()
        virtual.run()
        virtual.cry()
        
        //保护代理
        let parent = Parent()
        parent.open()
        parent.haveChild(have: true)
        parent.open()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

