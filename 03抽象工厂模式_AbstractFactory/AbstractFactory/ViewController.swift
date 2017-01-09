//
//  ViewController.swift
//  AbstractFactory
//
//  Created by baiwei－mac on 17/1/9.
//  Copyright © 2017年 YuHua. All rights reserved.
//

import UIKit


/*抽象工厂模式
 定义：提供一个创建一系列相关或相互依赖对象的接口，而无序指定它们具体的类，抽象工厂模式又称为Kit模式，属于对象创建型模式。
 
 现实场景：比如说长虹和海尔都生成电视和冰箱，那么长虹和海尔就是工厂模式中的工厂类的子类，电视和冰箱就是产品类中的子类。长虹和海尔都可以生产电视和冰箱，而生成出来的电视和冰箱都是可以看电视和冷冻的，同时也都会有别的不相同的功能。
 
 优点：
 1.抽象工厂模式隔离了具体类的生成，由于所有工厂都实现了产品的生成，所以更换工厂就变得相对容易。因此只要改变其中某一个工厂的方法，即可改变整个软件系统的行为。抽象工厂模式可以实现高内聚低耦合的设计目的。
 2.当一个产品族中多个对象被设计成一起工作时，能够保证客户端始终使用同一个产品族中的对象
 3.增加新的具体工厂和产品很方便，无需修改已有的系统
 
 缺点：
 1.添加新的产品对象时，难以扩展抽象工厂来生产新种类的产品，这是因为在抽象工厂角色中规定了所有可能被创建的产品集合，要支持新的种类就以为着要对接口进行扩展，这将涉及到所有子类的修改
 2.增加新的工厂和产品族容易，增加新的产品等级结构很麻烦
 
 一句话理解：简单的说，就是一个工厂父类和一个产品父类，工厂父类生成产品父类，产品实例调用各自的产品自己的方法。
 */


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let factoryA: Factory = AFactory()
        let factoryB: Factory = BFactory()
        
        let pro1: Product = factoryA.createProduct(type: "电视")!
        let pro2: Product = factoryB.createProduct(type: "电视")!
        let pro3: Product = factoryA.createProduct(type: "冰箱")!
        let pro4: Product = factoryB.createProduct(type: "冰箱")!
        
        pro1.sayName()
        pro2.sayName()
        pro3.sayName()
        pro4.sayName()
        
        /*打印结果：
         我是AbstractFactory.AFactory生产的电视
         我是AbstractFactory.BFactory生产的电视
         我是AbstractFactory.AFactory生产的冰箱
         我是AbstractFactory.BFactory生产的冰箱
         */
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

