//
//  ViewController.swift
//  Decorator
//
//  Created by 余华 on 17/1/10.
//  Copyright © 2017年 余华. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let phone = iPhone()
        
        var decorator = PhoneDecorator(phone: phone)
        print(decorator.call())
        print(decorator.video())
        
        decorator = PhoneDecoratorNet(phone: phone)
        print(decorator.call())
        print(decorator.video())
        
        decorator = PhoneDecoratorWifi(phone: phone)
        print(decorator.call())
        print(decorator.video())
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

