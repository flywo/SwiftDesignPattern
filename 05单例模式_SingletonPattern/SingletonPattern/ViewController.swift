//
//  ViewController.swift
//  SingletonPattern
//
//  Created by baiwei－mac on 17/1/10.
//  Copyright © 2017年 YuHua. All rights reserved.
//

import UIKit


/*单例模式
 定义：单例模式确保某一个类只有一个实例，而且自行实例化并向整个系统提供这个实例，这个类称为单例类，提供全局访问的方法。单例模式要点：1.某个类只能有一个实例 2.必须自行创建这个实例 3.必须自行向整个系统提供这个实例。单例模式是一种对象创建模式。又名：单件模式或单态模式。
 
 现实场景：一个公司只有一个老总。
 
 优点：
 1.提供了唯一实例，可以严格控制用户怎么样访问以及何时访问
 2.由于系统只存在一个对象，可以节约资源，对一些频繁创建和销毁的对象，单例模式提供系统性能
 3.允许可变数目的实例，可以通过单例获得指定个数对象的实例
 
 缺点：
 1.单例模式没有抽象层，扩展有很大难度
 2.单例类职责过重，违背了单一职责的原则
 3.滥用单例会有一些负面问题，比如有的语言中，如果单例长时间不被利用，系统会认为是垃圾，被销毁，这将导致对象状态的丢失
 */


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let s1 = SingleOnce.shared
        let s2 = SingleOnce.shared
        let s3 = SingleOnce.shared
        
        //打印三个对象的地址
        debugPrint(Unmanaged.passUnretained(s1).toOpaque())
        debugPrint(Unmanaged.passUnretained(s2).toOpaque())
        debugPrint(Unmanaged.passUnretained(s3).toOpaque())
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

