//
//  ViewController.swift
//  AbstractFactory
//
//  Created by baiwei－mac on 17/1/11.
//  Copyright © 2017年 YuHua. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //工厂类提供了生产所有产品的接口，使用者无需知道要生产的具体类，只需要告诉工厂要的产品类型即可
        let tv = Factory.createProduct(type: .Television)
        let bx = Factory.createProduct(type: .Refrigerator)
        tv.showYouself()//工厂生产的电视
        bx.showYouself()//工厂生产的冰箱
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

