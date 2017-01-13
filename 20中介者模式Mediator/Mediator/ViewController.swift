//
//  ViewController.swift
//  Mediator
//
//  Created by baiwei－mac on 17/1/13.
//  Copyright © 2017年 YuHua. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let factory = SteelFactory(name: "成都钢铁厂")
        let factoryLow = SteelFactoryLow(name: "劣质钢铁厂")
        let mediator = Mediator(stellFactory: factory)
        let company = RobotCompany(mediator: mediator, name: "成都机器人公司")
        //开始制造
        let robot = company.create() as! Robot
        print(robot.createFrom+"制造的机器人\(robot.name)，采用的是"+robot.steel.createFrom+"生产的"+robot.steel.name+"！")//成都机器人公司制造的机器人阿狸机器人，采用的是成都钢铁厂生产的优质钢材！
        //中介者更换了钢铁厂，钢铁厂和机器人公司是没有引用的
        
        mediator.steelFactory = factoryLow
        let robot1 = company.create() as! Robot
        print(robot1.createFrom+"制造的机器人\(robot1.name)，采用的是"+robot1.steel.createFrom+"生产的"+robot1.steel.name+"！")//成都机器人公司制造的机器人阿狸机器人，采用的是劣质钢铁厂生产的劣质钢材！
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

