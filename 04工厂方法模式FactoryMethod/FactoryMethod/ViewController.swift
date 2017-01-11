//
//  ViewController.swift
//  FactoryMethod
//
//  Created by baiwei－mac on 17/1/11.
//  Copyright © 2017年 YuHua. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //不同的工厂子类决定了要生成的实例
        var factory: Factory = ChangHoneFactory()
        print("创建出了:\(factory.createProduct())")//创建出了:长虹电视
        factory = HaierFactory()
        print("创建出了:\(factory.createProduct())")//创建出了:海尔电视
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

