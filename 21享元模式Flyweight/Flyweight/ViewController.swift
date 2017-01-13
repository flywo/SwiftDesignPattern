//
//  ViewController.swift
//  Flyweight
//
//  Created by baiwei－mac on 17/1/13.
//  Copyright © 2017年 YuHua. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let shop = GroceryStore()
        let commodity1 = shop.buyCommodity(name: "电视")//没有电视，会去创建新的对象
        print(commodity1)
        /*
         没有这个货，给你制造！
         商品名称：电视
         */
        let commodity2 = shop.buyCommodity(name: "电视")//已经有电视了，去共享的list中取
        print(commodity2)
        /*
         有货，直接给你拿！
         商品名称：电视
         */
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

