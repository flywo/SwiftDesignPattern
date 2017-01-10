//
//  ViewController.swift
//  SimpleFactoryPattern
//
//  Created by baiwei－mac on 17/1/9.
//  Copyright © 2017年 YuHua. All rights reserved.
//

import UIKit


/*简单工厂模式
 
 定义：又称为静态工厂方法模式，属于类创建模式。在简单工厂模式中，可以根据参数的不同返回不同类的实例。该模式专门定义一个类来负责创建其他类的实例，被创建的实例通常都具有共同的父类。
 
 现实场景：比如长虹生产电视，那么长虹相当于就是工厂类，用户给长虹说，我要黑白电视，那么，就给你产一个黑白电视。
 
 优点：
 1.工厂类含有必要的判断逻辑，可以决定什么时候创建哪一个产品类的实例，使用者无需直接创建对象，仅仅使用即可。
 2.使用者无需知道所创建的具体实例的类名，只需要知道具体产品所需要的参数即可。
 3.可以通过配置文件的方式，在不修改客户端代码的情况下更改和增加新的具体实例，提高系统灵活性。
 
 缺点：
 1.所有实例创建逻辑都在工厂类中，如果该类不能正常工作，整个系统都会受到影响。
 2.使用简单工厂模式会增加系统中类的个数，一定程度上增加了系统的复杂度和理解度。
 3.系统扩展困难，一旦添加新的类，就需要修改工厂逻辑，类型较多时，可能造成逻辑过于复杂，不利于系统扩展和维护。
 4.简单工厂模式使用了静态工厂方法，造成工厂角色无法形成基于继承的等级结构。
 */


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //通过工厂类ButtonCreate的类方法可以快速创建出按钮
        let btn1 = ButtonCreate.createButton(title: "按钮一", rect: CGRect(x: 100, y: 100, width: view.frame.width-200, height: 30))
        let btn2 = ButtonCreate.createButton(title: "按钮二", rect: CGRect(x: 100, y: 200, width: view.frame.width-200, height: 30), showBorder: false)
        
        view.addSubview(btn1)
        view.addSubview(btn2)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

