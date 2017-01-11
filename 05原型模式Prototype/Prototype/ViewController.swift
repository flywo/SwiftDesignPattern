//
//  ViewController.swift
//  Prototype
//
//  Created by baiwei－mac on 17/1/11.
//  Copyright © 2017年 YuHua. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //从打印结果可以得出，韩梅梅我们只要克隆李雷，然后修改他的名字就可以了，无需重新创建
        let a = Programmer(age: 18, sex: "M", language: "swift")
        a.name = "李雷"
        print(dump(a))
        /*
         ▿ Prototype.Programmer #0
         ▿ name: Optional("李雷")
         - some: "李雷"
         - age: 18
         - sex: "M"
         - language: "swift"
         Prototype.Programmer
         */
        let b = a.clone()
        b.name = "韩梅梅"
        print(dump(b))
        /*
         ▿ Prototype.Programmer #0
         ▿ name: Optional("韩梅梅")
         - some: "韩梅梅"
         - age: 18
         - sex: "M"
         - language: "swift"
         Prototype.Programmer
         */
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

