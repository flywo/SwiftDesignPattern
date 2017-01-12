//
//  ViewController.swift
//  Iterator
//
//  Created by baiwei－mac on 17/1/12.
//  Copyright © 2017年 YuHua. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let algorithm = Algorithm(index: 10)
        var iterator = algorithm.makeIterator()
        for _ in 1...10 {
            print((iterator.next()?.index)!)
        }
        /*打印结果：
         10
         20
         30
         40
         50
         60
         70
         80
         90
         100
         */
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

