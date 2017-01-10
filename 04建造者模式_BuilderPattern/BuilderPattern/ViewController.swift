//
//  ViewController.swift
//  BuilderPattern
//
//  Created by baiwei－mac on 17/1/10.
//  Copyright © 2017年 YuHua. All rights reserved.
//

import UIKit


/*建造者模式
 定义：将一个复杂对象的构建与它的表示分离，使得同样的构建过程可以创建不同的表示。建造者模式属于对象创建模式，建造者模式也称为生成器模式。
 
 现实场景：比如一个印刷厂印刷书，印刷厂是不知道自己要印刷什么的，只有作者把印刷的内容、怎么印、用什么纸张告诉工厂才能印刷。这种模式就称为建造者模式。
 
 优点:
 1.使用者无需知道产品内部组成细节，将产品本身与产品创建过程解耦，使得相同的创建过程可以创建不同的产品对象。
 2.每一个具体建造者都相对独立，与其他具体建造者无关，可以很方便的替换具体建造者或增加新的建造者，用户使用不同的具体建造者即可得到不同的产品对象。
 3.可以更加精细的控制产品的创建过程。将复杂产品创建步骤分解在不同的方法中，使得创建过程更加清晰，也方便使用程序来控制创建过程。
 4.增加新的具体创建者无须修改原有类库代码，指挥者类针对抽象者类编程，系统扩展方便
 
 缺点：
 1.建造者模式锁创建的产品一般具有较多的共同点，其组成部分相似，如果产品之间差异很大，则不适合该模式。
 2.如果产品内部变化复杂，可能导致需要定义很多具体创建者类来实现这种变化，导致系统变得很庞大。
 
 一句话理解：一个类生成的时候，需要传入一个建造者，生成方法会通过不同的建造者生成建造者对应需要的类。
 */


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let builder = ButtonBuilder(title: "按钮", rect: CGRect(x: 100, y: 100, width: view.frame.width-200, height: 30), isRound: true)
        let btn = BuilderDirector.createButtonWithBuilder(builder: builder)
        btn.addTarget(builder, action: #selector(buttonSelected(sender: )), for: .touchUpInside)
        view.addSubview(btn)
    }
    
    func buttonSelected(sender: UIButton) {
        sender.isSelected = !sender.isSelected
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

