//
//  ViewController.swift
//  Strategy
//
//  Created by 余华 on 17/1/10.
//  Copyright © 2017年 余华. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //使用不同的算法，获得不同的结果
        let context = CashContext(type: .Normal)
        print("Normal结果：\(context.getResult(money: 100))")
        
        let retur = CashContext(type: .Return)
        print("Retrun结果：\(retur.getResult(money: 100))")
        
        let robate = CashContext(type: .Robate)
        print("Robate结果：\(robate.getResult(money: 100))")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

