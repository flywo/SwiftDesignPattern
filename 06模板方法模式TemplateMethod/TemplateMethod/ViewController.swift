//
//  ViewController.swift
//  TemplateMethod
//
//  Created by baiwei－mac on 17/1/11.
//  Copyright © 2017年 YuHua. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let s = Question()
        s.question()
        //如果有一天，不写程序了，你会去做什么？
        //我会去：养猪
        
        let a = PersonA()
        a.question()
        //如果有一天，不写程序了，你会去做什么？
        //我会去：下海经商
        
        let b = PersonB()
        b.question()
        //如果有一天，不写程序了，你会去做什么？
        //我会去：自己开公司
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

