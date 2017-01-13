//
//  ViewController.swift
//  Interpreter
//
//  Created by baiwei－mac on 17/1/13.
//  Copyright © 2017年 YuHua. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let result: Int = IntInterpreter.interpreter(input: "14+14")
        print(result)//28
        let result2: String = StringInterpreter.interpreter(input: "14+14")
        print(result2)//1414
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

