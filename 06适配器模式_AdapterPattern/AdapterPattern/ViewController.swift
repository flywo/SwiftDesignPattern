//
//  ViewController.swift
//  AdapterPattern
//
//  Created by baiwei－mac on 17/1/10.
//  Copyright © 2017年 YuHua. All rights reserved.
//

import UIKit


/*适配器模式
 定义：将一个借口转换成客户希望的另外一个接口，适配器模式使接口不兼容的哪些类可以一起工作，其别名为包装器。适配器模式即可作为类结构型模式，也可作为对象结构型模式。
 
 现实场景：就好像一个中国人和一个外国人，要想沟通，中间得有个翻译来翻译，否则会导致语言不通，无法交流。
 
 优点：
 1.将目标类和适配者类解耦，通过引入一个适配器类来重用现有的适配者类，无需修改原有代码
 2.增加了类的透明性和复用性，将具体的实现封装在适配者类中，对于客户端类来说是透明的，而且提高了适配者的复用性
 3.灵活性和扩展性都非常好，通过使用配置文件，可以很方便的更换适配器，也可以在不修改原有代码的基础上增加新的适配器类
 
 类适配器：由于适配器类是适配者类的子类，因此可以在适配器类中置换一些适配者的方法，使得适配器的灵活性更强
 
 对象适配器：一个对象适配器可以把多个不同的适配者适配到同一个目标，也即是说，同一个适配器可以把适配者类和它的子类都适配到目标接口
 
 缺点：
 类适配器：对于不支持多继承的语言，一次最多只能适配一个适配者类，而且目标抽象类只能为抽象类，不能为具体类，其使用有一定的局限性，不能将一个适配者类和它的子类都适配到目标接口
 
 对象适配器：与类适配器相比，想置换适配者类的方法就不容易，如果一定要置换掉适配者类的一个或多个方法，就只好先做一个适配者类的子类，将适配者类的方法置换掉，然后再把适配者类的子类当做真正的适配者进行适配，实现过程较为复杂。
 */


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let player: Player = Forwards(name: "姚明")
        player.attack()
        player.defense()
        
        let foreign: Player = Translator(name: "maidi")
        foreign.attack()
        foreign.defense()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

