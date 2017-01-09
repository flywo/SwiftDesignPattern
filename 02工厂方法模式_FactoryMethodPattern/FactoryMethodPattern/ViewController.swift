//
//  ViewController.swift
//  FactoryMethodPattern
//
//  Created by baiwei－mac on 17/1/9.
//  Copyright © 2017年 YuHua. All rights reserved.
//

import UIKit


/*工厂方法模式
 定义：工厂方法模式，又称工厂模式、虚拟构造器模式、多态工厂模式等，属于类创建型模式。工厂方法模式中，工厂父类负责定义创建产品对象的公共接口，而工厂子类负责生成具体的产品对象，这样的目的是将产品类的实例化操作延迟到工厂子类中完成，即通过工厂子类来确定究竟应该实例化哪一个具体产品类。
 
 现实场景：比如说长虹和海尔，相当于都是工厂类的子类，两家工厂都可以生产出电视，但是两家的电视肯定是有区别的。
 
 优点：
 1.工厂方法创建客户需要的产品，隐藏了具体产品类实例化的细节，用户只需要关心产品对应的工厂即可。
 2.工厂方法模式的关键是语言的多态性，使工厂可以自主确定创建何种产品，所有具体的工厂类都具有同一个抽象父类。
 3.最大的优点是加入新的产品时，只需要增加一个继承与父工厂类的子类即可。
 
 缺点：
 1.增加新的产品时，需要编写具体的工厂类，会增加系统中类的个数，增加了系统的复杂度，会有更多类需要编译运行，增加系统额外的开销。
 2.由于考虑到系统可扩展性，需要引入抽象层，增加了系统的抽象性和理解难度，增加实现难度。
 
 一句话理解：简单的说，就是通过语言的多态特性，创建出指向工厂子类的父类实例，通过父类实例去调用父类的创建方法创建。
 */


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let squareCreate: ButtonCreate = SquareButtonCreate()
        let btn1 = squareCreate.createButton(title: "按钮一", rect: CGRect(x: 100, y: 100, width: view.frame.width-200, height: 30))
        
        let roundCreate: ButtonCreate = RoundButtonCreate()
        let btn2 = roundCreate.createButton(title: "按钮二", rect: CGRect(x: 100, y: 200, width: view.frame.width-200, height: 30))
        
        view.addSubview(btn1!)
        view.addSubview(btn2!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

